# ASMS 2019 R Workshop Information and Materials

**Getting Started with R for Mass Spectrometry Data Analysis**

*ASMS 2019 Annual Meeting*


## Workshop Information

**Workshop**: Getting Stated with R for Mass Spectrometry Data Analysis

**Date**: Wednesday June 5 2019, 5:45 -- 7:00 PM

**Location**: Georgia World Congress Center, A305

**Description**:

This workshop, targeted at beginner and aspiring R users, will introduce the R programming language and the ways it can be used for mass spectrometry data analysis (and data analysis in general). The workshop will start with a gentle introduction to R and the basics of using RStudio, followed by essential data manipulation and analysis strategies using base R and tidyverse packages. Finally, analysis examples utilizing various mass spectrometry specific R packages will be presented. The goal of this workshop is to help new R users get over some of the initial roadblocks beginners often face and to kickstart their efforts toward learning how to use R effectively for data analysis tasks. Bring your laptop to follow along with the examples. Preparatory material for the workshop will be provided at: https://github.com/ZenBrayn/asms-2019-r-workshop

## Schedule

| Time | Topic | 
| :-  | :- |
| 5:45 – 6:00 PM | Introduction & Overview |
| 6:00 – 6:15 PM | Introduction to R & RStudio |
| 6:15 – 6:30 PM | Data Manipulation & Analysis |
| 6:30 – 6:45 PM | R Packages for Mass Spectrometry |
| 6:45 – 7:00 PM | Questions & Discussion |

## Pre-workshop Preparation

1. Install R and RStudio -- see the [Installing R & RStudio presentation](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/installing_r.pdf) for detailed instructions.
2. Test your environment in RStudio
    - Launch the RStudio application
    - You should see a *Console* window on the left side, with information about the R version you're currently running.
    - Try entering a simple R command, e.g. `2 + 2`, to make sure R is working.
    - If there is a problem with your R installation, RStudio should display a warning dialog when you launch the application.  If this happens, re-check your steps in the above presentation and/or Google any error messages you get.
3. Install the `tidyverse` packages within RStudio using `Tools → Install Packages...`, then enter `tidyverse` in the `Packages` field of the dialog.  This will install multiple packages from the core `tidyverse` set that we'll used for the *Data Manipulation and Analysis* section. See the [tidyverse site](https://tidyverse.tidyverse.org) for more information.
4. If you'd like to dig in more, check out the (free online) book [R for Data Science](https://r4ds.had.co.nz).  While not specifically targeted at beginner R users, it does give a friendly walkthrough of the entire data analysis cycle using R and the `tidyverse`.  This is a great resource for all R users of all levels.

## Workshop Materials

*Presentations*

* [Installing R & RStudio](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/00_installing_r.pdf)
* [Workshop Overview](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/01_workshop_overview.pdf)
* [Getting Started with R & RStudio](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/02_r_rstudio_basics.pdf)
* [Data Manipulation & Analysis with R & the tidyverse](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/03_data_manipulation_analysis.pdf)
* [Mass Spec Packages for R](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/04_ms_packages.pdf)
* [Wrap-up & Resources](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/05_wrap_up_resources.pdf)

*Example Code*

* [Very Brief Introduction to R](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/code/00_quick_r_intro.R)
* [dplyr Examples](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/code/01_dplyr_storms_example.R)
* [ggplot2 Examples](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/code/02_ggplot2_storms_example.R)
* [mzR Examples](https://github.com/ZenBrayn/asms-2019-r-workshop/blob/master/code/03_mzR_example.R)




