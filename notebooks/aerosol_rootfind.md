# Koehler equilibrium worksheet solution

```python

import a405.dropgrow.aerolib
import numpy as np
from a405.thermo.constants import constants as c
import json
from scipy import optimize


```

## Specify the aerosol

Ammonium bisulphate

```python
aerosol_specs = {
    "Ms": 114,  #molecular weight of aerosol
    "Mw": 18.0,  #molecular weight of water
    "Sigma": 0.075,  # surface tension N/m^2
    "vanHoff": 2.0,  
    "rhoaero": 1778, #aerosol density, kg/m^3
    "themean": 2e-17,  #mean mass kg
    "sd": 1.7,  #standard deviation (kg)
    "totmass": 1.5e-09  #kg/m^3 
}

```

```python
from numpy.typing import ArrayLike as array
def lognormal(x: array,mu: float,sigma: float) -> array:
    """
    Calculate lognormal distribution for variable x

    parameters
    ----------
    x: vector (float)  
      aerosol masses (kg)  (for example)
      
    mu: log(mean mass)
       
    sigma:   log(standard deviation)
       
    returns
    -------
    
    out: vector (float)
        lognormal pdf, normalized to 1 (units: 1/[x], where [x] are the units of x)

    
    """
    out=(1/(x*sigma*np.sqrt(2*np.pi)))*np.exp(-(np.log(x) - mu)**2./(2*sigma**2.))
    return out

```

```python
def make_tuple(in_dict: dict,tupname='values'):
    """
    make a named tuple from a dictionary

    Parameters
    ----------

    in_dict: dictionary
         Any python object with key/value pairs

    tupname: string
         optional name for the new namedtuple type

    Returns
    -------

    the_tup: namedtuple
          named tuple with keys as attributes
    """
    #
    # create the class/type tup_class
    #
    tup_class = namedtuple(tupname, in_dict.keys())
    #
    # create an instance of the class with in_dict values
    #
    the_tup = tup_class(**in_dict)
    return the_tup

```

```python
def find_centers(x: array) -> array:
    """
    return a vector of bin centers given the bin edges

    Parameters
    ----------

    x: numpy 1-d vector
       vector of edges of bins

    Returns
    -------
    center: numpy 1-d vector 
       vector of centers of bins
    
    """
    center = (x[1:] + x[:-1])/2.
    return center
```

```python
#
# make 30 mass bins between 10**(-20) and 10**(-16) kg
#
mass_vals = np.linspace(-20,-16,30)
mass_vals = 10**mass_vals  # kg
mu=aerosol_specs['themean']   #kg
sigma = aerosol_specs['sd'] #kg
totmass = aerosol_specs['totmass'] #kg
#
# create a lognormal mass distribution
#
mdist = totmass*lognormal(mass_vals,np.log(mu),np.log(sigma))
mdist = find_centers(mdist)*np.diff(mass_vals)
center_mass = find_centers(mass_vals)
ndist = mdist/center_mass
```

```python
# Below we use the rootfinder to search on log(radius) to find the equilibrium
# drop size for unactivaed aerosols on the left side of their Koehler curves
```

```python
initial_conditions = {
        "Tinit": 280.0, #K
        "Zinit": 1000.0, #m
        "Pinit": 90000.0, #Pa
        "Sinit": 0.995,
        "wvel": 0.5  #m/s
    }
```

```python
from collections import namedtuple
aero=make_tuple(aerosol_specs)
parcel=make_tuple(initial_conditions)
```

```python
aero, parcel
```

```python
def find_koehler_coeffs(aero: namedtuple,parcel: namedtuple) -> tuple:
    """

    Returns the a, b coefficients for the approximate Koehler eqn

    Parameters
    ----------

    aero:
      constants used for the aerosol terms in the Koehler equation

    parcel:
          constants used for the thermodynmaic terms in the 
          droplet growth/Koehler equations

    Returns
    -------

    tuple a, b
    
    a: float
       coefficient for a/r term (m)

    b: float
       coefficient for b*m/r^3 term (m^3/kg)



    """
    a=(2.*aero.Sigma)/(c.Rv*parcel.Tinit*c.rhol)  #curvature term
    b=(aero.vanHoff*aero.Mw)/((4./3.)*np.pi*c.rhol*aero.Ms)  #solution term, no mass
    return a,b
```

```python
a, b = find_koehler_coeffs(aero,parcel)
#
# sanity check
#
m=1.e-18
SScrit=(4.*a**3./(27.*b*m))**0.5;
rcrit = (3.*m*b/a)**0.5
print((f"for an aerosol with mass = {m} kg, "
       f"SScrit,rcrit are {SScrit:8.3g}, {rcrit*1.e6:8.3g} microns"))
      
```


```python
from typing import Callable
def create_koehler(aero: namedtuple,parcel: namedtuple) -> Callable:
    """
    generate a koehler function for specific aerosol/parcel conditions
    This function produces a closure, i.e. a new function that includes the needed
    variables aero.vanHoff, aero.Mw, aero.Ms, aero.Sigma, and parcel.Tinit and
    is called with the signature find_S(r: float, m: float)

    Parameters
    ----------

    aero: namedtuple
      constants used for the aerosol terms in the Koehler equation

    parcel: namedtuple
          constants used for the thermodynmaic terms in the 
          droplet growth/Koehler equations

    Returns
    -------

    find_S: function
          function to find saturation over curved solution


    """
    def find_S(r,m):
        """
        Parameters
        ----------
        r: float (m)
           drop radius
        m: float (kg)
           aerosol mass (kg)

        Returns
        -------

        Function to calculate saturation over the curved solution drop
        """
        #
        # reset negative radii to 0.001 micron
        #
        # if r < 0.:
        #     r = 1.e-9
        # use exact koehler equation
        #
        a=(2.*aero.Sigma)/(c.Rv*parcel.Tinit*c.rhol)  #curvature term
        ns = m*aero.vanHoff/aero.Ms
        nw = 4/3.*np.pi*r**3.*c.rhol/aero.Mw
        S = (nw/(ns + nw))*np.exp(a/r)
        return S
    return find_S

```

```python
def find_interval(the_func: Callable, x: float, *args) -> tuple:
    """
    starting from a 2% difference, move out from a 
    point until the_func changes sign

    Parameters
    ----------

    the_func : function
               function that returns zero when on root
    
    x : float
        argument to the_func

    *args : tuple
            additional arguments for the_func

    Returns
    -------

    brackets : (left,right) tuple
               left,right  brackets for root 
    """
    if x == 0.:
        dx = 1. / 50.
    else:
        dx = x / 50.

    maxiter = 40
    twosqrt = np.sqrt(2)

    failed = True
    for i in range(maxiter):
        dx = dx * twosqrt
        a = x - dx
        fa = the_func(a, *args)
        b = x + dx
        fb = the_func(b, *args)
        if (fa * fb < 0.):
            failed = False
            break
    if failed:
        #
        # load the debugging information into the BracketError exception as a
        # namedtuple
        #
        values = dict(a=a,b=b,fa=fa,fb=fb,x=x,dx=dx,args=args)
        value_string = json.dumps(values)
        raise BracketError(f"Couldn't find a suitable range. Providing extra_info\n{value_string}")
    return (a, b)

```

```python
koehler_fun = create_koehler(aero,parcel)

def find_diff(logr,S_target,m):
    """
    zero function for rootfinder
    """
    r = np.exp(logr)
    the_diff = S_target - koehler_fun(r,m)
    return the_diff

S_target = parcel.Sinit

logr_start = np.log(0.1e-6)

initial_radius = []
for mass in center_mass:
    bracket1, bracket2 = find_interval(find_diff,logr_start,S_target,mass)
    args = (S_target,mass)
    answer = optimize.brentq(find_diff,
                             bracket1,
                             bracket2,
                             args = args)
    equil_rad = np.exp(answer)
    
    Scrit=(4.*a**3./(27.*b*mass))**0.5
    
    initial_radius.append(equil_rad)
    print((f'mass = {mass:6.3g} kg\n'
           f'bracket1 = {np.exp(bracket1):8.3g} m\n'
           f'bracket2={np.exp(bracket2):8.3g} m\n'
           f'critical supersaturation: {Scrit:6.3g}'))
    print(f'equlibrium radius at S={S_target} is {equil_rad*1.e6:5.3f} microns\n')
```


