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

# Week 3 worksheet:  Using a rootfinder to solve implicit equations

+++

We'll need this to solve equations like finding the lifting condensation level where the dewpoint=temperature

+++

Documentation is here [scipy.optimize.brentq](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.brentq.html)

+++

## The cell below shows how to use a rootfinder to solve the equation

$$
cos(x) - 0.75 = 0
$$

The algorithm evaluates the function for increasing values of x until in sees a sign change.  It then backtracks to the other side of the sign change and starts increaing x again until it sees the sign change.  It will stop when the change in x is below a selected tolerance

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
from scipy import optimize
from matplotlib import pyplot as plt
import numpy as np
plt.style.use('ggplot')


xvals=np.linspace(0,10.)
fig,ax = plt.subplots(1,1,figsize=(10,8))
ax.plot(xvals,np.cos(xvals))
straight_line=np.ones_like(xvals)
ax.plot(xvals,straight_line*0.75,'b-')

def root_function(x):
    """Function we want to find the root of
       input: x value
       output: y value -- should be zero when x is a root
    """
    return np.cos(x) - 0.75

root1 = optimize.brentq(root_function,0,2)
root2 = optimize.brentq(root_function,4,6)
root3 = optimize.brentq(root_function,6,8)
xvals=np.array([root1,root2,root3])
yvals=np.cos(xvals)
ax.plot(xvals,yvals,'ro',markersize=20);
```

## Problem (part of this weeks assignment

Given an the Clausius Clapyron equation and a saturation vapor pressure in $es$ in Pa, find the dewpoint temperature in Kelvin, i.e. the teperature where:

es = find_esat(Tdewpoint)



```{code-cell} ipython3
def find_esat(temp):
    Tc = temp - 273.15
    esatOut = 611.2 * np.exp(17.67 * Tc / (Tc + 243.5))
    return esatOut
```
