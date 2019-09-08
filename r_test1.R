A <- matrix(c(1, 2, -1, 2), 2, 2)
b <- c(2,1)
showEqn(A, b)
c( R(A), R(cbind(A,b)) )             # show ranks
all.equal( R(A), R(cbind(A,b)) )     # consistent?

