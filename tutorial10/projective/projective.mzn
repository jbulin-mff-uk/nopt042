int: N; % the order of the plane
int: M = N * N + N + 1; % M = #points = #lines
int: K = N + 1; % each line has K points, each point lies on K lines

set of int: POINT = 1..M;
set of int: LINE = 1..M;

array[POINT,LINE] of var bool: inc; % incidence matrix

include "globals.mzn";

% each point lies on K lines, each line has K points, 
constraint forall(p in POINT)(exactly(K, [inc[p,l] |l in LINE], true));
constraint forall(l in LINE)(exactly(K, [inc[p,l] |p in POINT], true));

% any 2 points lie on exactly 1 line
constraint forall(p1, p2 in POINT where p1 < p2)(
  exactly(1, [ inc[p1,l] /\ inc[p2,l] |l in LINE], true)
);
% any 2 lines intersect at exactly 1 point
constraint forall(l1, l2 in LINE where l1 < l2)( 
  exactly(1, [ inc[p,l1] /\ inc[p,l2] |p in POINT], true)
);

% symmetry breaking: ith point lies on ith line (can we assume this??)
constraint forall(p in POINT)(inc[p,p]);

% there are 4 points which do not lie on 1 line 
% WLOG it's the first 4 points (symmetry breaking)
constraint  forall(l in LINE)(
  not (inc[1,l] /\ inc[2,l] /\ inc[3,l] /\ inc[4,l])
);

solve satisfy;

output [
if fix(inc[p,l]) then "1" else "0" endif ++
if l = max(LINE) then "\n" else "" endif
| p in POINT, l in LINE]


