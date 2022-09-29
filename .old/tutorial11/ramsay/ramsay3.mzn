% Partition the integers 1 to n into three parts, such that for no part are there three different numbers with two adding to the third. For which n is it possible? [only for n<=23]

int: n;

set of int: N = 1..n;

array[1..3] of var set of N: parts;

include "partition_set.mzn";
constraint partition_set(parts, N);

constraint forall(i in 1..3)({x + y | x, y in parts[i] where x < y} intersect parts[i] = {});


ann: search_ann = set_search(parts, smallest, indomain_min);

solve :: search_ann satisfy;

% optimization level O1

% n=24 UNSAT in 11s
% n=25 UNSAT in 8s
% n=50 UNSAT in 1m7s
