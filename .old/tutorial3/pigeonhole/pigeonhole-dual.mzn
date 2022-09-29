int: num_holes;
int: num_pigeons;

set of int: HOLES = 1..num_holes;
set of int: PIGEONS = 1..num_pigeons;
set of int: PIGEONS_OR_EMPTY = {0} union PIGEONS;  %= 0..num_pigeons; 

% dual view of the problem
array[HOLES] of var PIGEONS_OR_EMPTY: pigeon; 

%constraint forall(h1, h2 in HOLES where h1 != h2)(pigeon[h1] != pigeon[h2] \/ pigeon[h1] = 0);
%constraint forall(h1, h2 in HOLES where h1 < h2)(pigeon[h1] != pigeon[h2] \/ pigeon[h1] = 0);

include "alldifferent_except_0.mzn";
constraint alldifferent_except_0(pigeon);

constraint PIGEONS subset array2set(pigeon);

% symmetry breaking
constraint pigeon[1] = 1;

solve satisfy;