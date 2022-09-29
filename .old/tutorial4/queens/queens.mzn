% The n queens problem.

int: n;

array [1..n] of var 1..n: queens;

include "alldifferent.mzn"; % global constraint

constraint alldifferent(queens);
constraint alldifferent([queens[i]+i | i in 1..n]);
constraint alldifferent(i in 1..n)(queens[i] - i); % alternative syntax

%solve satisfy;
%solve :: int_search(queens, first_fail, indomain_min) satisfy; % standard search annotation
solve :: int_search(queens, first_fail, indomain_median) satisfy; % try to place queens in the middle first

output [if fix(queens[i]) = j then "Q " else ". " endif ++ if j = n then "\n" else "" endif | i, j in 1..n];


% how to add symmetry breaking?

% results: 
%n=128 10m fail, with search ann.: 0.3s
%n=88 35s