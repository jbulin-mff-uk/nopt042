% graph 3-coloring
int: n;
int: m;
set of int: V = 1..n;
set of int: E = 1..m;
array[E,1..2] of V: edges;

array[V] of var 1..3: f;

constraint forall(e in E)(f[edges[e,1]] != f[edges[e,2]]);

solve satisfy;