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

(assign4_midterm_sol)=
# Assignment 4: midterm solutions

+++

## 2016 midterm question 2 -- tephigram

+++

The attached tephigram shows the temperature (circle) and dewpoint (diamond) for air at 900 hPa and 800 hPa Find (showing your work on the tephigram):

+++

```{figure}  mid_2016_tephi_sol.png
---
width: 60%
name: directive-fig
alt: pha
---
2016 tephigram
```

+++

##

+++

2. Find

    -   The LCL (hPa) of the 900 hPa air
    
        - **860 hPa**
    
    -   The equivalent potential temperature $\theta_e$ (K)
    
        - **338 K**
    
    -   The entropy $\phi$ (J/kg/K) or the 900 hPa air
    
         - $c_p \log(\theta_e) = 5848\ J\,kg^{-1}\,K^{-1}$
    
    -   The wet bulb potential temperature $\theta_w$ (K) of the 900
        hPa air
        
        - **293.8  K**

    2.  Is the air at 900 hPa absolutely stable, conditionally unstable,
        or unstable? Explain
        
       absolutely stable because the temperature lapse rate is more stable than the 350 K moist adiabat

    3.  Is the layer between 900 hPa and 800 hPa convectively
        unstable? Explain.
        
        
       Convectively unstable because if the layer was lifted until the top was at 700 the entire
       layer would be along its thetae sounding, where the temperature decreases with height.

+++

## 2016 midterm question 3 -- mixing

+++

Suppose air at 900 hPa is lifted adiabatically to 800 hPa, where it mixes 50/50 with
air at that level.  

Using the tephigram what is the LCL of the resulting mixture?  -- Clearly label your work, including the tephigram.

+++

### Answer

$\theta_{e900} = 338.0\ K$, $\theta_{e800}= 332.0\ K$

50/50 mixture of the logthetas is 334.99 K

$r_{v900} = 13.3 g/kg$, $r_{v800}$ = 8.31 g/kg

50/50 mixture of the mixing ratios = 10.8 g/kg

LCL of the mixture is 791 hPa

+++

```{figure} mid_2016_mixing.png
---
width: 70%
name: directive-fig
alt: pha
---
Mid 2016 mixing problem
```

+++

## 2012 midterm question 1 -- heat engine

Use the attached tephigram labeled ``heat engine'' to sketch the following thermodynamic
cycle.  You have a sealed cannister containing \textbf{1 kg of dry air and 14 grams of water}.  Initially
it is at a pressure of \textbf{900 hPa and a temperature of 25 deg C (Point A).  It then is taken through the following
stages:

- adiabatic expansion until the internal pressure is 700 hPa to Point B
- isothermal compression back to 900 hPa (Point C)
- isobaric (constant pressure) heating back to 900 hPa  (Point A)


Find the following (you can use $l_v = l_{v0}$ and $c_p = c_{pd}$) :


- The equivalent potential temperatures of point A and point C (Kelvins)
- The heating of the cannister $Q_{in}$ (during C $\rightarrow$ A) and cooling $Q_{out}$) during B $\rightarrow$ C  (in Joules/kg)
- The efficiency of this heat engine (in percent)

+++

```{figure} prob1.jpg
---
width: 50%
name: directive-fig
alt: pha
---
Heat Engine Solution
```

+++

Equivalent potential temperatures:

        In [71]: thetaeC
        Out[71]: 317.69811788297318
        
        In [72]: thetaeA
        Out[72]: 349.72648595945884


To find $Q_{in}$ from $C \rightarrow A$ we need to use the first law and
moist static energy since we are at constant pressure but not constant
temperature:

\begin{equation}
  \label{eq:firstI}
  \Delta Q_{in} = \Delta h_m = c_p \Delta T  + l_v \Delta q_v
\end{equation}

At  point C we have $q_{vC} = q_{sat}$ = 8.86 g/kg, tempC=10.44 deg C and at point A
$q_{vA} = q_T$=14 g/kg, tempA=25 deg C.

\begin{equation}
  \label{eq:firstI}
  \Delta Q_{in} = 1004 (25 - 10.44) + 2.5 \times 10^6 (14 - 8.86) \times 10^{-3} = 27468\ J/kg
\end{equation}

For $\Delta Q_{out}$ we can use the fact that on a reversible isotherm the second law says:

\begin{equation}
  \label{eq:secondI}
\Delta s =   \frac{ \Delta q_{out} }{T}
\end{equation}

We know that:

\begin{equation}
  \label{eq:thetaerelate}
  \Delta s = c_{p} \Delta \log \theta_e = 1004*(\log(317.69) - \log(349.726)) = -96.66
\end{equation}

and since the isotherm is 10.44 \degc = 283.59 K
\begin{equation}
  \label{eq:thetaerelateI}
\Delta q_{out} = T \Delta s = 283.59 \times  -96.66 = -27411.80
\end{equation}
and the efficiency is:

\begin{equation}
  \label{eq:efficiency}
\eta =  \frac{ |Q_{in} | - |Q_{out}| }{|Q_{in}|} = \frac{ 27468 - 27411}{27468}  = 0.2\%
\end{equation}

+++

## For Thursday -- 2012 midterm problems 2 and 3, stability and mixing

+++

### Problem 2

- Find the LCL for the top and bottom of the layer and label them on the figure.
- Draw the $\theta_e$ profile between 900-800 hPa
- Explain your reasoning as you answer the following.  Is the layer:
  - Absolutely stable?
  - Conditionally unstable? 
  - Convectively unstable?
- What is the wet bulb potential temperature ($\theta_w$) for air at 900 hPa? 
(also show on tephigram)

- Suppose the layer is lifted until the top is at 700 hPa and the bottom is a
800 hPa.  Draw the new (T,Td) sounding.  Has cloud formed?  In which part of the layer?
Is there convective overturning?

+++

```{figure} mid_2012_stability.jpg
---
width: 50%
name: directive-fig
alt: pha
---
Stability problem
```

+++

## Problem 3

Suppose that at 700 hPa a cloud parcel with temperature 5 deg C and total water mixing ratio
of 10 g/kg is mixed 50/50 by mass with environmental air at a temperature 10 deg C with 
a total water mixing ratio of 3 g/kg.  Using the tephigram
(writing the values below and also labeling them on the tephigram).


- The LCL and $\theta_e$ of the environment and the cloudy air.
-  The temperature and liquid water mixing ratio (g/kg) of the mixture at 700 hPa

+++

```{figure} mid_2012_mixing_skewT.png
---
width: 70%
name: directive-fig
alt: pha
---
2012 mixing problem 3
```

```{code-cell} ipython3

```
