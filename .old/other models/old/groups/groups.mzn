set of int: G = 0..12;
%G: ID = min(G);

array[G,G] of var G: mult; % Cayley table of G

% identity
%constraint forall(g in G)(mult[ID,g] = g /\ mult[g,ID] = g);

% latin square
include "alldifferent.mzn";
constraint forall(g in G)(alldifferent([mult[g,h]|h in G])); 
% rows are permutations; array comprehension
constraint forall(g in G)(alldifferent([mult[h,g]|h in G])); % columns are permutations;

%associativity
constraint forall(x,y,z in G)(mult[mult[x,y],z]=mult[x,mult[y,z]]);


solve satisfy;

output ["\(mult[g,h]) "++if h=max(G)then"\n"else""endif
|g,h in G
]