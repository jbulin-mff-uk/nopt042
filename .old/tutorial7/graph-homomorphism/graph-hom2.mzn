% graph homomorphism (loopless unoriented graphs, require edges to be ordered)
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

% an edge cannot map to a loop
constraint forall(e in EG)(f[edgesG[e,START]] != f[edgesG[e,END]]);

constraint forall(e in EG where f[edgesG[e,START]] < f[edgesG[e,END]])(
  table([f[edgesG[e,START]], f[edgesG[e,END]]], edgesH)
);

constraint forall(e in EG where f[edgesG[e,START]] > f[edgesG[e,END]])(
  table([f[edgesG[e,END]], f[edgesG[e,START]]], edgesH)
);


solve satisfy;