% boardomino MiniZinc model; see www.minizinc.org
int: n = 100;
set of int: ROW = 1..n;
set of int: ROW_PADDED = 0..n+1;
set of int: COL = 1..n;
set of int: COL_PADDED = 0..n+1;
ROW: last_row = n;
COL: last_col = n;

% upper left corners of horizontal and vertical tiles
array[ROW_PADDED, COL_PADDED] of var bool: v;
array[ROW_PADDED, COL_PADDED] of var bool: h;

% which fields are covered
array[1..n+1, 1..n+1] of var 0..4: covered; 

% corners removed
constraint not v[1,1];
constraint not h[1,1];
constraint not v[n-1,n];
constraint not h[n,n-1];

% no horizontal starting in last column
constraint forall(row in ROW)(not h[row,last_col]);

% no vertical starting in last row
constraint forall(col in COL)(not v[last_row,col]);

% every field covered exactly once
constraint forall(row in ROW, col in COL)(covered[row,col] = v[row,col-1]+v[row-1,col]+v[row,col]);

constraint forall(row in ROW, col in COL)(covered[row,col] = 1 \/ (row=1 /\ col=1) \/ (row=last_row /\ col=last_col));





solve satisfy;