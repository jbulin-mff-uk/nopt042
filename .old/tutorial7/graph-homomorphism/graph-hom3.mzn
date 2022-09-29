% graph homomorphism (loopless unoriented graphs)
int: nG;
int: nH;


set of int: VG = 1..nG;
set of int: VH = 1..nH;

array[VG, VG] of bool: incidenceG; 
array[VH, VH] of bool: incidenceH; 


array[VG] of var VH: f;

constraint forall(u, v in VG where u < v /\ incidenceG[u,v])(incidenceH[f[u],f[v]]);

solve satisfy;

% is it better?
% yes for dense graphs
% n^2 bool variables vs 2m variables from 1..n (n = #vertices, m = #edges)
% faster lookup

% % predicate edgeG(var VG: u, var VG: v);
% % predicate edgeH(var VH: u, var VH: v);
% constraint forall(u, v in VG where edgeG(u,v))(edgeH(f[u],f[v]));