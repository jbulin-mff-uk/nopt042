var 1..9: S;
var 0..9: E;
var 0..9: N;
var 0..9: D;
var 1..9: M;
var 0..9: O;
var 0..9: R;
var 0..9: Y;

constraint           1000 * S + 100 * E + 10 * N + D
                   + 1000 * M + 100 * O + 10 * R + E
       = 10000 * M + 1000 * O + 100 * N + 10 * E + Y;

constraint S != E /\ S != N /\ S != D /\ S != M /\ S != O /\ S != R /\ S != Y;
constraint           E != N /\ E != D /\ E != M /\ E != O /\ E != R /\ E != Y; 
constraint                     N != D /\ N != M /\ N != O /\ N != R /\ N != Y;
constraint                               D != M /\ D != O /\ D != R /\ D != Y;
constraint                                         M != O /\ M != R /\ M != Y;
constraint                                                   O != R /\ O != Y;
constraint                                                             R != Y;


solve satisfy;

output ["   \(S)\(E)\(N)\(D)\n",
        "+  \(M)\(O)\(R)\(E)\n",
        "= \(M)\(O)\(N)\(E)\(Y)\n"];
