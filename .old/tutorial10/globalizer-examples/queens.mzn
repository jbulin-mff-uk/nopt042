int: n = 8;

array [1..n] of var 1..n: queens;

include "alldifferent.mzn"; % global constraint

constraint alldifferent(queens);
constraint alldifferent(i in 1..n)(queens[i] + i);
constraint alldifferent(i in 1..n)(queens[i] - i);

output ["A solution exists."];

% suggested by Globalizer (but doesn't actually help)
% include "global_cardinality.mzn";
% constraint global_cardinality(queens,[i|i in 1..n],[1|i in 1..n]);





