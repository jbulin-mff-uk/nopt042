int: m;
int: n;

set of int: ROW = 1..m;
set of int: COL = 1..n;

array[ROW,COL] of bool: precolored_white;
array[ROW,COL] of bool: precolored_black;

% decision variables: keyword "var"
array[ROW,COL] of var bool: grid; 

% same number of black and white in each row and column
constraint forall(i in ROW)(
 sum(j in COL)(grid[i,j]) = sum(j in COL)(not grid[i,j])
);

constraint forall(j in COL)(
  sum(i in ROW)(grid[i,j]) = sum(i in ROW)(not grid[i,j])
);

% no three consecutive elements: global constraint
%
%   sliding_sum(int: low, int: up, int: seq, array[int] of var int: vs)
%
% requires that in each subsequence vs[i], ..., vs[i + seq - 1] 
% the sum of the values belongs to the interval [low, up]

include "sliding_sum.mzn";
constraint forall(i in ROW)(
  sliding_sum(1, 2, 3, [ grid[i,j] | j in COL])
);
constraint forall(j in COL)(
  sliding_sum(1, 2, 3, [ grid[i,j] | i in ROW])
);

% precolored cells
constraint forall(i in ROW, j in COL)(precolored_white[i,j] -> grid[i,j]);
constraint forall(i in ROW, j in COL)(precolored_black[i,j] -> not grid[i,j]);
  
 
solve satisfy;

% don't worry about formatting the output for now...
output [ 
if fix(grid[i,j]) then "⬜" else "⬛" endif ++
if j = max(COL) then "\n" else "" endif
| i in ROW, j in COL];

% optional: test consistency of the input data
constraint assert(m mod 2 = 0, "Invalid input: odd number of rows");
constraint assert(n mod 2 = 0, "Invalid input: odd number of columns");
constraint forall(i in ROW, j in COL)(
  assert(precolored_white[i,j] -> not precolored_black[i,j],
         "Invalid input: a cell is precolored both white and black")
);


