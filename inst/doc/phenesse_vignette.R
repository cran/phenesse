## ----setup, include = FALSE, cache = FALSE------------------------------------
knitr::opts_chunk$set(
  cache = FALSE,
  collapse = TRUE,
  comment = "#>"
)

library(phenesse)


## ----load_phenesse------------------------------------------------------------
library(phenesse)

## ----load_iNat_data-----------------------------------------------------------
inat_examples <- inat_examples

## ----Speyeria_cybele_estimates------------------------------------------------
s_cybele <- subset(inat_examples, scientific_name == "Speyeria cybele")

# calculate onset, note iterations are much lower than desired for quick 
# vignette knit. Increase interations for robust calculations
weib_percentile(observations = s_cybele$doy, percentile = 0, iterations = 20)
#calculate 1st percentile
weib_percentile(observations = s_cybele$doy, percentile = 0.1, iterations = 20)
#calculate 50th percentile
weib_percentile(observations = s_cybele$doy, percentile = 0.5, iterations = 20)

## ----Speyeria_cybele_CIestimates----------------------------------------------
s_cybele <- subset(inat_examples, scientific_name == "Speyeria cybele")

# calculate onset - note ignoring for vignette test
#weib_percentile_ci(observations = s_cybele$doy, iterations = 50,
# percentile = 0.5, bootstraps = 50)
# note warnings of extreme order points used as endpoints is due to the 
# low number of bootsraps used. Please use higher number of bootstraps if 
# using for analyses.

## ----quantile_CIestimates-----------------------------------------------------
r_hirta <- subset(inat_examples, scientific_name == "Rudbeckia hirta")

# calculate 50% quantile and CIs
quantile_ci(observations = r_hirta$doy, percentile = 0.5, bootstraps = 100)

## ----mean_CIestimates---------------------------------------------------------
r_hirta <- subset(inat_examples, scientific_name == "Rudbeckia hirta")

# calculate 50% quantile and CIs
mean_ci(observations = r_hirta$doy, bootstraps = 100)

