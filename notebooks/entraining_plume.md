---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.1
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Modeling an entraining cloud updraft

This notebook calculates the time evolution of four variables:

\[velocity, height, $\theta_{ecld}$, $r_{Tcloud}$ \]

in a rising, entraining cloud with constant entrainment rate.  The environment is specified from a Wyoming sounding,
and interpolated each timestep using [scipy.interpolate.interp1d](https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.interp1d.html) 

The variables are intergrated with respect to time using [scipy.integrate.RK45](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.RK45.html)

```{code-cell} ipython3
import numpy as np
import pandas as pd
from functools import partial
from pprint import pformat
from a405.thermo.constants import constants as c
from a405.thermo.thermlib import find_Tmoist,find_rsat,find_thetaep
from scipy.interpolate import interp1d
from scipy.integrate import RK45
from a405.soundings.wyominglib import write_soundings, read_soundings
import json

import matplotlib.pyplot as plt
from a405.skewT.nudge import nudge
```

## Find the derivatives wrt time of each of the 4 variables

See [entrain.pdf](https://www.dropbox.com/scl/fi/uj7sq0hcdbcgtxomly4vd/entrain.pdf?rlkey=feaufh1d7lixg5rtdlxj4vdzu&dl=0)  notes.

For the entrainment calculation, we need environmental temperature, dewpoint and pressure at arbitrary heights.  Use [scipy.interpolate.interp1d](https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.interp1d.html) for this

```{code-cell} ipython3
def derivs(t, y, entrain_rate=None, tinterp=None, tdinterp = None, pinterp=None):
    """Function that computes the derivative vector for the ode integrator

    Parameters
    ----------
    
    t: float
       time (s)
    y: vector
       4-vector containing wvel (m/s), height (m), thetae (K), rt (kg/kg)
    entrain_rate: float
                  1/m dm/dt (s-1)
    tinterp: func
                interp1d function for environmental temperature T(z) 
    tdinterp: func
                interp1d function for environmental dewpoint temperature Td(z)
    pinterp: func
                interp1d function for presusure  p(z)

    Returns
    -------

    yp: vector
       4-vector containing time derivatives of wvel (m/s^2), height (m/s), thetae (K/s), rt (kg/kg/s)
    """
    #print(f"inside derivs")
    #print(f"{y=}")
    yp = np.zeros((4,),dtype=float)
    velocity = y[0]
    height = y[1]
    thetae_cloud = y[2]
    rt_cloud = y[3]
    #
    # fill the yp (yprime) vector with the derivatives
    #
    # yp[0] is the acceleration, in this case the buoyancy 
    #
    yp[0] = calcBuoy(height, thetae_cloud, tinterp, tdinterp, pinterp)
    press = pinterp(height)*100. #Pa
    Tdenv = tdinterp(height) + c.Tc #K
    Tenv = tinterp(height) + c.Tc #K
    rtenv = find_rsat(Tdenv, press) #kg/kg
    thetaeEnv = find_thetaep(Tdenv,Tenv, press)
    #
    # yp[1] is the rate of change of height
    #
    yp[1] = velocity
    #
    # yp[2] is the rate of change of thetae_cloud
    #
    yp[2] = entrain_rate*(thetaeEnv - thetae_cloud)
    #
    # yp[3] is the rate of change of rt_cloud
    #
    yp[3] = entrain_rate*(rtenv - rt_cloud)
    #print(f" derivs returning")
    #print(f"{yp=}")
    return yp
```

## Find the buoyancy from the cloud and environment $\theta_e$ and $r_T$

```{code-cell} ipython3
def calcBuoy(height, thetae0, tinterp, tdinterp, pinterp):
    """function to calculate buoyant acceleration for an ascending saturated parcel
       this version neglects liquid water loading
    
    Parameters
    ----------
    
    height: float
            parcel height (m)
    thetae0: float
            parcel thetae (K)

    tinterp: func
                interp1d function for environmental temperature T(z) 
    tdinterp: func
                interp1d function for environmental dewpoint temperature Td(z)
    pinterp: func
                interp1d function for presusure  p(z)

    Returns
    -------

    buoy: float
          buoyancy (m/s/s)
    """
    #input: height (m), thetae0 (K), plus function handles for
    #T,Td, press soundings
    #output: Bout = buoyant acceleration in m/s^2
    #neglect liquid water loading in the virtual temperature
    
    press=pinterp(height)*100.#%Pa
    Tcloud=find_Tmoist(thetae0,press) #K
    rvcloud=find_rsat(Tcloud,press); #kg/kg
    Tvcloud=Tcloud*(1. + c.eps*rvcloud)
    Tenv=tinterp(height) + c.Tc
    Tdenv=tdinterp(height) + c.Tc
    #print(f"inside buoy {(height,Tenv,Tdenv,press)=}")
    rvenv=find_rsat(Tdenv,press); #kg/kg
    Tvenv=Tenv*(1. + c.eps*rvenv)
    TvDiff=Tvcloud - Tvenv
    buoy = c.g0*(TvDiff/Tvenv)
    return buoy
```

## Integrator 


Use [scipy.integrate.RK45](https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.RK45.html) to integrate our system of 4 odes

```{code-cell} ipython3
def integ_entrain(df_sounding,entrain_rate):
    """integrate an ascending parcel given a constant entrainment rate
       this version hardwired to start parcel at 800 hPa with cloud base
       values of environment at 900 hPa

    Parameters
    ----------

    df_sounding: pandas dataframe 
               : cloumns are temperature, dewpoint, height, press

    entrain_rate: float
                  1/m dm/dt (s-1)

    Returns
    -------

    df_out: dataframe
          dataframe containing wvel (m/s) ,cloud_height (m) , thetae (K), rt (kg/kg) for assending parcel

   interpPress: func
              interp1d function for presusure  p(z) (used for plotting)
    """
    press = df_sounding['pres'].values
    height = df_sounding['hght'].values
    temp = df_sounding['temp'].values
    dewpoint = df_sounding['dwpt'].values
    #
    # 
    #
    envHeight= nudge(height)

    interpTenv = interp1d(envHeight,temp)
    interpTdEnv = interp1d(envHeight,dewpoint)
    interpPress = interp1d(envHeight,press)

    args=dict(entrain_rate = entrain_rate,
              tinterp=interpTenv,
              tdinterp=interpTdEnv,
              pinterp=interpPress)
    #
    # use functools.partial to supply the extra arguments to the derivs function
    # this changes the derivs function signature from
    #
    # derivs(t, y, entrain_rate=None, tinterp=None, tdinterp = None, pinterp=None)
    #
    # to 
    #
    # the_derivs(t,y) 
    #
    # as required by the RK45 integrator
    # 
    #
    the_derivs = partial(derivs,**args)
    #
    # set cloudbase (dewpoint=temperature) at 900 hPa
    #
    p900_level = len(press) - np.searchsorted(press[::-1],900.)
    rtcloud = find_rsat(dewpoint[p900_level] + c.Tc, press[p900_level]*100.)
    thetaeVal=find_thetaep(dewpoint[p900_level] + c.Tc,
                           temp[p900_level] + c.Tc,press[p900_level]*100.)
    #
    # start parcel at 800 hPa by keeping thetae and rtcloud at cloudbase
    # values (i.e. assume parcel has risen adiabatically from 900 to 800 hPa
    #
    p800_level = len(press) - np.searchsorted(press[::-1],800.)
    height_800=height[p800_level]
    winit = 0.5 #initial velocity (m/s)
    yinit = [winit, height_800, thetaeVal, rtcloud]  
    tinit = 0  #seconds
    tfin = 2500  #seconds
    dt = 10 #seconds
    tspan = (tinit, tfin)
    output_times = np.arange(tinit, tfin, dt)
    #
    # want to integrate derivs using dopr15 runge kutta described at
    # http://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.ode.html
    #
    init_vals = (yinit, tinit)
    rk45 = RK45(the_derivs, tinit, yinit, t_bound=tfin, max_step=dt)
    yout = []
    while rk45.status == "running":
        #
        # stop if wvel < 0
        #
        if rk45.y[0] < 0:
            break
        press = interpPress(rk45.y[1])*100.
        yvals= [rk45.t,press]
        yvals.extend(rk45.y)
        yout.append(yvals)
        rk45.step()
    #
    # convert the output into a pandas dataframe
    #
    colnames=['time','press','wvel','cloud_height','thetae_cloud','rt_cloud']
    df_out=pd.DataFrame.from_records(yout,columns=colnames)
    df_out = df_out.set_index('time',drop=False)
    return df_out
```

## Read in a sounding to set the environment

```{code-cell} ipython3
write = False
sounding_dir = 'littlerock'
station = 72340
year = 2012
month = 7
if write:
    values=dict(region='naconf',year=year,month=month,start='0100',stop='3000',station=station)
    write_soundings(values, sounding_dir)
    soundings= read_soundings(sounding_dir)
else:
    soundings= read_soundings(sounding_dir)
```

```{code-cell} ipython3
day = 9
hour = 0
the_time=(2012,7,day,hour)
sounding=soundings['sounding_dict'][the_time]
```

## Do the integration

```{code-cell} ipython3
entrain_rate = 2.e-4  #s^{-1}
df = integ_entrain(sounding,entrain_rate)
```

```{code-cell} ipython3
df
```

## Convert the dataframe to xarray

```{code-cell} ipython3
the_ds = df.to_xarray()
the_ds
```

## Add units to the variables plus dataset attributes

```{code-cell} ipython3
the_ds = the_ds.set_coords(['press','cloud_height'])
the_ds['press'] = the_ds['press'].assign_attrs(units = 'Pa')
the_ds['cloud_height'] = the_ds['cloud_height'].assign_attrs(units = 'm')
the_ds['wvel'] = the_ds['wvel'].assign_attrs(units = 'm/s')
the_ds['thetae_cloud'] = the_ds['thetae_cloud'].assign_attrs(units = 'K')
the_ds['rt_cloud'] = the_ds['rt_cloud'].assign_attrs(units = 'kg/kg')
the_ds.attrs = {'history': ' written by entraining_plume.ipynb',
                'sounding_dir':sounding_dir,
                'sounding_time':the_time,
                'station':station}
```

```{code-cell} ipython3
the_ds
```

```{code-cell} ipython3
the_ds['press']
```

## write the dataset to netcdf

```{code-cell} ipython3
filename = "littlerock.nc"
the_ds.to_netcdf(filename)
```

```{code-cell} ipython3
!ncdump -h littlerock.nc
```

```{code-cell} ipython3

```
