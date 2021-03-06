% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internal_utility_functions.R
\name{formatterUTMkm}
\alias{formatterUTMkm}
\title{Convert direct UTM distances to kilometers}
\usage{
formatterUTMkm(x)
}
\arguments{
\item{x}{numeric to be converted}
}
\description{
Divides \code{x} by 1000 (i.e from meters to kilometers, since polar stereographic are meters from the North Pole). Used for ggplot2 labels.
}
\keyword{internal}
