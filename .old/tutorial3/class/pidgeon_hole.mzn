int: num_pidgeons;
int: num_holes;

array[1..num_pidgeons] of var 1..num_holes: a;

constraint forall(i, j in 1..num_pidgeons where i < j)(a[i] != a[j]);

solve satisfy;