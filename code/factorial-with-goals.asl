!print_fact(5). // 👈 '!' states the THIS is the goal to be achieved
// 👆 i.e., the initial goal is to print the factorial of 5

+!print_fact(N)
    <- !fact(N,F); // 👈 The goal can be achieved by, FIRST, calculating the fact of N
    .print("Factorial of ", N, " is ", F). // 👈 and AFTER THAT printing out the result

+!fact(N,1): N == 0. // 👈 If N == 0, the factorial is known to be be 1
// 👆 Nothing needs to be calculated

+!fact(N,F) : N > 0
    <- !fact(N-1,F1); // 👈 If the goal is fact of N (N>0), FIRST do fact of N-1 
    F = F1 * N. // 👈 and AFTER THAT multiply that value by N to get the factorial of N