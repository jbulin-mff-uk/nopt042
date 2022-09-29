% The n queens problem.

int: n;

array [1..n] of var 1..n: queens;

include "alldifferent.mzn"; % global constraint
constraint alldifferent(queens);
constraint alldifferent(i in 1..n)(queens[i] + i);
constraint alldifferent(i in 1..n)(queens[i] - i);

% how to add symmetry breaking?
var int: upper_left = sum([queens[i] <= floor(n/2) | i in 1..floor(n/2)]);
var int: upper_right = sum([queens[i] >= ceil(n/2) | i in 1..floor(n/2)]);
var int: lower_left = sum([queens[i] <= floor(n/2) | i in ceil(n/2)..n]);
var int: lower_right = sum([queens[i] >= ceil(n/2) | i in ceil(n/2)..n]);

include "increasing.mzn";
constraint increasing([upper_left, upper_right, lower_left, lower_right]);

solve satisfy;

output [if fix(queens[i]) = j then "Q " else ". " endif ++ if j = n then "\n" else "" endif |i, j in 1..n];

