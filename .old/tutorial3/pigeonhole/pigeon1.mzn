int: num_pigeons;
int: num_holes;

array[1..num_pigeons] of var 1..num_holes: f;
% f: pigeons -> holes

constraint forall(p1, p2 in 1..num_pigeons where p1 > p2)(f[p1] != f[p2]);

constraint f[1] = 1 /\ f[2] = 2 /\ f[3] = 3;


solve satisfy;



