% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gmoviz.R
\name{getLabels}
\alias{getLabels}
\title{Generate a GRanges of labels from .gff files}
\usage{
getLabels(gff_file, colour_code = TRUE,
  colours = bright_colours_opaque)
}
\arguments{
\item{gff_file}{Location of the gff file to read in.}

\item{colour_code}{If \code{TRUE}, the labels will be assigned colours
according to the 'type' field of the gff file. If \code{FALSE}, colours will
not be assigned.}

\item{colours}{A character vector of colours to be used to colour code
the labels (if \code{colour_code} is \code{TRUE}).}
}
\value{
A GRanges containing the gene label data. See
\code{\link{gmovizInitialise}} for a detailed description of the format.
}
\description{
Uses a .gff file to create a GRanges of labels which can then
be plotted with the \code{label_data} argument of many functions in this
package such as \code{\link{gmovizInitialise}},
\code{\link{insertionDiagram}} or \code{\link{featureDiagram}}.
}
\examples{
## example .gff
path <- system.file('extdata', 'example.gff3', package='gmoviz')

## colour coded
getLabels(path)

## not colour coded (all black)
getLabels(path, colour_code=FALSE)
}
\seealso{
\code{\link{getFeatures}} for a function which reads the entries
of a .gff file into 'features' rather than labels. Also
\code{\link{gmovizInitialise}}, \code{\link{insertionDiagram}} and
\code{\link{featureDiagram}} for functions which can plot this data.
}
