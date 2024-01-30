# Week notes

## Lecture 2, week 1, Thursday:  

- Read Lohmann chapter 1 and scan the questions at the end of the chapter

- My slide show: [slides on boundary layer clouds and climate](https://phaustin.github.io/talks/cloud_talk.html)

### Learning objectives

  - Identify principal cloud types
  - Explain how clouds can both heat and cool the planet
  - Work some simple scaling problems about clouds

## Lecture 3, week 1, Friday

- Thompkins through page 8
- Finish {ref}`worksheet1_solution`
- Do the adiabatic box assignment (due Friday)

### Lecture 3 Reading notes

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

## Lecture 4, week 2, Tuesday

- Thompkins through page 14
- Review my notes on [kinetic temperature](https://www.dropbox.com/scl/fi/uanlie1sdyiz4ezbclopt/temperature_notes.pdf?rlkey=leatk6yrhmw137i9dl6j8ojlq&dl=0)

- Introduce my notes on [the first law of thermodynamics](https://www.dropbox.com/scl/fi/j7bq6cc7r40vkx3og14qh/first_law_notes.pdf?rlkey=66r1y4umxtc1hgwfbylxlzoxt&dl=0)

- Introduce my notes on [entropy and potential temperature](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0)

### Worksheet 2

- Download here: [worksheet2](https://www.dropbox.com/scl/fi/fbd17mi8zicladk2f9ubl/worksheet2.ipynb?rlkey=3id3nusgybporoz2o2r3qk3cc&dl=0)

### For Thursday

- Read the [the first law of thermodynamics](https://www.dropbox.com/scl/fi/j7bq6cc7r40vkx3og14qh/first_law_notes.pdf?rlkey=66r1y4umxtc1hgwfbylxlzoxt&dl=0) and the [entropy and potential temperature](https://www.dropbox.com/scl/fi/iknh9dm4iu1tfssa4724j/entropy.pdf?rlkey=buxyohh3w52ou6vk774s3xexq&dl=0) notes

- Work on the adiabatic box assignment

## Lecture 5, week 2, Thursday

- Questions on the adiabatic box assignment
- Review my notes on the first law of thermodynamcis
- Review my notes on entropy and potential temperature
- Introduce my notes on {ref}`hydro`

## Lecture 6, week 2, Friday

- Covered Thompkins section 1.10 on thermodynamic charts
- Went over the {ref}`skew_coords_solution` notebook

### For Tuesday

Read the rest of Thompkins Chapter 1 on bouyancy

## Lecture 7, week 3, Tuesday

- Go over {ref}`skew_coords_solution` with metpy skewT
- More on Thompkins hydrostatic balance (p. 10) 
  Connect weighted averages and scale heights with the [weighted averages onte](https://www.dropbox.com/scl/fi/sosiyoxa9bzhecea5qas9/hydro.pdf?rlkey=7wll6s0yc4t0dlojzx56082iw&dl=0)
- Review numpy integration and differentiation with {ref}`derivs_ints`
- Start on {ref}`assign2_hydro`

### For Thursday

- Read Thompkins Chapter 2 through p. 30
- Read my [buoyancy notes](https://www.dropbox.com/scl/fi/ygb2bi2riqo23ostxo8lw/buoyancy.pdf?rlkey=b80rbwtzartk4qp5dt9gjvsf6&dl=0)
- Work on Assignment 2

## Lecture 8, week 3, Thursday

- Work through the {ref}`xarray_intro` notebook
- Tomorrow we'll use xarray to do the {ref}`tropical_clouds` notebook

## Lecture 9, week 3, Friday

- Do the {ref}`tropical_clouds` worksheet
- For Tuesday read the Lohamnn text Section 2.4 on phase transitions -- this covers the same material as Thompkins but in more detail
- For Tuesday finish Assignment 2 -- will release the hand in notebook this weekend


## Lecture 10, week 4, Tuesday

- Background/detail on free energy, thermodynamic potentials and the Clausius-Clapyron equation  (Lohmann Section 2.4, Thompson pp. 25-27.

- Go over my notes on [Maxwell relationships](https://www.dropbox.com/scl/fi/puuzbbzszhue73nrew726/maxwell.pdf?rlkey=fntdkgs90o4otc3s6lme85mz3&dl=0)

- Read for Thursday

  - My notes on the [Clausius Clapyron equation](https://www.dropbox.com/scl/fi/o7d278acumkgmwe4y6qlu/clausius.pdf?rlkey=ktd5fvdwaz7ishuxozwmf6kwa&dl=0) 
  - From Shroeder's textbook:  3 pages on [free energy](https://www.dropbox.com/scl/fi/qc44gc8j1t3vh6w4e15nl/schroeder_chap_5.pdf?rlkey=mpt2r7eeksre5xhi4guf96h7q&dl=0)
  