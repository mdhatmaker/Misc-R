## ----nomessages, echo = FALSE--------------------------------------------
knitr::opts_chunk$set(
  warning = FALSE,
  message = FALSE
)
options(digits=4)
par(mar=c(5,4,1,1)+.1)

## ------------------------------------------------------------------------
library(matlib)

## ------------------------------------------------------------------------
A <- matrix(c(4, 2, 1,
              5, 6, 7,
              1, 0, 3), nrow=3, byrow=TRUE)
det(A)

## ------------------------------------------------------------------------
cat(cofactor(A, 1, 1),  "  ==  ",  1 * det( (A[-1, -1]), "\n" ))
cat(cofactor(A, 1, 2),  "  ==  ", -1 * det( (A[-1, -2]), "\n" ))
cat(cofactor(A, 1, 3),  "  ==  ",  1 * det( (A[-1, -3]), "\n" ))

## ------------------------------------------------------------------------
row_cofactors(A, 1)

## ------------------------------------------------------------------------
A[1,] %*% row_cofactors(A, 1)
all.equal( det(A), c(A[1,] %*% row_cofactors(A, 1)) )

## ------------------------------------------------------------------------
M <- matrix(c(2, 3, 1, 2,
              4, 2, 3, 4,
              1, 4, 2, 2,
              3, 1, 0, 1), nrow=4, ncol=4, byrow=TRUE)
(dsave <- det(M))

# ### 'pivot' on the leading diagonal element, M[1,1]:

## ------------------------------------------------------------------------
(d <- M[1,1])

#-- Reduce row 1, col 1 to 0
(M[1,] <- M[1,, drop=FALSE] / M[1, 1])
(M <- M - M[,1] %*%  M[1,, drop=FALSE])

#-- Drop first row and column
M <- M[-1, -1]

#-- Accumulate the product of pivots
d <- d * M[1, 1]

## ------------------------------------------------------------------------
(M[1,] <- M[1,, drop=FALSE] / M[1,1])
(M <- M - M[,1] %*%  M[1,, drop=FALSE])
M <- M[-1, -1]
d = d * M[1, 1]

## ------------------------------------------------------------------------
(M[1,] <- M[1,, drop=FALSE] / M[1,1])
(M <- M - M[,1] %*%  M[1,, drop=FALSE])
M <- M[-1, -1, drop=FALSE]
d <- d * M[1, 1]

# did we get it right?
all.equal(d, dsave)
