% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/section_plot.R
\name{section_plot}
\alias{section_plot}
\title{Make an oceanographic section plot from an x-y-z data frame}
\usage{
section_plot(df, x, y, z, bottom = NULL, interpolate = FALSE,
  interp_method = "mba", log_y = FALSE, xlab = "Distance",
  ylab = "Depth", zlab = "Variable", ybreaks = waiver(),
  xbreaks = waiver(), zbreaks = waiver(), contour = NULL,
  contour_label_cex = 0.8, contour_color = "white", xlim = NULL,
  ylim = NULL, zlim = NULL, zscale = "viridis", zcolor = "black",
  add_bottom = NULL, sampling_indicator = "lines",
  legend.position = "right", base_size = 10, ...)
}
\arguments{
\item{df}{Data frame containing the data}

\item{x}{Character specifying the column name which should be used as x (=distance) axis}

\item{y}{Character specifying the column name which should be used as y (=depth) axis. The y axis will be inverted in the resulting plot.}

\item{z}{Character specifying the column name which should be for bubbles or interpolation fill depending on the \code{interpolate} argument.}

\item{bottom}{Optional character specifying the column name which contains bottom depths OR a data frame with x-axis values in the first column and bottom depths in the second column. If provided, unique combinations of \code{x} and \code{bottom} will be used to plot bottom for the section plot}

\item{interpolate}{Logical indicating whether an interpolated section plot (\code{TRUE}) or a bubble plot (\code{FALSE}) should be returned.}

\item{interp_method}{(\code{interpolate = TRUE} only). Character specifying the interpolation method. See \code{\link{interpolate_section}}.}

\item{log_y}{logical indicating whether the y-axis should be \code{log10(y + 10)} transformed before plotting. Helps showing differences close to the surface if some stations are much deeper than others.}

\item{xlab, ylab, zlab}{Character specifying the labels for the x-axis, y-axis and legend, respectively.}

\item{xbreaks, ybreaks, zbreaks}{Numeric vector specifying the breaks for the x-axis, y-axis and legend. See \link[ggplot2]{scale_continuous}.}

\item{contour}{(\code{interpolate = TRUE} only). Numeric vector defining breaks for contour lines. Use \code{NULL} not to plot the contour lines.}

\item{contour_label_cex}{Numeric giving the \code{cex} (=size) parameter for contour labels. See \code{\link[directlabels]{geom_dl}}.}

\item{contour_color}{Character defining the color to be used for contour lines and labels.}

\item{xlim, ylim}{Numeric vector of length two providing limits of the scale. Use NA to refer to the existing minimum or maximum. Use \code{NULL} for default limits.}

\item{zlim}{Numeric vector of length two providing limits for fill or bubble size. Any values outside these limits will get the extreme values defined by \code{zrange} (using the \code{\link[scales]{squish}} function).}

\item{zscale}{(\code{interpolate = TRUE} only). Character specifying the color scale for interpolation tile fill. Either one of the \code{\link[ggplot2]{scale_colour_viridis_c}} \code{option} alternatives ("A", "B", "C", or "D") or "gradient2" for a \code{\link[ggplot2]{scale_colour_gradient2}} (red-white-blue) color scale. Note that you can use the ggplot2 color scale arguments to adjust the color scales as you want. Just place them inside the \code{section_plot} function.}

\item{zcolor}{(\code{interpolate = FALSE} only). Character specifying the color of bubbles. Use column name in \code{df} to scale a variable to bubble color (not implemented yet, here as a reminder).}

\item{add_bottom}{Numeric vector of length two providing the depths that should be added to \code{bottom} at the extremes (\code{\link[base]{range}}) of \code{xbreaks}. Useful for extending the plot giving space for graphical elements.}

\item{sampling_indicator}{(\code{interpolate = TRUE} only). Character giving the style of sampling indicator. Alternatives:
\itemize{
\item \code{"lines"} A dashed line reaching from data start depth to end depth at each station. Recommended for CTD sections.
\item \code{"points"} Points indicating the vertical and horizontal location of sample. Recommended for water samples.
\item \code{"ticks"} A black tick mark above the plot indicating the horizontal location of each station. A way to avoid clutter.
\item \code{"none"} No sampling indicator will be plotted.
}}

\item{legend.position}{Position for the ggplot legend. See the argument with the same name in \link[ggplot2]{theme}.}

\item{base_size}{Base size parameter for ggplot. See \link[ggplot2]{theme_bw}.}

\item{...}{Additional arguments passed to color and size scales. See \code{\link[ggplot2]{scale_colour_gradient2}}, \code{\link[ggplot2]{scale_colour_viridis_c}} and \code{\link[ggplot2]{scale_size}}.}
}
\value{
Returns either an interpolated section (\code{\link[ggplot2]{geom_tile}}) or a bubble (\code{\link[ggplot2]{geom_point}}) ggplot2 object.
}
\description{
Creates an oceanographic section plot from a data frame using ggplot2. Returns either an interpolated section or a bubble plot.
}
\details{
Note that you can use the ggplot2 color and size scale arguments to adjust the scales as you want. Just place them inside the \code{section_plot} function. See \code{\link[ggplot2]{scale_colour_gradient2}}, \code{\link[ggplot2]{scale_colour_viridis_c}} and \code{\link[ggplot2]{scale_size}}.
}
\examples{
# Bubble plots
section_plot(df = chlorophyll[grepl("KpN.|Kb[0-4]", chlorophyll$Station),], x = "lon", y = "From",
  z = "Chla")

# Interpolated CTD sections
## Standard temperature section plot. Difficult to see surface due to large differences in y-scale
section_plot(ctd_rijpfjord, x = "dist", y = "pressure", z = "temp", bottom = "bdepth",
interpolate = TRUE)

## Logarithmic y axis
section_plot(ctd_rijpfjord, x = "dist", y = "pressure", z = "temp", bottom = "bdepth",
interpolate = TRUE, log_y = TRUE)

## Contour lines
section_plot(ctd_rijpfjord, x = "dist", y = "pressure", z = "temp", bottom = "bdepth",
interpolate = TRUE, log_y = TRUE, contour = c(-1.8, 0, 1, 3))
}
\author{
Mikko Vihtakari
}
