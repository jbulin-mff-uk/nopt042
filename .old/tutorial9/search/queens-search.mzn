% The n queens problem: various search strategies

int: n;

array [1..n] of var 1..n: queens;

include "alldifferent.mzn"; % global constraint

constraint alldifferent(queens);
constraint alldifferent(i in 1..n)(queens[i] + i);
constraint alldifferent(i in 1..n)(queens[i] - i);

output ["A solution exists."];



% % search annotations
%solve satisfy; %56s for n=91
%solve :: int_search(queens, first_fail, indomain_min) satisfy; % around 50s
% solve :: int_search(queens, smallest, indomain_min) satisfy; % more than 4 minutes
%solve :: int_search(queens, first_fail, indomain_random) satisfy; % <200ms
solve :: int_search(queens, input_order, indomain_random) satisfy; % <200ms


% % restart0
%solve :: int_search(queens, first_fail, indomain_random) satisfy; %18s for n=1024
%solve :: int_search(queens, first_fail, indomain_random) :: restart_linear(1000) satisfy; %5s for n=512

% % warm start
