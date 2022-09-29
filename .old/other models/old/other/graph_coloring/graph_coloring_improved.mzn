%%%
% Graph coloring
%%%

int: n; % number of vertices
int: m; % number of edges
% finishes in 8m2s
set of int: VERTEX = 1..n;
set of int: EDGE = 1..m;
set of int: PAIR = 1..2;

array[EDGE,PAIR] of VERTEX: edge_list; % list of edges

array[1..6,1..2] of 1..3: allowed; %allowed tuples


array[VERTEX] of var 1..3: color;



include "table.mzn";
constraint forall(e in EDGE)(
  table([color[edge_list[e,1]],color[edge_list[e,2]]],allowed)
);

solve satisfy;

output ["\(v) -> \(color[v])\n"|v in VERTEX];

