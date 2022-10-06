int: base = 10;
set of int: DIGIT = 0..base-1;
%set of int: NONZERO_DIGIT = 1..9;
set of int: NONZERO_DIGIT = { d | d in DIGIT where d != 0};

var NONZERO_DIGIT: S;
var DIGIT: E;
var DIGIT: N;
var DIGIT: D;
var NONZERO_DIGIT: M; % var 0..1: M;
var DIGIT: O;
var DIGIT: R;
var DIGIT: Y;

var bool: C1;
var bool: C2;
var bool: C3;
var bool: C4;
% bool coerced to int

constraint D + E = 10 * C1 + Y;
constraint N + R + C1 = 10 * C2 + E ;
constraint E + 0 + C2 = 10 * C3 + N;
constraint S + M + C3 = 10 * M + O;
constraint C4 = M;


include "alldifferent.mzn";
constraint alldifferent([S,E,N,D,M,O,R,Y]);

solve satisfy;

output ["   \(S)\(E)\(N)\(D)\n",
        "+  \(M)\(O)\(R)\(E)\n",
        "= \(M)\(O)\(N)\(E)\(Y)\n"];
