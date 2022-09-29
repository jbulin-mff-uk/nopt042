int: n=10;
array[1..n] of var 1..n: a;

constraint forall(i, j in 1..n where i != j)(a[i] != a[j]);

solve satisfy;