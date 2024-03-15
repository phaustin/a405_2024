---
jupytext:
  formats: md:myst
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

# Entropy and potential temperature -- including liquid and vapor

This derivation follows the book [Atmospheric Convection](https://webcat.library.ubc.ca/vwebv/holdingsInfo?bibId=980430), 1995, Chapter 4

+++

## Adding up the individual entropies

+++

In part 1 of the [entropy notes](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0) we showed that 

$$
\phi_1-\phi_0=c_p \log \frac{\theta_1}{\theta_0}
$$
for dry air.

The same relationship hollds quantities conserved under reversible moist adiabatic processes. As we assume reversibility, the heterogeneous system must be in phase equilibrium at all times. In this case the total entropy $(s)$ is conserved.

We can find total specific entropy (entropy per unit mass of dry air) for a mixture of dry air, water vapor and liquid water by adding the individual entropies:

$$
\phi=\phi_d+r_v \phi_v+r_l \phi_l
$$(eq:sum)

where $\phi_d$ is the specific entropy of dry air, $\phi_v$ is the specific entropy of water vapor, and $\phi_l$ is the specific entropy of liquid water.
From the [Clausius-Clapeyron](https://www.dropbox.com/scl/fi/o7d278acumkgmwe4y6qlu/clausius.pdf?rlkey=ktd5fvdwaz7ishuxozwmf6kwa&dl=0) notes we have:

$$
l_v=T\left(\phi_v^*-\phi_l\right),
$$
where $\phi_v^*$ is the specific entropy of water vapor in equilibrium with liquid water, and substituting this into {eq}`eq:sum` gives

$$
\phi=\phi_d+r_t \phi_l+\frac{L_v r}{T}+r_v\left(\phi_v-\phi_v^* \right)
$$(eq:phitot)

Now use the definitions of specific entropies from equation (2) of the [entropy notes](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0) substituting the heat capacities/gas constants for liquid water and water vapor: 

$$
\begin{aligned}
& \phi_d=c_{p d} \ln T-R_d \ln p_d \\
& \phi_v=c_{p v} \ln T-R_v \ln e \\
& \phi_v^*=c_{p v} \ln T-R_v \ln e ^* 
\end{aligned}
$$(eq:allents)

and since liquid water is incompressible:
$$
\phi_l=c_l \ln T
$$

+++

## Combining terms for the total entropy

+++

Using {eq}`eq:allents`, {eq}`eq:phitot` may be written

$$
\begin{aligned}
\phi=\left(c_{p d}+\right. & \left.r_t c_l\right) \ln T \\
& -R_d \ln p_d+\frac{l_v r_v}{T}-r_v R_v \ln (\mathcal{H}) .
\end{aligned}
$$(eq:fullphi)

where $\mathcal{H}= e/e^ *$ is the relative humidity.

+++

## Defining $\theta_e$

+++

Note that the last term vanishes when the air is saturated $(\mathcal{H}=1)$ and also in the limit of $r_v \rightarrow 0$, reaching its maximum magnitude for intermediate $\mathcal{H}$. The quantity $\phi$, defined by (4.5.9), is conserved under reversible moist adiabatic transformations.

In the atmospheric sciences it's traditional to express entropy in terms of an equivalent potential temperature $\theta_e$, which is defined so that

$$
\left(c_{p d}+r_t c_l\right) \ln \theta_e \equiv \phi +R_d \ln p_0,
$$(eq:thetae1)

where $p_0$ is a reference pressure. Substituting {eq}`eq:fullphi` into {eq}`eq:thetae1` and exponentiating gives

$$
\begin{aligned}
& \theta_e=T\left(\frac{p_0}{p_d}\right)^{R_{t l} /\left(c_{p l}+c_l r_t\right)} 
&(\mathcal{H})^{-r_v R_v /\left(c_{p, l}+c_l r_t\right)} \exp \left[\frac{l_v r_v}{\left(c_{p d}+c_l r_t\right) T}\right]
\end{aligned}
$$(eq:thetaet)

When $r_v=0, \theta_e=\theta$, the potential temperature.

+++

## Connection with a skewT diagram

+++

For exact calculations of the entropy we can use [find_thetaet](https://phaustin.github.io/a405_lib/_modules/a405/thermo/thermlib.html#find_thetaet) to evaluate {eq}`eq:fullphi` and get {eq}`eq:thetaet`.  If we don't have a computer, we can still use a skewT diagram to solve {eq}`eq:thetaet`, since we have lines where, as long as it's saturated so that $\mathcal{H} = 1$, $\theta_e = \theta_{es}$.  This is why, if 
we're subsaturated so that $\mathcal{H} < 1$ we need to ascend adiabatically to the lifting condensation level and read off $\theta_e$ there.

```{code-cell} ipython3

```
