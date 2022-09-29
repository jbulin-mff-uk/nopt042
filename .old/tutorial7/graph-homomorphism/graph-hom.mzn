% graph homomorphism
int: nG;
int: mG;
int: nH;
int: mH;

set of int: VG = 1..nG;
set of int: EG = 1..mG;
set of int: VH = 1..nH;
set of int: EH = 1..mH;

enum PAIR = {START, END};

array[EG,PAIR] of VG: edgesG;
array[EH,PAIR] of VH: edgesH;

array[VG] of var VH: f;

include "table.mzn";

constraint forall(e in EG)(
  table([f[edgesG[e,START]], f[edgesG[e,END]]], edgesH) \/
  table([f[edgesG[e,END]], f[edgesG[e,START]]], edgesH)
);


solve satisfy;

% % other options:
% % edges as two-element subsets
% array[EG] of set of VG: edgesG;
% constraint forall(e in EG)(card(edgesG[e])=2);
% % incidence matrix: M[u,v] = 1 iff {u,v} is an edge
% array[VG, VG] of bool: incidenceG;