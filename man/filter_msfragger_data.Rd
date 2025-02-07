% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_msfragger_data.R
\name{filter_msfragger_data}
\alias{filter_msfragger_data}
\title{Filtering MSFragger Data}
\usage{
filter_msfragger_data(
  msnid,
  level,
  filtering_criterion = c("pp_prob", "evalue"),
  fdr.max = 0.01,
  n.iter.grid = 500,
  n.iter.nm = 100
)
}
\arguments{
\item{msnid}{(MSnID object) collated MSFragger output}

\item{level}{(character) Level at which to perform FDR filter. The name of a
column in \code{psms(msnid)}. Currently, only \code{"peptide"} or \code{"accession"} are
supported. The added level \code{"SiteID"} makes sense only for PTM data and
first requires mapping of the modification site using
\code{MSnID::map_mod_sites}.}

\item{filtering_criterion}{(character) One of \code{"evalue"} which is expectation
value or \code{"pp_prob"} - peptide prophet probability. Default is "pp_prob".}

\item{fdr.max}{(numeric) Maximum acceptable FDR. Default is 0.01 (1\%).}

\item{n.iter.grid}{(numeric) number of grid-distributed evaluation points.}

\item{n.iter.nm}{(numeric) number of iterations for Nelder-Mead optimization
algorithm.}
}
\value{
(MSnID object) filtered MSFragger output
}
\description{
Filtering MSFragger data. In this implementation, the peptide-level filter
optimizes both ppm and one of Expectation or PeptideProphet Probability
thresholds to achieve maximum number of peptide identifications within a
given FDR constraint.
}
\details{
The accession-level filter optimizes based on \code{peptides_per_1000aa}, so
\code{\link{compute_num_peptides_per_1000aa}} must be used first.
}
\seealso{
\code{\link[MSnID]{MSnIDFilter}}
\code{\link[MSnID]{optimize_filter}} \code{\link[MSnID]{apply_filter}}
}
