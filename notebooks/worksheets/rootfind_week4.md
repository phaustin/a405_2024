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

(week4_rootfind)=
# Week 4 worksheet:  Using a rootfinder to solve implicit equations

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

## Problem (part of this weeks assignment)

Given an the Clausius Clapyron equation and a saturation vapor pressure in $es$ in Pa, find the dewpoint temperature in Kelvin, i.e. the teperature where:

es = find_esat(Tdewpoint)

```{code-cell} ipython3
from numpy.typing import ArrayLike as array
def find_esat(temp: (int, float, array)) -> (float,array):
    """
    Calculate the saturation vapor pressure at temperature temp

    Parameters
    ----------

    temp (K): temperature of liquid water

    Returns
    -------

    esatout (Pa): saturationvapor pressure
    """
    Tc = temp - 273.15
    esatOut = 611.2 * np.exp(17.67 * Tc / (Tc + 243.5))
    return esatOut
```

### Test your code here

Use [find_esat](https://phaustin.github.io/a405_lib/full_listing.html#a405.thermo.thermlib.find_esat) from the a405 thermo library to check that your dewpoint temperature produces the correct vapor press.

```{code-cell} ipython3
from a405.thermo import thermlib as tl
help(tl.find_esat)
```

```{code-cell} ipython3
tl.find_esat(270)
```

## Part 2

+++

Adapt your function so it finds the dewpoint given $r_s$, the saturation mixing ratio defined
in Thompkins equation 2.21

- That is, find T such that

  $$
    r_s(T,p) = \epsilon \frac{e_s}{p - e_s}
  $$(rs)
  where $\epsilon = \frac{R_d}{R_v}$ = 0.622


  You can use Thompkins 2.21 to check your answer, or look at my [find_rsat](https://phaustin.github.io/a405_lib/full_listing.html#a405.thermo.thermlib.find_rsat)

+++

## Part 3

+++

Use the metpy skewT library to draw two points on a skewT diagram with the same $r_s$ value at different pressure levels.   A line connecting the two points should run parallel to the constant $r_d$ lines that
are on the diagram for my [metpy example](https://phaustin.github.io/a405_2024/notebooks/week2/skew_coords_solution.html#if-you-have-extra-time).  Use this to identify the values for the constant mixing ratio lines on the plot

```{code-cell} ipython3

```
