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
