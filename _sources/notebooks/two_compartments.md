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

(two_compartments)=
# Two compartment problem`

Two compartments of equal volume are separated by a membrane, with is punctured.

First find the "naive" entropy by just mixing the entropies of the two compartments and compare it to
the actual entropy of the mixture.

+++

- compartment 1, volume 1 $m^3$, pressure 1000 hPa, temperature 300 K
- compartment 2, volume 1 $m^3$, pressure 3000 hPa, temperature 500 K

```{code-cell} ipython3
import numpy as np 
def rho_eqstate(press, temp):
    Rd = 287
    rho = press/(Rd*temp)
    return rho

def find_theta(press,temp):
    Rd = 297
    cp = 1004
    theta = temp*(1.e5/press)**(Rd/cp)
    return theta
```

```{code-cell} ipython3
cp = 1004  #J/kg/K
Rd = 287 #J/kg/k
temp1=300  #K
press1 = 1.e5 #Pa
temp2 = 500  #K
press2 = 3.e5  #Pa
```

## Find the masses ($\rho \times volume$)

```{code-cell} ipython3
mass1 = rho_eqstate(press1,temp1)  #kg
mass2 = rho_eqstate(press2,temp2)
print(f"{(mass1, mass2)=} kg/m^3")
```

## Enthalpy is conserved for mixture

```{code-cell} ipython3
Hmix = mass1*cp*temp1 + mass2*cp*temp2
hmix = Hmix/(mass1 + mass2)
temp_mix = hmix/cp
print(f"{temp_mix:0.1f} K")
```

## Find the entropy the wrong way (it's not conserved)

```{code-cell} ipython3
theta1 = find_theta(press1,temp1)
theta2 = find_theta(press2,temp2)
entropy_naive = cp*(mass1*np.log(theta1) + mass2*np.log(theta2))/(mass1 + mass2)
print(f"{entropy_naive=:0.1f} J/kg/K")
```

## Find the entropy the right way

Get the pressure using the equation of state

```{code-cell} ipython3
rho_mix = (mass1 + mass2)/2
print(f"{rho_mix=:0.1f} kg/m^3")
```

```{code-cell} ipython3
press_mix = rho_mix*Rd*temp_mix
print(f"{press_mix=:0.1f} Pa")
```

```{code-cell} ipython3
theta_mix = temp_mix*(1.e5/press_mix)**(Rd/cp)
print(f"{theta_mix=:0.1f} K")
```

```{code-cell} ipython3
entropy_mix = cp*np.log(theta_mix)
print(f"{entropy_mix=:0.1f} J/kg/K")
```

```{code-cell} ipython3
percent_diff = (entropy_mix - entropy_naive)/entropy_mix*100
print(f"{percent_diff=:0.1f} percent")
```

## Summary

Even with a large pressure difference, the effect of irreversibilty is less than 1%

```{code-cell} ipython3

```
