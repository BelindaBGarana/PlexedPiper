% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remap_fasta.R
\name{remap_accessions_fasta}
\alias{remap_accessions_fasta}
\alias{remap_accessions_refseq_to_gene_fasta}
\alias{remap_accessions_uniprot_to_gene_fasta}
\title{Remap Sequence IDs in FASTA File}
\usage{
remap_accessions_refseq_to_gene_fasta(
  path_to_FASTA,
  organism_name,
  conversion_table
)

remap_accessions_uniprot_to_gene_fasta(path_to_FASTA)
}
\arguments{
\item{path_to_FASTA}{(character) path to FASTA file.}

\item{organism_name}{(character) scientific name of organism (e.g. \code{"Homo sapiens"}, \code{"Rattus norvegicus"}, \code{"Mus musculus"}, etc.). Not required if
\code{conversion_table} is supplied.}

\item{conversion_table}{(data.frame) optional data frame with two columns:
REFSEQ or UNIPROT and SYMBOL (in that order). If not provided, it will be
created with \code{\link[MSnID]{fetch_conversion_table}}.}
}
\value{
Path to remapped FASTA file.
}
\description{
These functions remap the IDs in the FASTA file from RefSeq IDs
or UniProt accessions to Gene symbols. If a single gene matches more than
one protein sequence, only the longest sequence is retained.
}
\examples{
\dontrun{
path_to_FASTA <- system.file(
  "extdata/Rattus_norvegicus_NCBI_RefSeq_2018-04-10.fasta.gz",
  package = "PlexedPiperTestData"
)
temp_work_dir <- tempdir() # can be set to "." or getwd(), if done carefully
file.copy(path_to_FASTA, temp_work_dir)
path_to_FASTA <- file.path(temp_work_dir, basename(path_to_FASTA))
library(Biostrings)
readAAStringSet(path_to_FASTA) # RefSeq IDs
path_to_new_FASTA <- remap_accessions_refseq_to_gene_fasta(
  path_to_FASTA, organism_name = "Rattus norvegicus"
)
readAAStringSet(path_to_new_FASTA) # gene symbols
}
}
