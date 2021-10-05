## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)
library(mazing)
oldpar <- par(mar=c(0,0,0,0))

## ----m1-----------------------------------------------------------------------
m <- maze(35,100)
plot(m, lwd = 3)

## ----mcircle------------------------------------------------------------------
mat <- matrix(1, 20, 20)
for(i in 1:nrow(mat)){
    for(j in 1:ncol(mat)){
        if((i-10.5)^2+(j-10.5)^2 > 100){
            mat[i,j] <- 0
        }
    }
}
m <- as.maze(mat)
plot(m, lwd = 4)

## ----mcircWalls---------------------------------------------------------------
plot(m, walls = TRUE)

## ----mcircBoth----------------------------------------------------------------
plot(m, walls = TRUE)
lines(m, lwd = 3, col = 2)
legend('topright', lwd = c(1,3), col = c(1,2), legend = c('walls','paths'), bty = 'n')

## ----openings-----------------------------------------------------------------
plot(m, walls = TRUE, openings = c('left','right'),
     openings_direction = c('left','right'))

## ----openings2----------------------------------------------------------------
lair <- matrix(c(10,10,11,11, 10,11,10,11), ncol = 2)
plot(m, walls = TRUE, openings = lair, openings_direction = 'all')
points(10.5,10.5, pch = 6, col = 'brown')
points(10.5,10.5, pch = 20, col = 'brown')

## ----mAdjust------------------------------------------------------------------
plot(m, lwd = 8)
lines(m, lwd = 8, col = 4, adjust = c(.2,.2))

## ----mAdjust2-----------------------------------------------------------------
plot(m, lwd=10, col = 'pink')
lines(m, lwd=8, col = 'black', adjust = c(.2,.2))
lines(m, lwd=6, col='turquoise', adjust = c(.4,.4))

## ----solve--------------------------------------------------------------------
p <- solve_maze(m, start = 'left', end = 'right')
plot(m, walls = TRUE)
lines(p, lwd = 3, col = 2)

## ----solvepoints--------------------------------------------------------------
plot(m, walls = TRUE)
lines(p, lwd = 3, col = 2)
# add start and end points
endpoints <- find_maze_refpoint(c('left','right'), m)
points(endpoints, pch = 16, col = c(3,2))

## ----customsolve--------------------------------------------------------------
start <- c(10, 3)
end <- c(15, 16)
p <- solve_maze(m, start = start, end = end)

plot(m, walls = TRUE)
lines(p, lwd = 3, col = 2)
# add start and end points
points(rbind(start,end), pch = 16, col = c(3,2))

## ----msquared, fig.height=8---------------------------------------------------
m <- maze(10, 10)
m <- maze2binary(m)
m <- expand_matrix(expand_matrix(expand_matrix(m)))
m <- widen_paths(widen_paths(widen_paths(m)))
m <- as.maze(m)
plot(m, lwd=2)

## ----external-----------------------------------------------------------------
require(emojifont)
file <- tempfile(pattern = 'elephant', fileext = 'png')
png(file, width = 500, height = 500)
par(mar=c(0,0,0,0))
plot(1, 1, cex=0, axes = FALSE, xlab = '', ylab = '')
text(1, 1, labels = emoji('elephant'), cex=30, family='EmojiOne')
dev.off()

## ----elephantmaze, fig.height=8-----------------------------------------------
require(png)
mat <- readPNG(file)
mat <- round(mat[,,1]) # red channel
mat <- condense_matrix(condense_matrix(mat))
mat <- round(mat)
# reverse the order of the rows to flip vertically
m <- as.maze(mat[nrow(mat):1,])

par(mar=c(0,0,0,0))
plot(c(1,ncol(m)), c(1,nrow(m)), cex = 0, asp = 1)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col =  "black")
lines(m, lwd = 3, col = 'white', lend = 2)

## ----reset, echo=FALSE--------------------------------------------------------
par(oldpar)

## ----info---------------------------------------------------------------------
sessionInfo()

