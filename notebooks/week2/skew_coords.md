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

(skew_coords)=
# Week2: Theromodynamic diagrams

+++

## The University of Wyoming Upperair archive

+++

The University of Wyoming maintains a public archive of balloon sounding data at [https://weather.uwyo.edu/upperair/sounding.html](https://weather.uwyo.edu/upperair/sounding.html)

This data can be accessed using the Python [requests module](https://realpython.com/python-requests/)

The Wyoming web server responds to a "get request" of the form:

     https://weather.uwyo.edu/cgi-bin/sounding?region=naconf&TYPE=TEXT%3ALIST&YEAR=2024&MONTH=01&FROM=1912&TO=1912&STNM=71957

Where:

- region is one of naconf, samer, pac, nz, ant, np, europe,africa, seasia, mideast
- year and month are in the format yyyy and mm respectively
- from and to are days of month in dd inclusive
- stnm is the station number from this table:  [https://www.nws.noaa.gov/dm-cgi-bin/nsd_state_lookup.pl](https://www.nws.noaa.gov/dm-cgi-bin/nsd_state_lookup.pl)

+++

## The wyominglib sounding module

### Fetching soundings

The [a405.soundings.wyominglib.write_soundings function](https://phaustin.github.io/a405_lib/_modules/a405/soundings/wyominglib.html#write_soundings) takes a dictionary with these
parameters and a path to a folder, makes the requests to the Wyoming site and writes soundings in csv format to the folder

+++

#### write_sound example

Get all the February,2013 soundings for [Alta Floresta airport](https://www.google.com/maps/place/Alta+Floresta+Airport/@-9.8722629,-56.1049062,15z/data=!4m6!3m5!1s0x93aa317851e54e4f:0x2c2df4288fa7837e!8m2!3d-9.8722629!4d-56.1049062!16s%2Fm%2F04fnn0d?entry=ttu) in Brazil and save to a folder called brazil_soundings

```{code-cell} ipython3
from a405.soundings.wyominglib import write_soundings
write = False
if write:
    region = 'samer'
    year = '2013'
    month= '2'
    start = '0100'
    stop = '2000'
    station = '82965'
    sounding_dir = 'brazil_soundings'
    values=dict(region=region,year=year,month=month,start=start,stop=stop,station=station)
    write_soundings(values, sounding_dir)
```

### reading soundings into pandas dataframes

+++

#### read_soundings example

This cell shows how to get the pandas dataframe for the airport sounding on Feb. 1, 2013 at 12 UCT

```{code-cell} ipython3
from a405.soundings.wyominglib import read_soundings
sounding_dir = 'brazil_soundings'
sounding_dict = read_soundings(sounding_dir)
```

```{code-cell} ipython3
press,temp = the_sound['pres'].to_numpy(), the_sound['temp'].to_numpy()
press, temp
```

### 2. Calculating skewed temperature coordinates

If you try plotting your soundings on the conventional plot above, you'll see
that the height-temperature dependence makes it difficult to see the temperature
and dewpoint together.  The traditional approach is to slant the temperature
line by a constant slope (note that this is different from rotating the line,
because the y axis doesn't change)

```{code-cell} ipython3
from metpy.plots import SkewT
from metpy.units import units
fig,ax =plt.subplots(1,1,figsize=(8,8))
fig.clf()
skew_plot = SkewT(fig)
skew_plot.ax.set_title("metpy example")
skew_plot.ax.set(xlim=(0,25),ylim=(1000,600))
theta = np.array([0,10,20,30,40,50,60]) + 273.15
theta = theta*units("K")
skew_plot.plot_dry_adiabats(t0=theta)
skew_plot.plot_moist_adiabats()
skew_plot.plot_mixing_lines()
skew_plot.plot(press,temp,'r')
skew_plot.plot(press,dewpoint,'g');
```

```{code-cell} ipython3

```
