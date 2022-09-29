% Partition the integers 1 to n into three parts, such that for no part are there three different numbers with two adding to the third. For which n is it possible? [only for n<=23]

int: n;
int: k=3;

set of int: N = 1..n;

array[1..k] of var set of N: parts;

include "partition_set.mzn";
constraint partition_set(parts, N);

constraint forall(i in 1..k)({x + y | x, y in parts[i] where x < y} intersect parts[i] = {});

solve satisfy;

% n=23