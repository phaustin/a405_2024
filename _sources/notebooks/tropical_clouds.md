---
jupytext:
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

(tropical_clouds)=
# Week 3 worksheet: Tropical clouds

+++

1. Download the [tropical_subset.nc](https://www.dropbox.com/scl/fi/dfj80s9q920ljni5aakfc/tropical_subset.nc?rlkey=2fc2wr2yb70e4i6l9c7gwcyj3&dl=0) netcdf file
   I put it in /Users/phil/Dropbox/phil_files/a405/data/tropical_subset.nc

+++

2. Find out what is in it with ncdump

```{code-cell} ipython3
!ncdump -h /Users/phil/Dropbox/phil_files/a405/data/tropical_subset.nc
```

The file contains a single timestep from the simulation I showd in [my day1 slides](https://phaustin.github.io/talks/cloud_talk.html).  The variables that we're interested in
right now are the absolute temperature TABS, the pressure $p$ and the pressure perturbation $PP$.

```{code-cell} ipython3
from pathlib import Path
import xarray as xr
the_file = Path.home() / "Dropbox/phil_files/a405/data/tropical_subset.nc"
the_ds = xr.open_dataset(the_file)
```

```{code-cell} ipython3
the_ds
```

```{code-cell} ipython3
the_ds['p'].data
```

## todo

+++

Thompson uses a Taylor series to expand the equation of state

$$
  \frac{\rho^\prime}{\overline{\rho}}  = \frac{p^\prime}{\overline{p}}
  - \frac{T^\prime}{\overline{T}}
$$

+++

1.  find the index of the vertical level that is closes to 500 m
2.   For that level calculate all of the quantities in (1).  How much larger are rthe temperature and density terms that the pressure term?

```{code-cell} ipython3

```
