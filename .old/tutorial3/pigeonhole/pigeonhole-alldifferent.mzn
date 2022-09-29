int: num_holes;
int: num_pigeons;

set of int: HOLES = 1..num_holes;
set of int: PIGEONS = 1..num_pigeons;

array[PIGEONS] of var HOLES: hole;

include "alldifferent.mzn";
constraint alldifferent(hole);



solve satisfy;