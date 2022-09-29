% try it with and without symmetry breaking
int: num_holes;
int: num_pigeons;

set of int: HOLES = 1..num_holes;
set of int: PIGEONS = 1..num_pigeons;

array[PIGEONS] of var HOLES: hole;

%constraint forall(p1, p2 in PIGEONS where p1 != p2)(hole[p1] != hole[p2]);
constraint forall(p1, p2 in PIGEONS where p1 < p2)(hole[p1] != hole[p2]);


% symmetry breaking
%constraint hole[1] = 1;

solve satisfy;