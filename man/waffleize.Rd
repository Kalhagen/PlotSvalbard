% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/waffle_charts.R
\name{waffleize}
\alias{waffleize}
\title{Prepare data for waffle plots}
\usage{
waffleize(dt, fill, value, composition = TRUE, max_value = NULL,
  digits = 3)
}
\arguments{
\item{dt}{data frame containing the data which should be transformed}

\item{fill}{character specifying the column name which should be used as fill for the waffle plot.}

\item{value}{character specifying the column name which contains values of the \code{fill} variable.}

\item{composition}{logical indicating whether a compositional waffle (i.e. fill adds up to 100\%) should be created. If \code{FALSE}, waffle cells will be scaled to \code{max_value} and missing cells filled with an "empty" category.}

\item{max_value}{numerical giving the value to which waffle cells should be scaled to, if \code{composition = FALSE}.}

\item{digits}{integer indicating the number of decimal places to be used in rounding of the waffle cells.}
}
\value{
returns a \link[tibble]{tibble} data frame containing the minimum and maximum extent of each \code{fill} level.
}
\description{
Manipulates a data frame ready for plotting with the \code{\link{waffle_chart}} function.
}
\seealso{
Other waffle: \code{\link{round_preserve_sum}},
  \code{\link{waffle_chart}}
}
\author{
Mikko Vihtakari
}
\concept{waffle}
\keyword{internal}
