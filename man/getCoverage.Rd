% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gmoviz.R
\name{getCoverage}
\alias{getCoverage}
\title{Import coverage data from .bam file}
\usage{
getCoverage(regions_of_interest, bam_file, window_size = 1,
  smoothing_window_size = NULL)
}
\arguments{
\item{regions_of_interest}{either a \linkS4class{GRanges} of regions OR a
character vector of sequences/chromosomes to find the coverage for (please
be careful that the names here match the spelling/format of those in the
bam file).}

\item{bam_file}{Location of the bam file from which to read coverage data.}

\item{window_size}{The size of the window to for calculating coverage
(default is 1; per base coverage). Use \code{smoothCoverage} to smooth the
data, this is more for reducing time taken to read in and plot coverage
over a large number of bases.}

\item{smoothing_window_size}{If supplied, then moving average smoothing will
be applied using the \code{\link[pracma]{movavg}} function from the package
\pkg{pracma} (please make sure it's installed). Note: smoothing may take
some time when there are many points involved. Please be patient, or
proceed without smoothing.}
}
\value{
A \linkS4class{GRanges} containing the coverage data in the metadata
column 'coverage'.
}
\description{
Uses RSamtools to import coverage data from .bam file and
format it appropriately for plotting with gmoviz.
}
\examples{
## the example .bam file
path <- system.file('extdata', 'ex1.bam', package='Rsamtools')

## example without smoothing or windowing
getCoverage(regions_of_interest='seq1', bam_file=path)

## using windowing
getCoverage(regions_of_interest='seq1', bam_file=path, window_size=5)

## using smoothing
getCoverage(regions_of_interest='seq1', bam_file=path,
smoothing_window_size=3)

## specifying only a particular region to read in using GRanges
small_range <- GRanges('seq1', IRanges(0, 500))
getCoverage(regions_of_interest=small_range, bam_file=path)
## please be very careful that the sequence names are spelled exactly like
## in the bam file or you'll get an error! The following WON'T WORK.
\dontrun{
getCoverage(regions_of_interest='chr1', bam_file=path)}

}
\seealso{
The \code{\link{gmovizInitialise}},
\code{\link{drawLinegraphTrack}}, \code{\link{insertionDiagram}} and
\code{\link{featureDiagram}} functions which can plot the coverage data.
}
