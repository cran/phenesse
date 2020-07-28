## ----setup, include = FALSE, cache = FALSE, warning=FALSE---------------------
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

# calculate onset
weib_percentile(observations = s_cybele$doy, percentile = 0.01, iterations = 250) 
# note that the Weibull distribution does not estimate true 0th and 100th percentiles. Therefore the user must choose a percentile (quantile) between 0 and 1. 

#calculate 10th percentile
weib_percentile(observations = s_cybele$doy, percentile = 0.1, iterations = 250)

#calculate 50th percentile
weib_percentile(observations = s_cybele$doy, percentile = 0.5) 

## ----Speyeria_cybele_CIestimates----------------------------------------------
s_cybele <- subset(inat_examples, scientific_name == "Speyeria cybele")

# calculate onset, we're using very low iterations and bootstraps to knit vignette quickly. Please increase both iterations and bootstraps if using for analyses
weib_percentile_ci(observations = s_cybele$doy, iterations = 10,
 percentile = 0.01, bootstraps = 100)
# note warning that extreme order statistics used as endpoints. Increase number of bootstraps to avoid this warning.


## ----parallelize--------------------------------------------------------------
# parallelize the above calculation using multicore parallelization and 4 cores. 
# weib_percentile_ci(observations = s_cybele$doy, iterations = 10,
#                    percentile = 0.01, bootstraps = 100, 
#                   parallelize = "multicore", ncpus = 4)
# not run because having multiple cores in running in vignette gives check_rhub warnings

## ----quantile_CIestimates-----------------------------------------------------
r_hirta <- subset(inat_examples, scientific_name == "Rudbeckia hirta")

# calculate 50% quantile and CIs
quantile_ci(observations = r_hirta$doy, percentile = 0.5)

## ----mean_CIestimates---------------------------------------------------------
r_hirta <- subset(inat_examples, scientific_name == "Rudbeckia hirta")

# calculate mean and CIs
mean_ci(observations = r_hirta$doy)

