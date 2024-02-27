---
jupytext:
  formats: ipynb,md:myst
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

```{code-cell} ipython3

```

+++ {"jupyter": {"outputs_hidden": false}}

# Mixing line example

+++ {"jupyter": {"outputs_hidden": false}}

## Draw a tephigram with points at 800 and 700 hPa

We want a mxing line between two points.  The lower point has a $\theta_e$ of 338 K
and a LCL of 860 hPa, and the upper point has  a $\theta_e$ of 332 K and an LCL of 700 hPa.  We want to
draw the lower point at 900 hPa and the upper point at 800 hPa.

We need to find the temperature and dewpoint from the LCL and thetae for both levels.

Once we've got the mixing line, we can calculate the temperature and mixing ratio of any potential mixtures at any pressure.

```{code-cell} ipython3
## Blank tephigram
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---

```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
from a405.thermo.thermlib import (find_Tmoist,find_rsat,find_thetaet,find_thetaep,
                                  find_thetaes, find_Td,tinvert_thetae,find_theta,
                                  convertTempToSkew,find_lcl)
import a405.thermo.thermlib as tl
from a405.thermo.constants import constants as c
from matplotlib import pyplot as plt
import numpy as np
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
pa2hPa=1.e-2
from a405.skewT.fullskew import makeSkewWet
fig, ax = plt.subplots(1, 1, figsize=(12, 8))
ax, skew = makeSkewWet(ax,corners=[10,30])
ax.set(ylim=[1000,700])
skewLimits = convertTempToSkew([10, 30], 1.e3, skew)
out=ax.set(xlim=skewLimits)
ax.set_title("mixing line example");
```

## Check thetae with line

+++

press_levs = np.arange(1000,700,-10)*1.e2
thetae_target = 340
rvtot = 30e-3
xpoints = []
for press in press_levs:
    # 
    temp = find_Tmoist(thetae_target,press)
    xplot=convertTempToSkew(temp - c.Tc,press*pa2hPa,skew)
    xpoints.append(xplot)

ax.plot(xpoints,press_levs*pa2hPa,'g-',lw=5)
ax.set_title("moist adiabat check")
display(fig)
    
    

+++

## Add mixing line points

+++

### Find coords of lower point at its LCL

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
pa2hpa=1.e-2
kg2g = 1.e3
lcl_press=860.e2 #Pa  LCL
thetae_900=350.  #K
#
# thetae doesn't change between pressure levels
#
Temp_860=find_Tmoist(thetae_900,lcl_press) #Temp LCL
rv_860=find_rsat(Temp_860,lcl_press)  #just saturated at the LCL
rv_900 = rv_860  #vapor is conserved
rt_900 = rv_900
Tdew_860=Temp_860
print((f"temp,Tdew,rv at LCL press:  {lcl_press*pa2hpa:0.1f} hPa\n"),
      (f"Temp: {Temp_860- c.Tc:.1f} deg C\n" ),
      (f"Tdew: {Tdew_860 - c.Tc:.1f} deg C\n"),
      (f"rv: {rv_860*kg2g:.1f} g/kg"))
```

## check round trip

+++

### First find_thetaes

find_thetaes(Temp, press)

```{code-cell} ipython3
find_thetaes(Tdew_860,860.e2)
```

## Next find_thetaet
find_thetaet(Td, rt, T, p)

```{code-cell} ipython3
Td = Tdew_860
Temp = Temp_860
press=lcl_press
rt = rv_860
find_thetaet(Td,rt,Temp,press)
```

### Now bring it down a moist adiabat to 900 hPa

Add the temperature and dewpoint to the chart

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
#
# now descend adiabatically to 900 hPa
#
press=900.e2
Temp_900,rv_900,rl_900=tinvert_thetae(thetae_900,rv_900,press)
Tdew_900=find_Td(rv_900,press)
print((f"temp,Tdew,rv at:  {press*pa2hpa:0.1f} hPa\n"),
      (f"Temp: {Temp_900- c.Tc:.1f} deg C\n" ),
      (f"Tdew: {Tdew_900 - c.Tc:.1f} deg C\n"),
      (f"rv: {rv_900*1.e3:.1f} g/kg"))
#
#  draw these on the sounding at 900 hPa as a red circle and blue diamond
#
xplot=convertTempToSkew(Temp_900 - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press*pa2hPa, 'ro', markersize=14, markerfacecolor='r')
xplot=convertTempToSkew(Tdew_900 - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press*pa2hPa, 'bd', markersize=14, markerfacecolor='b')
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
#
# add the LCL
#
press=860.e2
xplot=convertTempToSkew(Temp_860 - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press*pa2hPa, 'ko', markersize=14, markerfacecolor='k')
display(fig)
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---

```

## check $\theta_e$

```{code-cell} ipython3
Tdew_900,Temp_900
```

```{code-cell} ipython3
find_thetaet(Tdew_900,rv_900,Temp_900,900.e2)
```

## check $\theta$

find_theta(temp, press, rv=0)

```{code-cell} ipython3
theta_lcl = find_theta(Temp_860, 860.e2)
print(f"{theta_lcl=:0.2f}")
```

```{code-cell} ipython3
theta_900 = find_theta(Temp_900,900.e2)
print(f"{theta_900=:0.2f}")
```

### Find coords of upper point at its LCL

LCL is 720 hPa and $\theta_e$ is 343 K

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
press_lcl=720.e2  #LCL Pa
thetae_800=343.  #K
Temp_lcl=find_Tmoist(thetae_800,press_lcl)
Tdew_lcl = Temp_lcl
rv_lcl=find_rsat(Temp_lcl,press_lcl)
print((f"temp,Tdew,rv at LCL press:  {press_lcl*pa2hpa:0.1f} hPa\n"),
      (f"Temp: {Temp_lcl- c.Tc:.1f} deg C\n" ),
      (f"Tdew: {Tdew_lcl-c.Tc:.1f} deg C\n"),
      (f"rv: {rv_lcl*kg2g:.1f} g/kg\n"))
# get the temperature and dewpoint at 800 hPa
#
```

```{code-cell} ipython3
thetaet = find_thetaet(Tdew_lcl,rv_lcl,Temp_lcl,press_lcl)
thetaet
```

## now bring down from 720 to 800 hPa

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
press=800.e2
rv_800=rv_lcl   #total water is conserved
rt_800 = rv_800
Temp_800,rv_800,rl=tinvert_thetae(thetae_800,rv_800,press)
Tdew_800=find_Td(rv_800,press)
print((f"temp,Tdew,rv at top level press:  {press*pa2hpa:0.1f} hPa\n"),
      (f"Temp: {Temp_800- c.Tc:.1f} deg C\n" ),
      (f"Tdew: {Tdew_800 - c.Tc:.1f} deg C\n"))
```

## check thetae

should be equal to 343 K

```{code-cell} ipython3
thetaet = find_thetaet(Tdew_800,rt_800,Temp_800,press)
thetaet
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
#
# put these points on the sounding at 800 hPa
#
xplot=convertTempToSkew(Temp_800 - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press*pa2hPa, 'ro', markersize=14, markerfacecolor='r')
xplot=convertTempToSkew(Tdew_800 - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press*pa2hPa, 'bd', markersize=14, markerfacecolor='b')
press = press_lcl
xplot=convertTempToSkew(Temp_lcl - c.Tc,press*pa2hPa,skew)
bot=ax.plot(xplot, press_lcl*pa2hPa, 'ko', markersize=14, markerfacecolor='k')
display(fig)
fig.savefig('mid-tephi.pdf')
```

## Question

Suppose air at 900 hPa lifts adiabatically to 800 hPa and mixes in 50% environment air.  What is the temperature and mixing ratio of that mixture at 800 hPa?  Is it saturated or unsaturated?

+++

## Find mixture LCL at 800 mb

```{code-cell} ipython3
f = 0.
thetae_mix = f*thetae_900 + (1-f)*thetae_800
thetae_mix
f=0.3
```

```{code-cell} ipython3
rt_mix = f*rt_900 + (1-f)*rt_800
rt_mix
```

```{code-cell} ipython3
press=800.e2
T_mix,rv_mix,rl_mix = tinvert_thetae(thetae_mix,rt_mix,press)
```

```{code-cell} ipython3
rl_mix
```

```{code-cell} ipython3
Td_mix = find_Td(rv_mix,press)
```

```{code-cell} ipython3
find_lcl(Td_mix,T_mix,press)
```

```{code-cell} ipython3

```
