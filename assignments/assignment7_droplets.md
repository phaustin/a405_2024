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

(assignment_7)=
# Assignment 7  -- Due Tuesday March 26 midnight

+++

1. Assuming that cloud condensation nuclei (CCN) are removed from the atmosphere by first serving as the centers on which cloud droplets form, and the droplets subsequently grow to form precipitation particles, estimate the residence time of a CCN in a column extending from the surface of the Earth to an altitude of 5 km. Assume that the annual rainfall is 100 cm/year and the cloud liquid water content is 0.30 $g/kg$ .  *Hint:  Assume that all drops in the cloud droplets have  a radii of 10 microns and that every droplet contains exactly 1 CCN.   How many CCN are in 1 kg of air?  About how many kg of air are there in a 5 km column?  About how many CCN are taken out by a rain rate of 1 m/year?  Find the time constant for removal of the form  1/N dN/dt = 1/tau*

2.  A drop with an initial radius of 100 µm falls through a cloud containing 100 droplets per cubic centimeter that it collects in a continuous manner with a collection efficiency of 0.800. If all the cloud droplets have a radius of 10 µm, how long will it take for the drop to reach a radius of 1 mm? You may assume that for the drops of the size considered in this problem the terminal fall speed v (in $m s^{-1}$) of a drop of radius r (in meters) is given by $v= 8 x 10^3\;r$. Assume that the cloud droplets are stationary and that the updraft velocity in the cloud is negligible.  Hint:  Integrate Thompkins equation 4.28 analytically -- youm can also check numerically with python

3. Compare the droplet growth equation in Thompkins equation 4.24 with  with Lohmann 7.28 for 3 micron drop nucleated on a $1 \times 10^{-18}$ kg ammonium sulphate aerosol.  Show numerical values for all the terms, and the total percentage difference in the $dr/dt$ for the two equations.

4. Derive $Q1$ and $Q2$ in Lohmann equations (7.31) and (7.32)


   Problem 4 hints:
   
   - Start with this approximate relation between the vapor mixing ratio and the saturations
   
     $$
     r_v = \frac{\rho_v}{\rho_d} = \frac{R_d}{R_v} \frac{e}{p - e} \approx \frac{R_d}{R_v} \frac{e}{p}=
   \epsilon \frac{e}{p} = \frac{S \epsilon e_s}{p} 
     $$
     
   - first show that with the chain rule wind up with this:
   
     $$
  \label{eq:chain}
  \frac{d r_v}{dt} = S \left [ \frac{-\epsilon e_s}{p^2} 
\left ( \frac{-g p V}{R_d T} \right ) + \frac{\epsilon}{p} \left ( 
\frac{\epsilon e_s L}{R_d T^2} \right ) \frac{dT}{dt} \right ]
+ \frac{\epsilon e_s}{p} \frac{dS}{dt}
     $$
     where $V$ is the vertical velocity $dz/dt$ and I've used the Clausius-Clapeyron equation and
     assumed hydrostatic balance:
     
     $$
     \begin{align}
    \frac{de_s}{dT} &= \frac{\epsilon L e_s}{R_d T^2}\\
    \frac{dp}{dt} & =  - \rho g \frac{dz}{dt} = -\frac{g p}{R_d T} V
     \end{align}
     $$

   - To get Lohmann's coefficients, recognize that $dr_v/dt = - dr_l/dt$ if total water is conserved
