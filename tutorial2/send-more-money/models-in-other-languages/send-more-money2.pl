# In SICStus Prolog from previous tutorial by R. Barták
solve_better([S,E,N,D,M,O,R,Y]):- 
    Digits1_9 = [1,2,3,4,5,6,7,8,9],
    Digits0_9 = [0|Digits1_9],
    
    % D+E = 10*P1+Y
    member(D, Digits0_9),
    member(E, Digits0_9), E\=D,
    Y is (D+E) mod 10, Y\=D, Y\=E,
    P1 is (D+E) // 10, % carry bit
    
    % N+R+P1 = 10*P2+E
    member(N, Digits0_9), N\=D, N\=E, N\=Y,
    R is (10+E-N-P1) mod 10, R\=D, R\=E, R\=Y, R\=N,
    P2 is (N+R+P1) // 10,
    
    % E+O+P2 = 10*P3+N
    O is (10+N-E-P2) mod 10, O\=D, O\=E, O\=Y, O\=N, O\=R,
    P3 is (E+O+P2) // 10,
    
    % S+M+P3 = 10*M+O
    member(M, Digits1_9), M\=D, M\=E, M\=Y, M\=N, M\=R, M\=O,
    S is 9*M+O-P3,
    S>0,S<10, S\=D, S\=E, S\=Y, S\=N, S\=R, S\=O, S\=M.