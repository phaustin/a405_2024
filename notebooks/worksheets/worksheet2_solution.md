---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.16.0
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---

# Week 2 worksheet 2 solutions

+++

## Working with the A405 thermodynamics libraries

### Installation

+++

The source code for the libraries is in the [A405 github repository](https://github.com/phaustin/a405_2024/tree/main/src/a405).  To install on your laptop, use this [requirements.txt](https://www.dropbox.com/scl/fi/j7bg8p1hha8d21itoj1i0/requirements.txt?rlkey=g3ovng95fpw1skex969i81o76&dl=0) with pip  (note only one dash in -r, but two dashes in --update) in the a405 environment.

+++

   pip install -r requirements.txt --update

+++

or just use the line inside the requirements.txt file:

+++

   pip install -r git+https://github.com/phaustin/a405_2024.git --update

+++

#### For the 2i2c hub

If  you're on the 2i2c or UBC hubs, then you won't be able to create an a405 environment to install into.  In that case, use the following magic line at the top of your notebook:

```{code-cell} ipython3
import sys
!{sys.executable} -m pip install git+https://github.com/phaustin/a405_2024.git
```

Be sure to comment out that cell when you rerun the notebook

+++

### Documentation

+++

The A405 library modules are documented at [https://phaustin.github.io/a405_lib/full_listing.html](https://phaustin.github.io/a405_lib/full_listing.html)

+++

## Practice problems

+++

1)  **Answer**: Find the potential temperature of air at a pressure of 450 hPa and a temperature of 300 K

```{code-cell} ipython3
from a405.thermo import thermlib as tl
temp=300
press=45000
answer = tl.find_theta(temp, press, rv=0)
print(f"{answer=:0.1f} K")
```

2. Two jars of liquid water are placed in an insulated vacumn chamber with completely reflecting surfaces in the longwave.  They exchange longwave radiation until they come into equilibrium.  Neglect the water vapor in the chamber and the container material, and assume that Jar A contains 1 kg of liquid and Jar B contains 2 kg of liquid.

    a. I the 1 kg jar A starts at 350 K and the 2 kg Jar B starts at 280 K, what is the final equilibrium temperature of each jar?  
    b. What is the total change in entropy for the system composed of the two jars?  (liquid water is incompressible)

```{code-cell} ipython3
from a405.thermo.constants import constants as c
```

**2a Answer**

+++

Use the fact that $H = mass \times c_l \times temperature$
where A$c_l$ is the heat capcity of liquid water at constant pressure (or constant volume, since liquid water is incompressible

```{code-cell} ipython3
massA=1  #kg
massB=2  #kg
tempA=350  #K
tempB=280  #K
H_A=massA*c.cl*tempA  #J
H_B=massB*c.cl*tempB  #J
H_tot = H_A + H_B  #J
#
# convert this to J/kg
#
h_new = (H_A + H_B)/(massA + massB)  #J/kg
#
#  invert for temperature
#
temp_new = h_new/c.cl  #K
print(f"{temp_new=:0.1f} K")
```

**2b answer**

+++

Thompkins equation 1.48:

$$
c_p d \ln \theta=\frac{c_p d T-v d p}{T}=d \phi
$$
and since we are using liquid water, $dp=0$ and $c_p = c_l$

$$
\frac{c_l dT}{T} = c_l d\ln T=d \phi
$$

So intergrate this from time 1 to time 2.  At time 1 A=350 K and B=280 K and at time 2 both A and B = 303.3 K.  

+++

$\Delta \Phi_A = massA \times c_l \times \ln \left ( \frac{303}{350} \right )$

$\Delta \Phi_B = massB \times c_l \times \ln \left ( \frac{303}{280} \right )$

```{code-cell} ipython3
import numpy as np
total_delta_phi = massA*c.cl*np.log(303/350) + massB*c.cl*np.log(303/280.)
print(f"{total_delta_phi=:0.1f} J/K")
delta_phi = total_delta_phi/(massA + massB)
print(f"{delta_phi=:0.1f} J/K/kg")
```

```{code-cell} ipython3

```
