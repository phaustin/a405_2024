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

### Solution

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
def root_function(Tguess,theta,press):
    """Function we want to find the root of
       input: Tguess (K), target theta (K), press (Pa)
       output: difference between guess and target -- should be zero when x is a root
    """
    p0=1.e5  #Pa
    Rd=287. #J/kg/K
    cp=1004.  #J/kg/K     
    theta_guess=Tguess*(p0/press)**(Rd/cp)
    return theta - theta_guess
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
def temp_from_theta(theta,press):
    """
       input: theta (K), press (Pa)
       output: temp (K) found by rootfinder
    """     
    left=10 #K
    right=1000 #K
    temp = optimize.brentq(root_function,left,right,args=(theta,press))
    return temp

for press in [1.e5,7.e4,4.e4]:
    print('Temp {:5.2f} (K) at pressure of {:5.2f} kPa'.format(temp_from_theta(280.,press),press*1e-2))
```

+++ {"jupyter": {"outputs_hidden": true}}

## Bracket finding

I've written a couple of convenience functions called rootfinder.find_interval and
rootfinder.fzero to make rootfinding a little easier.   The new module is 
[rootfinder.py](https://github.com/phaustin/A405/blob/master/a405thermo/rootfinder.py)

```{code-cell} ipython3
from a405.thermo import rootfinder as rf
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
print(help(rf.find_interval))
```

### example -- find a bracket for sin(x)=0 near x=12 radians ~ 700 degrees

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
brackets=rf.find_interval(np.sin,12)
brackets
```

## now use the fzero wrapper to find the root of sin(x)=0  (720 degrees)

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
print(rf.fzero(np.sin,brackets)*180/np.pi)
```

## Redo theta example with find_interval

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
import a405.thermo.rootfinder as rf
from importlib import reload
reload(rf)

def theta_zero(Tguess,theta,press):
    """Function we want to find the root of
       input: Tguess (K), target theta (K), press (Pa)
       output: difference between guess and target -- should be zero when x is a root
    """
    p0=1.e5  #Pa
    Rd=287. #J/kg/K
    cp=1004.  #J/kg/K     
    theta_guess=Tguess*(p0/press)**(Rd/cp)
    return theta - theta_guess
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: false
---
def temp_from_theta(theta,press):
    """
       input: theta (K), press (Pa)
       output: temp (K) found by rootfinder
    """     
    #
    #  use theta as guess for bracket and pass theta,press to theta_zero
    #
    brackets=rf.find_interval(theta_zero,theta,theta,press)
    the_temp = rf.fzero(theta_zero,brackets,theta,press)
    return the_temp

for press in [1.e5,7.e4,4.e4]:
    print('Temp {:5.2f} (K) at pressure of {:5.2f} kPa'.format(temp_from_theta(280.,press),press*1e-2))
```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---

```

```{code-cell} ipython3
---
jupyter:
  outputs_hidden: true
---

```
