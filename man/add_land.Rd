% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_land.R
\name{add_land}
\alias{add_land}
\title{Add a land layer on basemaps}
\usage{
add_land(plot = NULL, keep.glaciers = FALSE, land.col = "grey60",
  size.land = 0.1, border.col.land = "black", gla.col = "grey95",
  size.glacier = 0.1, border.col.glacier = "black",
  grid.col = "grey70", size.grid = 0.1, label.print = FALSE,
  label.offset = 1.05, label.font = 8)
}
\arguments{
\item{plot}{Not implemented yet. \code{\link{basemap}} where the land should be added to. Extracts the definitions automatically.}

\item{keep.glaciers}{Logical indicating whether glaciers should be kept for the Svalbard maps. Setting this to \code{FALSE} speeds up map plotting by a few seconds.}

\item{land.col}{Character code specifying the color of land.}

\item{size.land}{Numeric value specifying the width of the border line for land shapes. See details for explanation about line widths.}

\item{border.col.land}{Character code specifying the color of the border line for land shapes.}

\item{gla.col}{Character code specifying the color of glaciers.}

\item{size.glacier}{Numeric value specifying the width of the border line for glacier shapes.}

\item{border.col.glacier}{Character code specifying the color of the border line for glacier shapes.}

\item{grid.col}{Character code specifying the color of grid lines. Use \code{NA} to remove the grid lines.}

\item{size.grid}{Numeric value specifying the width of the grid lines.}

\item{label.print}{Logical indicating whether labels should be printed for polar stereographic maps.}

\item{label.offset}{Offset between the round polar stereographic maps and longitude labels. Optimized for a pdf output. Use 1.1 for larger size figures.}

\item{label.font}{Numeric value specifying the font size for labels in polar stereographic maps. Note that this value defines the actual font size in points, not the \code{ggplot2} font size.}
}
\description{
Adds a layer of land on \code{\link{basemap}} plots
}
\author{
Mikko Vihtakari
}
