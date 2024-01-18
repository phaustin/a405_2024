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

+++ {"user_expressions": []}

(worksheet1_solution)=
# Week 1 worksheet solutions

Three problems from Lohmann Chapter 1

+++ {"user_expressions": []}

1) Assume a low level cloud with the following properties: vertical extent 1.5 km, horizontal
extent 1 km, cloud droplet number concentration 90 $cm^{−3}$ air and mean diameter 10
μm. Estimate the mass of the cloud by assuming that all the cloud droplets are spherical
and have the same size. Take 1000 $kg\,m^{−3}$ to be the density of water.

+++ {"user_expressions": []}

1. Answer

```{code-cell} ipython3
cloud_diameter=1000 #m
cloud_height = 1500 #m
drop_density = 90e6 # /m^3
drop_diameter = 10.e-6  #m
rho = 1000  #kg/m^3
pi = 3.1416
cloud_volume = cloud_height*4*pi*(cloud_diameter/2.)**2.
drop_volume = 4./3.*pi*(drop_diameter/2.)**3.
total_number = cloud_volume*drop_density
total_mass = total_number*drop_volume*rho #kg
total_mass_tonnes = total_mass/1000.
print(f"Answer: {total_mass_tonnes:0.1f} tonnes")
```

+++ {"user_expressions": []}

2) Imagine a pure water cloud which consists of cloud droplets of uniform size with $R_d$
=5 μm. Assume a uniform spacing of the cloud droplets, with a number concentration of
Nc = 170 $cm^{-3}$

   (a) Calculate the average distance between the cloud droplets
   
   (b) What would happen to the distance if the number concentration was trippled?

+++ {"user_expressions": []}

2. Answer

Assume that each drop gets its own cube inside the 1  $cm^{3}$ of air.  How many cubes does it take to pack a cm?

```{code-cell} ipython3
N = 170.
drop_cube_volume = 1/N
drop_cube_size = drop_cube_volume**0.3333
print(f"{drop_cube_size:0.2f} cm")
```

So if the drop diameter is 10 microns, then there are about 180 drop diameters between droplets

+++ {"user_expressions": []}

3. The average pressure at Earth’s surface is 985 hPa. Knowing the radius of the Earth
$r_{Earth}$ = 6370 km and using the definition of pressure, estimate the total mass of the
atmosphere.

+++ {"user_expressions": []}

3. Answer

- pressure = force of gravity per unit area
- force of gravity = mass $\times$ acceleration

```{code-cell} ipython3
pressure = 98500  #pascals
g = 9.8 # m/s/s
mass_m2 = pressure/g
r_earth = 6370e3  #m
earth_area = 4*pi*r_earth**2.
mass_atm = mass_m2*earth_area #kg
mass_atm_gtonne = mass_atm/1.e12
print(f"{mass_atm_gtonne:0.1f} gtonnes")
```

```{code-cell} ipython3

```
