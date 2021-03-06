% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gmoviz.R
\name{drawScatterplotTrack}
\alias{drawScatterplotTrack}
\title{Add a scatterplot track to an existing plot}
\usage{
drawScatterplotTrack(plot_data, track_border_colour = "black",
  track_height = 0.3, point_bicolour_cutoff = NULL,
  point_colour = "black", point_outline_colour = "black",
  point_size = 0.55, point_type = 21, ylim = NULL,
  yaxis_increment = NULL, show_yaxis = TRUE, yaxis_label_size = 0.6,
  yaxis_tick_size = 0.5, yaxis_location = CELL_META$sector.index,
  yaxis_side = "left", yaxis_colour = "black", show_gridlines = TRUE,
  gridline_colour = "#aaaaaa")
}
\arguments{
\item{plot_data}{Either: (1) a \linkS4class{GRanges} object with a metadata
column of y values to plot OR (2) a data frame with four columns; \code{chr}
(should match those supplied when initialising the plot); \code{start} and
\code{end} (x values of the point: can both be the same if you only have
a single x value for position) and then a fourth column of y values.}

\item{track_border_colour}{Colour of the border of the plotting region.}

\item{track_height}{The proportion (between 0 and 1) of the circle
taken up by this track.}

\item{point_bicolour_cutoff}{A numeric threshold for the colour of the
points (points above/below this number will be different colours).}

\item{point_colour}{The fill colour of the points. If \code{
point_bicolour_cutoff != NULL} then this should be a vector with two
elements.}

\item{point_outline_colour}{The colour of the outline of the points. If
using point_bicolour_cutoff then this should be a vector with two elements.}

\item{point_size}{Size of the points.}

\item{point_type}{Type (shape) of the points, same as base R.}

\item{ylim}{Vector of length 2; upper and lower limits for y axis.}

\item{yaxis_increment}{The increment the y axis and gridlines will use.}

\item{show_yaxis}{If \code{TRUE}, a y axis will be drawn.}

\item{yaxis_label_size}{Size of the labels on the y axis.}

\item{yaxis_tick_size}{Size of the ticks on the y axis.}

\item{yaxis_location}{Sector the y axis is drawn on.}

\item{yaxis_side}{Side of the sector the y axis is on; either \code{'left'}
or \code{'right'}.}

\item{yaxis_colour}{Colour of the y axis.}

\item{show_gridlines}{If \code{TRUE} then gridlines will be drawn.}

\item{gridline_colour}{Colour of the gridlines.}
}
\value{
Adds a scatterplot track to existing visualisation.
}
\description{
Adds a scatterplot track to the existing plot. Must have
initialised the circular plot (by \code{\link{gmovizInitialise}} first).
}
\examples{
## you must initialise first!
small_ideo <- data.frame(chr=c('region 1', 'region 2', 'region 3'),
                         start=c(0, 0, 0), end=c(10000, 12000, 10000))
gmovizInitialise(small_ideo, custom_sector_width=c(0.3, 0.3, 0.3))

## make the data
smallplot_data <- data.frame(
chr = sample(c('region 1', 'region 2','region 3'), size=40, replace=TRUE),
start = seq(0, 10000, length.out=40), end = seq(0, 10000, length.out=40),
val = rnorm(40, 2, 0.5))

## scatterplot where all points are the same colour
drawScatterplotTrack(smallplot_data)

## scatterplot with bi-colour cutoff of 2
drawScatterplotTrack(smallplot_data, point_bicolour_cutoff=2,
                     point_colour=c('red', 'blue'),
                     point_outline_colour=c('black', 'black'))
}
\seealso{
\code{\link{gmovizInitialise}}, which must be used to initialise
the graph before this function. Also \code{\link{drawLinegraphTrack}} for a
similar function which displays data as a line graph instead.
}
