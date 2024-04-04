# Week notes

## Week 1

### Lecture 2, week 1, Thursday:  

- Read Lohmann chapter 1 and scan the questions at the end of the chapter

- My slide show: [slides on boundary layer clouds and climate](https://phaustin.github.io/talks/cloud_talk.html)

#### Learning objectives

  - Identify principal cloud types
  - Explain how clouds can both heat and cool the planet
  - Work some simple scaling problems about clouds

### Lecture 3, week 1, Friday

- Thompkins through page 8
- Finish {ref}`worksheet1_solution`
- Do the adiabatic box assignment (due Friday)

#### Lecture 3 Reading notes

- Thompkins equation 1.7

    \begin{align}
    pV &= NkT \\
    p &= \rho R_d T
    \end{align}

  - ideal gas is enormous simplification -- all that matters is the number of moles $N$, not the character of the molecules

- Thompkins equation 1.9 -- first law for internal energy

    \begin{align}
    du &= dq + dw \\
    du &= dq - p\,dv
    \end{align}

  - heating and working are verbs not nouns -- they are path dependent processes, while internal energy, temperature, pressure, entropy etc. are path independent state variables with perfect differentials.  The integral of a state variable is path independent.

- Thompkins equation 1.25 first law for enthalpy

    \begin{align}
    dq &= c_p\,dT - v\,dp \\
    dh &= dq + v\,dp
    \end{align}
    
  - the enthalpy version of the first law depends on temperature and pressure.  This is the most useful for atmospheric scientists, because we can easily measure both those state variables

## Week 2

### Lecture 4, week 2, Tuesday

- Thompkins through page 14
- Review my notes on [kinetic temperature](https://www.dropbox.com/scl/fi/uanlie1sdyiz4ezbclopt/temperature_notes.pdf?rlkey=leatk6yrhmw137i9dl6j8ojlq&dl=0)

- Introduce my notes on [the first law of thermodynamics](https://www.dropbox.com/scl/fi/j7bq6cc7r40vkx3og14qh/first_law_notes.pdf?rlkey=66r1y4umxtc1hgwfbylxlzoxt&dl=0)

- Introduce my notes on [entropy and potential temperature](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0)

#### Worksheet 2

- Download here: [worksheet2](https://www.dropbox.com/scl/fi/fbd17mi8zicladk2f9ubl/worksheet2.ipynb?rlkey=3id3nusgybporoz2o2r3qk3cc&dl=0)

#### For Thursday

- Read the [the first law of thermodynamics](https://www.dropbox.com/scl/fi/j7bq6cc7r40vkx3og14qh/first_law_notes.pdf?rlkey=66r1y4umxtc1hgwfbylxlzoxt&dl=0) and the [entropy and potential temperature](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0) notes

- Work on the adiabatic box assignment

### Lecture 5, week 2, Thursday

- Questions on the adiabatic box assignment
- Review my notes on the first law of thermodynamcis
- Review my notes on entropy and potential temperature
- Introduce my notes on {ref}`hydro`

### Lecture 6, week 2, Friday

- Covered Thompkins section 1.10 on thermodynamic charts
- Went over the {ref}`skew_coords_solution` notebook

#### For Tuesday

Read the rest of Thompkins Chapter 1 on bouyancy

## Week 3

### Lecture 7, week 3, Tuesday

- Go over {ref}`skew_coords_solution` with metpy skewT
- More on Thompkins hydrostatic balance (p. 10) 
  Connect weighted averages and scale heights with the [weighted averages onte](https://www.dropbox.com/scl/fi/sosiyoxa9bzhecea5qas9/hydro.pdf?rlkey=7wll6s0yc4t0dlojzx56082iw&dl=0)
- Review numpy integration and differentiation with {ref}`derivs_ints`
- Start on {ref}`assign2_hydro`

#### For Thursday

- Read Thompkins Chapter 2 through p. 30
- Read my [buoyancy notes](https://www.dropbox.com/scl/fi/ygb2bi2riqo23ostxo8lw/buoyancy.pdf?rlkey=b80rbwtzartk4qp5dt9gjvsf6&dl=0)
- Work on Assignment 2

### Lecture 8, week 3, Thursday

- Work through the {ref}`xarray_intro` notebook
- Tomorrow we'll use xarray to do the {ref}`tropical_clouds` notebook

### Lecture 9, week 3, Friday

- Do the {ref}`tropical_clouds` worksheet
- For Tuesday read the Lohamnn text Section 2.4 on phase transitions -- this covers the same material as Thompkins but in more detail
- For Tuesday finish Assignment 2 -- will release the hand in notebook this weekend


## Week 4

### Lecture 10, week 4, Tuesday

- Background/detail on free energy, thermodynamic potentials and the Clausius-Clapyron equation  (Lohmann Section 2.4, Thompson pp. 25-27.

- Go over my notes on [Maxwell relationships](https://www.dropbox.com/scl/fi/puuzbbzszhue73nrew726/maxwell.pdf?rlkey=fntdkgs90o4otc3s6lme85mz3&dl=0)

- Read for Thursday

  - My notes on the [Clausius Clapyron equation](https://www.dropbox.com/scl/fi/o7d278acumkgmwe4y6qlu/clausius.pdf?rlkey=ktd5fvdwaz7ishuxozwmf6kwa&dl=0) 
  - From Schroeder's textbook:  3 pages on [free energy](https://www.dropbox.com/scl/fi/qc44gc8j1t3vh6w4e15nl/schroeder_chap_5.pdf?rlkey=mpt2r7eeksre5xhi4guf96h7q&dl=0)
  - Finish the [rootfind noteboo](https://www.dropbox.com/scl/fi/4y602g5lnw5mt4r9u5yx4/rootfind.ipynb?rlkey=46wu08wkxjnydozvolzbs7hz1&dl=0)
  - Read the [virtual temperature notes](https://www.dropbox.com/scl/fi/5m7x5opmp5p6ooe86imlj/virtual_temperature.pdf?rlkey=yjmfkbt417gpjv0cwwfyoi0c4&dl=0)
  
### Lecture 11, week 4, Thursday

- Three new {ref}`python_tutorials`
- Download the new version of the {ref}`week4_rootfind`  notebook and work on parts 2 and 3
- For Friday: Read the rest of Thompkins Chapter 2
- For Tuesday:  Read my [moist static energy notes](https://www.dropbox.com/scl/fi/tfgz28syrhn1zk6y066nm/thermo.pdf?rlkey=eigclji5ypji0p12cfww6w2x1&dl=0) notes

### Lecture 12, week 4, Friday

- Continue work on {ref}`week4_rootfind`
- Introduce the {ref}`tropical_profiles` notebook
- For Tuesday -- Read my moist static energy notes

## Week 5

### Lecture 13, week 5, Tuesday

* Go over my [moist static energy notes](https://www.dropbox.com/scl/fi/tfgz28syrhn1zk6y066nm/thermo.pdf?rlkey=eigclji5ypji0p12cfww6w2x1&dl=0) 

  - Emphasis 
  
    - How we get Equations 39 and 41 for the moist and liquid static energies:  
  
        $$
        \begin{align}
        s_v &= c_p T + l_v r_v + gz \\
        s_l & = c_p T - l_v r_l + gz 
        \end{align}
        $$
    
    - How we get Equation 54 and 55  for the equivalent potential temperature and liquid water potential temperature
    
       $$
        \begin{align}
         \theta_e &= \theta \exp \left ( \frac{l_v r_{sat}}{c_p T} \right )\\
         \theta_l &= \theta \exp \left ( - \frac{l_v r_l}{c_p T} \right )
        \end{align}
       $$
  
    - Note that $s_v$, $s_l$, $\theta_v$ and $\theta_l$ all label approximately label the same moist adiabat on a tephigram, because they are all approximately conserved for adiabatic ascent and descent
    
* Tephigram review

  - How to find the lifting condensation level, the level of free convection, and the moist adiabat through cloudbase.  The demo notebook:  {ref}`moist_adiabats`

  - How to use "Normand's construction"  (Thompkins Figure 2.19) to find the wet bulb temperature

- For Thursday:

  - Read my notes on the [Carnot cycle](https://www.dropbox.com/scl/fi/tod6zhofnbap8di0c6x9z/carnot.pdf?rlkey=h2uxgthrnipsk1rbsxve7s1pz&dl=0)  (this expands on Section 2.2.4 in the Lohmann et al. textbook)
  
  - Finish the {ref}`week4_rootfind` which will be due Friday midnight
  
- Next week:  On Friday we'll start working on mid-term problems, which will be the last assignment before break

### Lecture 14, week 5, Thursday

#### Note worksheet correction 

- Added $\epsilon$ to the definition of $r_s$ in  {ref}`week4_rootfind`

  - due date  is Monday
  
- Today -- work through the {ref}`tropical_engine` notebook

### Lecture 15, week 5, Friday

- New material:  mixing lines -- Thompkins Section 3.2.3 on p. 57

- Notebook:  {ref}`mixing_line`

- For Tuesday 
  
  - Read Thompkins Section 3.2
  - Read [my entrainment notes](https://www.dropbox.com/scl/fi/uj7sq0hcdbcgtxomly4vd/entrain.pdf?rlkey=feaufh1d7lixg5rtdlxj4vdzu&dl=0)
  - Do the [Taylor series question for upload Tuesday morning](https://www.dropbox.com/scl/fi/ybvghklr4oojf9br5v5yk/taylor_mix.pdf?rlkey=qwnhefjo9koll9h6m6crx3stg&dl=0)

## Week 6

### Lecture 16, week 6, Tuesday

- Work through the {ref}`cape_part1` notebook
- Introduce {ref}`thompkins_practice`

### Lecture 17, week 6, Thursday

- Discussed hings on the [Taylor series question](https://www.dropbox.com/scl/fi/ybvghklr4oojf9br5v5yk/taylor_mix.pdf?rlkey=qwnhefjo9koll9h6m6crx3stg&dl=0)
- Midterm review

### Lecture 18, week 6 Friday

- Go over {ref}`thompkins_practice`
- Modeling and [entraining plume](https://www.dropbox.com/scl/fi/uj7sq0hcdbcgtxomly4vd/entrain.pdf?rlkey=feaufh1d7lixg5rtdlxj4vdzu&dl=0) in Python

#### For the break

- Hand in Assignments 3 and 4
- Finish Thompkins Chapter 3
- Read Thompkins Chapter 4: sections 4.1 and 4.2


## Week 7


### Lecture 19, week 7 Tuesday

- Notes on entropy for a air/vapor/liquid/mixture -  {ref}`entropy_part2`

- Solutiions posted

  - {ref}`tropical_heat_solution`
  -  [taylor mixing solution](https://www.dropbox.com/scl/fi/6qs2cqcy07lmod49o4cyw/taylor_mix_answer.pdf?rlkey=2bfovdzckdzau5spysyrky3cb&dl=0)
  - Go over midterm solutions {ref}`assign4_midterm_sol`
  - {ref}`thompkins_answers`
  
- For Thursday

  - do the 2012 midterm problems 2 and 3 posted at the bottom of {ref}`assign4_midterm_sol`

  - Two box mixing -- given two compartments of dry air with different pressures and temperatures, find the final pressure, temperature and entropy when the membrane separating the box is broken.  Is the entropy conserved?


### Lecture 20, week 7 Thursday

- Clouds in the news:  [NYTimes article from Feb. 27 on North Atlantic temperatures](https://www.nytimes.com/2024/02/27/climate/scientists-are-freaking-out-about-ocean-temperatures.html)

- {ref}`convec_instab`
- {ref}`assign4_midterm_sol`
- {ref}`two_compartments`

- For Tuesday -- read [my Koehler notes](https://www.dropbox.com/scl/fi/jezup97ylvyit38jzjwm3/kohler_notes.pdf?rlkey=faqh51p0lf4rvd8e36r3hitvn&dl=0) and  Lohmann Chapter 6 sections 6.1-6.4

### Lecture 21, week 7 midterm

- {ref}`midterm_solutions_2024`

## Week 8

### Lecture 22, week 8 Tuesday

- Machine learning seminar

### Lecture 23, week 8 Thursday

- Review Lohmann Chapter 6, [Thompkins section 4.2](https://gw2jh3xr2c.search.serialssolutions.com/?sid=sersol&SS_jc=TC0001980404&title=An%20introduction%20to%20clouds%20%3A%20from%20the%20microscale%20to%20climate
) and [my Koehler notes](https://www.dropbox.com/scl/fi/jezup97ylvyit38jzjwm3/kohler_notes.pdf?rlkey=faqh51p0lf4rvd8e36r3hitvn&dl=0)

- {ref}`assignment_5`

### Lecture 24, week 8 Friday

- Worksheet: {ref}`kohler_equilibrium`
- Download [kohler_equilibrium_students.ipynb](https://www.dropbox.com/scl/fi/7xftvt0g6hf8rkewwps4g/kohler_students.ipynb?rlkey=3x97oa00f8etv5ocjc8uzr3ci&dl=0)

## Week 9

### Lecture 25, week 9 Tuesday

Coverage: Finish Kohler curve  (Thompkins Chapter 4, Lohmann Chapter 6)

- Review some edits to  [my Koehler notes](https://www.dropbox.com/scl/fi/jezup97ylvyit38jzjwm3/kohler_notes.pdf?rlkey=faqh51p0lf4rvd8e36r3hitvn&dl=0)

- New [Kohler stability notes](https://www.dropbox.com/scl/fi/oqlh8x24lh02jyhbwdgvf/kohler_stability.pdf?rlkey=rd1a4plyfglt54wg6u5xz8riu&dl=0)

- Assignment 6:

    - Due Tuesday March 19 midnight:  upload written solutions to these two problems:

      1. Given the critical supersaturation from the kohler notes:

         $$
         SS=S^* - 1= \left ( \frac{4 a^3}{27b} \right )^{1/2}
         $$

        show that this implies, for $(NH_4)_2 SO_4$, density $\rho_{aer}$ = 1775
        ${kg}\,{m^{-3}}$ , van hoft i=3, that:

        $$
        S^* -1 \approx 1.54 \times 10^{-12}~ m_{aer}^{-0.5}
        $$

        where $m_{aer}$ is the ammonium sulphate aerosol mass in kg.

        Note that this is why a cloud chamber can get the aerosol mass distribution from a series of
        saturation and light scattering measurements as smaller and smaller aerosols are pushed over
       their critical supersaturation and activated.

  2. Show that the expression for second derivative of the thermodynamic potential derived in the
     kohler stability notes:

     $$
     \frac{\delta ^2G}{\delta r^2} = - 4 \pi R_v T \rho_l \left [ 2 a - r^2 \left ( 1 +
           \frac{b}{r^3} \right ) \frac{3b}{r^4}  \right ] + 8 \pi \sigma
     $$

     Changes sign from stable (positive) to unstable (negative) at $r_{crit}$.

     Hint -- first show that the second derivative is zero at the critical radius.  Then show that
     the third derivative is negative above and below the critical radius, which means that
     there has to be a sign change from + to -.
     
     
- Run the {ref} Modeling an entraining cloud updraft notebook. Dowload link The Thursday worksheet will ask you to use the output to make a plot of the cloud and environment temperature as a function of height.

#### For Thursday

- Read my droplet growth notes and finish Thompkins Chapter 4.

- Work on Assignment 5 (due Friday) and Assignment 6 (due Tuesday)

### Lecture 26, week 9 Thursday

- Review my [droplet growth notes](https://www.dropbox.com/scl/fi/lsqfvghey0o727ze9vn1w/drop_grow.pdf?rlkey=zohnawwe6tr1qfvusql97fwgc&dl=0)

- Worksheet: {ref}`entrain_plot`

#### For Friday

- Time permitting read: Lohmann Chapter 5.1-5.2 (p. 129) on atmospheric aerosols

### Lecture 27, week 9 Friday

- Added the environment sounding to {ref}`entrain_cloud` and {ref}`entrain_plot`
- Introduce the {ref}`aerosol_dists` for background on Lohmann Chapter 5.1-5.2

#### For Tuesday

- Read Lohmann Section 5.3
- Read Thompkins Sections 4.3-4.5

## Week 10

### Tuesday

- Lohmann Chapter 5.3 take home points

  - Clouds are predominately formed on secondary aerosols created by binary nucleation (exception -- salt particles in marine clouds are primary aerosols)
  - Table 5.3 shows the importance of DMS, volcanoes and soils for aerosol production


- Today's worksheet: {ref}`koehler2` 
  - [Download link](https://www.dropbox.com/scl/fi/4d1xiae00lfocvmnhmr1g/koehler2_worksheet.ipynb?rlkey=zshmwicjmv0ajnw4zenzqpyvc&dl=0)

Assignment 7 due midnight Tuesday March 26


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

### Thursday

- Worksheet: {ref}`constant_updraft`
  - Download [dropgrow_2024.ipynb](https://www.dropbox.com/scl/fi/d0y1kd0fbgcsch1ipruex/dropgrow_2024.ipynb?rlkey=4no8nmzl1o7us8n36tmo271y4&dl=0)
  

### Friday

- Go over the origin of the Marshall-Palmer distribution -- Thompkins Figure 4.25 p. 81

- Where do the straight lines in Figure 4.25 come from?  Look at this paper on [droplet fragmentation](http://ezproxy.library.ubc.ca/login?url=http://www.nature.com/doifinder/10.1038/nphys1340)

- Do the {ref}`constant_updraft_2` worksheet
  - Download [dropgrow_2024_2.ipynb]( https://www.dropbox.com/scl/fi/0u6y7ufkaq4mbr1zavb0c/dropgrow_2024_2.ipynb?rlkey=zizniwhtr93orybz6himzwk36&dl=0)

- The {ref}`marshall_palmer` will be part of the next problem set
  - Download [marshallpalmer.ipynb](https://www.dropbox.com/scl/fi/xkrtyffpt9ignyesgqmql/marshallpalmer.ipynb?rlkey=2li0db7er3apivzssb5z6j906&dl=0)

#### For Tuesday

- Read Lohmann Chapter 7 up to page 210, Thompkins Sections 4.6-4.9

## Week 11

### Tuesday

- Go over  the [equilibrium supersaturation notes](https://www.dropbox.com/scl/fi/3nvjbh208o5ndeq8io3e1/equil_super.pdf?rlkey=zot8e90vynl5mvpul194tud3w&dl=0) which analyze the growth of supersaturation in the parcel model (p. 196, Fig 7.4)

- Start on Thompkins Section 4.7-4.9 using new notebook on {ref}`ice_saturation`
  - Take home points
    - The atmosphere has relatively few ice condensation nuclei
    - Because of this, liquid water drops can exist at temperatures below -20 deg C
    - This means that crystals and drops can coexist in cold clouds
    - When crystals are mixed with supercooled drops, they rapidily consume the drops' liquid water
      and begin to fall as precipitation
    - This is the main precipitation mechanism in mid-latitude cyclones (our weather)
    
- Go over the [crystal diffusion notes](https://www.dropbox.com/scl/fi/aeva3yk68w8j7u69wmvhx/crystal_diffusion.pdf?rlkey=ruatsjms61izb06ef5opm3q42&dl=0).  Why is there a capacitance in the crystal growth equation (Lohmann 8.11)

#### For Thursday

Read Lohmann Section 8.3 on crystal growth


### Assignment 8: Due Tuesday April 2, 11:59pm


Questions 1 and 2: The two problems at the bottom of the {ref}`marshall_palmer` notebook


Question 3: Lohmann problem 4 page 250:

4. Mixed-phase clouds contain ice crystals as well as liquid droplets. Consider such a cloud at a temperature $T=-4^{\circ} \mathrm{C}$, pressure $p=800 \mathrm{hPa}$ and a humidity which corresponds to supersaturations with respect to ice of $5 \%$ and with respect to water of $1 \%$. In the cloud, an ice crystal and a droplet both grow by diffusion, each starting from mass $m_0=10^{-8} \mathrm{~g}$. The ice crystal is a thin hexagonal plate, so that its capacitance can be approximated by $C=2 r_i / \pi$, where $r_i$ is the radius of the ice crystal.
(a) Determine the times it takes for the droplet and the ice crystal to grow to a total mass $m_1=1.1 \times 10^{-8} \mathrm{~g}$. You can neglect solution and curvature effects when calculating the droplet growth. For the ice crystal, you can assume that its mass $m_i$ and diameter $d_i$ are related by $m_i=\alpha d_i^3$, with $\alpha=1.9 \times 10^{-2} \mathrm{~g} \mathrm{~cm}^{-3}$.
(b) Which of the two cloud particles grows faster? Explain the main reason for the difference in growth speed.
(c) How would the situation in the mixed-phase cloud change for supersaturation with respect to ice but subsaturation with respect to water? Explain qualitatively in a few sentences.


### Thursday

#### Pyrcel

- This is a parcel model designed for the development of GCM parameterizations for aerosol acitvation (see [this article](https://journals.ametsoc.org/view/journals/atsc/73/3/jas-d-15-0223.1.xml))

- It uses an odesolver written in Python/numba/C/Fortran called [assimulo](https://github.com/modelon-community/Assimulo)

- Here is its [droplet growth equation](https://github.com/darothen/pyrcel/blob/master/pyrcel/_parcel_aux_numba.py#L150-L165)

- we want to run two example notebooks:

  - {ref}`pyrcel_basic`
  - {ref}`pyrcel_activation`

- Installing [pyrcel](https://pyrcel.readthedocs.io/en/latest/)

  - Download [pyrcel_conda.yml](https://www.dropbox.com/scl/fi/doazy5kcrfcpdsmp7u431/pyrcel_conda.yml?rlkey=53tutxvtza25dgbyer6troyzc&dl=0) to a folder
  - in a terminal cd to that folder and do:
  
        conda activate base
        mamba env create --name pyrcel --file pyrcel_conda.yml
        conda activate pyrcel
        pip install https://github.com/darothen/pyrcel.git
  - Copy [basic_run.ipynb](https://www.dropbox.com/scl/fi/1f7n48b2vd7jwocsnov4n/basic_run.ipynb?rlkey=apws9hpk249fgcbrus80vrr6m&dl=0) and [activate.ipynb]( https://www.dropbox.com/scl/fi/gqsoqxbm14bbdlun7xsla/activate.ipynb?rlkey=nyb67su0tthwmr734cnvip2lu&dl=0) into the folder and run them with jupyter lab.

### Worksheet

- {ref}`adiabatic_water` and [notebook download](https://www.dropbox.com/scl/fi/eykr5q2pthqjbsqwp1ej8/dropgrow_2024_3.ipynb?rlkey=dp1d1feciml52zwtpuul7tbs2&dl=0)

#### Final preparation

- [2016 final exam](https://www.dropbox.com/scl/fi/nw6qin974wovopcoxyt6f/a405_final_2016.pdf?rlkey=yyb8f8j9iqyf0ua6e14dlhubw&dl=0) 

#### For Tuesday

- Read Lohamnn Section 6.6 on aerosol counters
- Read [Wallace and Hobbs chapter 6 section 6.7 pp 252-259](https://www.dropbox.com/scl/fi/r7zhctw6usest2rirpe2f/wallace_hobbs_chap6.pdf?rlkey=oxdanppj9wkocmwe4nn4cc4fi&dl=0) on thunderstorm electrification


## week 12

### Tuesday

- Aerosol counter review

- Lightning review

#### Worksheet

- Finish - {ref}`adiabatic_water`  -- [notebook download](https://www.dropbox.com/scl/fi/eykr5q2pthqjbsqwp1ej8/dropgrow_2024_3.ipynb?rlkey=dp1d1feciml52zwtpuul7tbs2&dl=0)

#### Assignments

- {ref}`assignment_8`  -- due today at midnight
- {ref}`assignment_9`  -- due Tuesday at midnight

### Thursday

- [NYtimes article on cloud brightening](https://www.nytimes.com/2024/04/02/climate/global-warming-clouds-solar-geoengineering.html)

#### from Tuesday

- {ref}`adiabatic_water_solution` with [download](https://www.dropbox.com/scl/fi/ymrutl28tqw2mcrfz4c64/dropgrow_2024_3_solution.ipynb?rlkey=lcwqrvdzynfepyo5uyck3cpb2&dl=0)
  
#### New worksheet

- {ref}`mixing_line_calc` and  [workbook download](https://www.dropbox.com/scl/fi/b9h5qne3eufs4r2s10q5x/mixing_line_calc.ipynb?rlkey=8072k8iiny4fuzqwx4b1jfre3&dl=0)
