% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/song.simulate.R
\name{song.Simulate}
\alias{song.Simulate}
\title{Compare observed overlap to chance expectations.}
\usage{
song.Simulate(indivs, num.rand = 100, overlap.function = "song.TimeOverlap",
  randomize.function = "song.RandomizeSampleGaps")
}
\arguments{
\item{indivs}{A list created by \code{\link{song.FromDataObj}} or
\code{\link{song.FromTextFile}} that contains the performance statistics of
each individual.}

\item{num.rand}{A numeric value indicating the desired number of
randomizations.}

\item{overlap.function}{The function to be used to calculate the amount of
overlap. \code{\link{song.TimeOverlap}} returns the duration of overlap
in seconds; \code{\link{song.NumOverlap}} returns the number of overlapping
songs.}

\item{randomize.function}{The function to be used to generate the randomized
performances for each individual. Options include
\code{\link{song.RandomizeSampleGaps}},
\code{\link{song.RandomizeKeepGaps}}, and
\code{\link{song.RandomizeKeepSongOrder}}.}
}
\value{
\code{song.Simulate} returns a list containing the components
described below. In each output matrix, the row name specifies the reference
individual, while the column name specifies the target (or randomized)
individual. Overlap is measured for the target individual with respect to
the reference individual.
\describe{
  \item{observed}{A matrix containing the amount of overlap in the observed
  interaction for each possible pair of individuals.}
  \item{expected}{A matrix containing the average amount of overlap in the
  randomized interactions for each possible pair of individuals. These
  values represent the expected amounts of overlap due to chance.}
  \item{p.values}{A matrix containing the p-values associated with each
  possible pair of individuals.}
  \item{randomized}{A three-dimensional array containing the amount of
  overlap occurring in each randomized interaction. Each "slice" corresponds
  to one randomization, containing the amount of overlap for each possible pair of
  individuals. These values make up the null distribution.}
  \item{overlap.method}{The function used to calculate the amount of
  overlap.}
  \item{randomize.method}{The function used to generate the randomized
  interactions.}
}
}
\description{
\code{song.Simulate} uses resampling randomization to calculate the expected
amount of chance overlap for a given interaction, then compares the observed
amount of overlap to this expectation to generate a p-value.
}
\details{
\code{song.Simulate} generates a user-defined number of randomized
performances for each individual. The function then selects one individual
as the "reference" and another as the "target" to create a set of randomized
interactions, pairing the reference individual's observed performance with
each of the target's randomized performances. \code{song.Simulate}
calculates the amount of overlap occuring during each of these randomized
interactions to generate the null distribution (i.e. the amount of overlap
expected due to chance). The p-value is calculated as the percentage of
randomized interactions in which the amount of overlap is greater than the
amount of overlap in the observed interaction. This process is repeated for
each possible combination of reference and target individuals.
}
\examples{
c <- song.FromDataObj(chickadees)
c.sim <- song.Simulate(c, num.rand = 100, song.TimeOverlap,
                        song.RandomizeSampleGaps)
## Duration of overlap in the observed interaction
c.sim$observed
## Duration of overlap expected due to chance
c.sim$expected
## How does observed overlap compare to chance?
c.sim$p.values
}
\seealso{
\code{\link{song.PlotResultsDensity}} for visualizing the output of
\code{song.Simulate}, and \code{\link{song.Summarize}} for displaying the
output in a user-friendly table.
}

