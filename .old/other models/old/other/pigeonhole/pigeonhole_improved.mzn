%%%
% Pigeonhole Principle :
% --------------------
% You cannot kill n+1 pigeons with n bullets.
%
%%%

int: n = 10; % number of pigeons
set of int: PIGEONS = 1..n;
set of int: PIGEONS0 = 0..n; % 0 represents no pigeon
int: m = 9; % number of holes
set of int: HOLES = 1..m;

array[HOLES] of var PIGEONS0: pigeon;

include "globals.mzn";

% every pigeon in a hole
constraint forall(p in PIGEONS)(exists(h in HOLES)(p = pigeon[h]));

% one pigeon cannot be in two holes
constraint alldifferent(pigeon);

solve satisfy;

output ["hole \(x) has "
++ if fix(pigeon[x])=0 then "no pigeon" else "pigeon \(pigeon[x])" endif
++ "\n" | x in HOLES];



