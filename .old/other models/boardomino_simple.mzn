% boardomino MiniZinc model; see www.minizinc.org
int: N = 4;
set of int: ROWS = 1..N;
set of int: COLS = 1..N;
int: FIRST = 1;
int: LAST = N;
% upper left corners of horizontal and vertical tiles
array[ROWS,COLS] of var bool: h;
array[ROWS,COLS] of var bool: v;

% corners removed
constraint not h[FIRST,FIRST];  
constraint not v[FIRST,FIRST]; 
constraint not h[LAST,LAST-1];
constraint not v[LAST-1,LAST];

% % to have the full board, comment out the corner constraints and uncomment the constraint below
% constraint forall(row in ROWS, col in COLS)(not (h[row,col] /\ v[row,col]));

% no horizontal starting in last column
constraint forall(row in ROWS)(not h[row,LAST]);

% no vertical starting in last row
constraint forall(col in COLS)(not v[LAST,col]);

% every field covered exactly once

% corners
constraint h[FIRST,LAST-1] + v[FIRST,LAST] = 1; 
constraint h[LAST,FIRST] + v[LAST-1,FIRST] = 1;

% first row
constraint forall(col in COLS where col!=FIRST)(h[FIRST,col] + h[FIRST,col-1] + v[FIRST,col] = 1);

% first column
constraint forall(row in ROWS where row!=FIRST)(h[row,FIRST] + v[row-1,FIRST] + v[row,FIRST] = 1);

% the rest of the board
constraint forall(row in ROWS where row != FIRST, col in COLS where col != FIRST)(
  (row != LAST \/ col != LAST) -> (h[row,col] + h[row,col-1] + v[row,col] + v[row-1,col] = 1) 
);

solve satisfy;

output 
["*"] ++
["*" | col in COLS] ++ 
["*\n*"] ++
[if fix(h[row,col]) then 
   "H" 
 else 
   if fix(v[row,col]) then 
     "V" 
   else 
     if (row=FIRST /\ col=FIRST) \/ (row=LAST /\ col=LAST) then 
       "*" 
     else 
       " " 
     endif 
   endif 
 endif ++ 
 if col=LAST then 
   "*\n*" 
 else 
   "" 
 endif | row in ROWS, col in COLS] ++
["*" | col in COLS] ++ 
["*\n"];