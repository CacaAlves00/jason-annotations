fact(0,1,5). // 👈 Initial belief that end up calculating the factorial of 5
// 👆 First two arguments must always be 0 and 1

+fact(X,Y,Z): X < Z <- +fact(X+1, (X+1)*Y, Z). // 👈 Calculates the factorial of Z
//             👆 X < Z is the context of the trigger

+fact(X,Y,Z): X == Z <- .print("Factorial of ", Z, " == ", Y).

// fact(0,1) triggers fact(1,1)
// fact(1,1) triggers fact(2,2)
// fact(2,2) triggers fact(3,6)
// fact(3,6) triggers fact(4,24)
// fact(4,24) triggers fact(5,120)