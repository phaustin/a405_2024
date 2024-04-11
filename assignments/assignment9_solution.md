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

(assignment9_solution)=
# Assignment 9 -- solution

+++

## Wallace and Hobbs problems 6.21 and 6.24

6.21: Derive an expression for the height h above
cloud base of a droplet at time t that is
growing by condensation only in a cloud with
a steady updraft velocity w and
supersaturation S. [Hint: Use (6.24) for the
terminal fall speed of a droplet together
with (6.21).]

```{code-cell} ipython3

```

6.24: If a raindrop has a radius of 1 mm at cloud
base, which is located 5 km above the ground,
what will be its radius at the ground and
how long will it take to reach the ground if
the relative humidity between cloud base
and ground is constant at 60%? [Hint: Use
(6.21) and the relationship between v and r
given in Exercise 6.23. If r is in micrometers,
the value of Gl in (6.21) is 100 for cloud
droplets, but for the large drop sizes
considered in this problem the value of Gl
should be taken as 700 to allow for
ventilation effects.]

+++

Solve these problems twice:


1. Derive the analytic expression by integrating the equation

   $$
   \frac{dh}{dt} = w - v
   $$
   where h is the height, w is the updraft speed and v is the droplet fall speed

2. For each problem, show  in cells below that this agrees with the numerical solution using the scipy odeint package

```{code-cell} ipython3

```
