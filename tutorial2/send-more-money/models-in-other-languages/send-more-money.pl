# In SICStus Prolog from previous tutorial by R. Barták
solve_naive([S,E,N,D,M,O,R,Y]):-
    Digits1_9 = [1,2,3,4,5,6,7,8,9],
    Digits0_9 = [0|Digits1_9],
    member(S, Digits1_9),
    member(E, Digits0_9), E\=S,
    member(N, Digits0_9), N\=S, N\=E,
    member(D, Digits0_9), D\=S, D\=E, D\=N,
    member(M, Digits1_9), M\=S, M\=E, M\=N, M\=D,
    member(O, Digits0_9), O\=S, O\=E, O\=N, O\=D, O\=M,
    member(R, Digits0_9), R\=S, R\=E, R\=N, R\=D, R\=M, R\=O,
    member(Y, Digits0_9), Y\=S, Y\=E, Y\=N, Y\=D, Y\=M, Y\=O, Y\=R,
    1000*S + 100*E + 10*N + D +
    1000*M + 100*O + 10*R + E =:=
    10000*M + 1000*O + 100*N + 10*E + Y. 
