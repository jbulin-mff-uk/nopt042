include "alldifferent.mzn";

% parameters
int: n;

set of int: ROW = 1..n;
set of int: COLUMN = ROW;

% decision variables
array[COLUMN] of var ROW: queens;

% constrains - row conflicts
constraint alldifferent(queens);

% constraint - diagonal conflicts
constraint forall (i, j in COLUMN where i < j) (abs(i - j) != abs(queens[i] - queens[j]));

% solve
solve satisfy;

% output
output [if fix(queens[j] == i) then 
          if j == n then " Q \n" else " Q " endif 
        else 
          if j == n then " - \n" else " - " endif
        endif | i in ROW, j in COLUMN] ++
        ["\n Queens: \(queens)"];