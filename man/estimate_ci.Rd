% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{estimate_ci}
\alias{estimate_ci}
\title{Calculate confidence intervals using bootstrap of any statistical function
of interest.}
\usage{
estimate_ci(
  observations,
  .f,
  n_boots,
  parallelize = "no",
  ncpus = getOption("boot.ncpus", 1L),
  cl = NULL,
  type = "perc",
  conf = 0.95
)
}
\arguments{
\item{observations}{is a vector of dates/time of observations given as
numeric values}

\item{.f}{function to use}

\item{n_boots}{is the number of bootstraps you want to run to create the
CIs}

\item{parallelize}{The type of parallel operation to be used (if any). If
missing, the default is that no parallelization will occur. Parallelization
options are "multicore" and "snow"}

\item{ncpus}{An integer that represents the number of processes to be
used in parallel operation.}

\item{cl}{An optional parallel or snow cluster for use if parallel = "snow".
If not supplied, a cluster on the local machine is created for
the duration of the boot call.}

\item{type}{A vector of character strings representing the type of intervals
required to calculate the CI. Defaults to "perc". See ??boot.ci for more
information.}

\item{conf}{The confidence level wanted. Defaults to 95\% CI.}
}
\value{
A data frame with estimate, and the lower and upper points of its confidence interval
}
\description{
Calculate confidence intervals using bootstrap of any statistical function
of interest.
}
