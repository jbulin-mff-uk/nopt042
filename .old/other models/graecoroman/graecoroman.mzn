% Graeco-Roman Latin square: a pair of Latin squares of the same order such that when superimposed, the ordered pair entries are all different

int: n;

array[1..n,1..n] of var 0..n*n-1: x;

include "alldifferent.mzn";

constraint forall(i in 1..n)(alldifferent([x[i,j] mod n | j in 1..n]));
constraint forall(j in 1..n)(alldifferent([x[i,j] mod n | i in 1..n]));
constraint forall(i in 1..n)(alldifferent([x[i,j] div n | j in 1..n]));
constraint forall(j in 1..n)(alldifferent([x[i,j] div n | i in 1..n]));
constraint alldifferent(x);

constraint x[1,1] = 0;
constraint x[1,2] = n+1;

solve :: int_search(x, first_fail, indomain_split) satisfy;

output	[" \(x[i,j] mod n),\(x[i,j] div n) " ++ if j = n then "\n" else "" endif |	i, j in 1..n 	];
