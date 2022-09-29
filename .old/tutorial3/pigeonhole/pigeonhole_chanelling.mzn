\int: num_holes;
int: num_pigeons;

set of int: HOLES = 1..num_holes;
set of int: PIGEONS = 1..num_pigeons;
set of int: PIGEONS_OR_EMPTY = {0} union PIGEONS; % 0..num_pigeons

% primal model
array[PIGEONS] of var HOLES: hole;
constraint forall(p1, p2 in PIGEONS where p1 < p2)(hole[p1] != hole[p2]);

% % dual model: version 1
% array[HOLES] of var set of PIGEONS: pigeons;
% constraint forall(h in HOLES)(card(pigeons[h]) <= 1); % injectivity
% constraint forall(p in PIGEONS)(exists(h in HOLES)(p in pigeons[h]));

% % chanelling constraint: version 1
% include "globals.mzn";
% constraint int_set_channel(hole, pigeons);

% dual model: version 2
array[HOLES] of var PIGEONS_OR_EMPTY: pigeon;
constraint forall(p in PIGEONS)(exists(h in HOLES)(p = pigeon[h]));

% chanelling constraint: version 2
include "globals.mzn";
constraint inverse_in_range(pigeon, hole);

solve satisfy;
