% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_functions.R
\name{maze2binary}
\alias{maze2binary}
\title{Convert maze to binary matrix}
\usage{
maze2binary(m)
}
\arguments{
\item{m}{A \code{\link{maze}} object.}
}
\value{
A binary matrix where values of 1 denote paths through the maze and values of
0 denote the walls (impassable regions) of the maze.
}
\description{
A function to convert a maze object into a binary matrix. This can be useful
for visualization (as when plotting the walls of the maze) and for
constructing complex mazes, such as a maze-within-a-maze.
}
\examples{
m <- maze(10,10)
m2 <- maze2binary(m)

}
