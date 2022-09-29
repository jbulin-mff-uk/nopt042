%%%
% Graph coloring
%%%

int: n; % number of vertices
int: m; % number of edges
enum COLOR; % which colors we can use

set of int: VERTEX = 1..n;
set of int: EDGE = 1..m;
set of int: PAIR = 1..2;

array[EDGE,PAIR] of VERTEX: edge_list; % list of edges

array[VERTEX] of var COLOR: color;

constraint forall(e in EDGE)(
  color[edge_list[e,1]]!= color[edge_list[e,2]]
);

solve satisfy;

output ["\(v) -> \(color[v])\n"|v in VERTEX];

% UNSAT 1m36s