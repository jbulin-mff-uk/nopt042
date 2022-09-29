%%%
% Pigeonhole Principle :
% --------------------
% You cannot kill n+1 pigeons with n bullets.
%
%%%

int: n = 12; % number of pigeons
set of int: PIGEONS = 1..n;
set of int: PIGEONS0 = 0..n; % 0 represents no pigeon
int: m = 11; % number of holes
set of int: HOLES = 1..m;

array[HOLES] of var PIGEONS: pigeon;
array[PIGEONS] of var HOLES: hole;

include "globals.mzn";

% every pigeon in a hole
constraint inverse(pigeon,hole);

solve satisfy;

output ["hole \(x) has "
++ if fix(pigeon[x])=0 then "no pigeon" else "pigeon \(pigeon[x])" endif
++ "\n" | x in HOLES];



