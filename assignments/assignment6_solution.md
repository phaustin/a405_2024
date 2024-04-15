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

# Assignment 6 solution

## Problem 1 cloud chamber

1. Given the critical supersaturation from the kohler notes:

    $$
    SS=S^* - 1= \left ( \frac{4 a^3}{27b} \right )^{1/2}
    $$(scrit)

show that this implies, for $(NH_4)_2 SO_4$, density $\rho_{aer}$ = 1775
${kg}\,{m^{-3}}$ , van hoft i=3, that:

 $$
S^* -1 \approx 1.54 \times 10^{-12}~ m_{aer}^{-0.5}
 $$

where $m_{aer}$ is the ammonium sulphate aerosol mass in kg.

Note that this is why a cloud chamber can get the aerosol mass distribution from a series of
saturation and light scattering measurements as smaller and smaller aerosols are pushed over
their critical supersaturation and activated.

+++

### Problem 1 answer

+++

Given a and b:

$$
a=\frac{2 \sigma}{\rho_l R_v T}
$$
$$
b=\frac{i m M_w}{4 / 3 \pi \rho_s M_s}
$$

+++

Insert the definition of b into {eq}`scrit`:

$$
(S^* - 1 ) = \left (\frac{4a^3 \,4/3 \pi \rho_s M_s }{27 i M_w} \right )^{1/2}  m_{aer}^{-1/2}
$$

```{code-cell} ipython3
from a405.thermo.constants import constants as c
import numpy as np
sigma = 0.075 #N/m
temp = 280 # K
rhos = 1775 #kg/m^3
i = 3
Ms = 132  #kg/kmol
Mw = 18 #kg/kmol

a = 2*sigma/(c.rhol*c.Rv*temp)
numerator = 4*a**3.*4./3.*np.pi*rhos*Ms
denom = 27*i*Mw
coeff = (numerator/denom)**0.5
coeff
```

```{code-cell} ipython3
import numpy as np

Ms=132.  #kg/kmole
Mw=18.  #kg/kmole
Rhol=1.e3  #1000
Sigma=0.075  #N/m
rhoaero=1775.  #kg/m^3
Rv=461.   #J/kg/K
vanhoff=3
Tinit=280.  #K
a=(2.*Sigma)/(Rv*Tinit*Rhol) # units m
bnomass=(vanhoff*Mw)/((4./3.)*np.pi*Rhol*Ms)  #units m^3/kg
Scoeff=((4*a**3)/(27*bnomass))**0.5  #units  kg^{-0.5}
print(f'Scrit coeff without aerosol mass: {Scoeff:6.3e} kg**0.5')
```

- Suppose a diffusion chamber measures a cumluative number concentration
as a function of saturation and finds:

$$
  N = 10^9 (S^* -1)^{0.5}
$$(dist)
where:

\begin{equation}
  \label{cumnum}
  N(D)= \int_D^\infty n_d(D^\prime)\, dD^\prime = \int_D^\infty n_l(D^\prime)\,\mathrm{dlog} D^\prime
\end{equation}

where
N(D) is the cumulative number distribution, i.e.  the concentration
(units: $m^{-3}$ of all activated
aerosols with dry diameters greater than D measured in (\ref{dist}), 
$n_d = - dN/dD$ and $n_l(D)$= - dN/dlog(D).


Use {eq}`dist` and {ref}`scrit2` to find an equation for the 
aerosol number distribution $n_d$ or
(alternatively $n_l(D)$= - dN/dlog(D)).

+++



+++

5) First confirm that $\frac{\delta^2 E}{\delta r^2}=0$ at the critical radius:
Inserting $\Gamma^*=\left(\frac{3 b}{a}\right)^{1 / 2}$ conto (8) on $p^2$
$$
\begin{aligned}
\frac{\delta^2 E}{\partial r^2}= & -4 \pi R_v T P_l\left(2 a-\frac{3 b a}{3 b}\right)+8 \pi \sigma \\
& =-4 \pi R_v T P_l a+8 \pi \sigma
\end{aligned}
$$
but $a=\frac{26}{R_V T R_l}$ so
$$
\frac{\delta^2 E}{\delta r^2}=-4 \pi R_V T R \frac{2 \sigma}{R_V T R e}+8 \pi \sigma=-8 \pi \sigma+8 \pi \sigma=0
$$

+++

We walt to conform that $\frac{\delta^2 E}{\delta r^2}<0$ (unstable) for $r>r^*$ and $\frac{\delta^2 E}{\delta r^2}>0$ (stale)
for $r<r^*$.
That is equivalent to showing that $\frac{\delta}{\delta r}\left(\frac{\delta^2 E}{\delta r^2}\right)<0$ at $r=r_B=$

+++

Sure enough:
$$
\begin{aligned}
& \frac{\delta}{\delta r}\left(\frac{\delta^2 E}{\delta r^2}\right)=\frac{\delta}{\delta r}\left(-4 \pi R_V T \rho_l\left(-\frac{3 b}{r^2}\right)\right) \\
& =-\delta \pi R_V T \rho_l \frac{3 b}{\Gamma^3}<0 \text { at } r=i_* .
\end{aligned}
$$

+++

- Given the critical supersaturation:

$$
  S^* - 1= \left ( \frac{4 a^3}{27b} \right )^{1/2}
$$

show that this implies, for $(NH_4)_2 SO_4$, density $\rho_{aer}$= 1775
$kg\ m^{-3}$, i=3, that:

\begin{equation}
  \label{scrit2}
  S^* -1 \approx 1.54 \times 10^{-12}~ m_{aer}^{-0.5}
\end{equation}
where $m_{aer}$ is the ammonium sulphate aerosol mass in kg.

+++

- Assume $S^* - 1$ goes from 0.1 to 1\%, and use 5 size bins in dlog(D)
that span the diameter range ($0.01 < D < 0.15\ \mum$) to get number
and mass concentrations in 5 different size classes. 

(To check
your answer, note that I get a total aerosol mass with $0.01 < D < 0.1\ \mum$
of $\approx 0.02\ \un{\mu g \, m^{-3}}$ and total aerosol number concentration in the
same size range of $\approx 185 \times 10^6\ \un{m^{-3}}$).

```{code-cell} ipython3

```
