int: M;
int: N;
set of int: ROW = 1..M;
set of int: COL = 1..N;

array[ROW,COL] of bool: PRECOL_WHITE;
array[ROW,COL] of bool: PRECOL_BLACK;

% decision variables (keyword "var")
array[ROW,COL] of var bool: grid; 

% same number of black and white in each row and column
constraint forall(i in ROW)(
 sum(j in COL)(grid[i,j]) = sum(j in COL)(not grid[i,j])
);

constraint forall(j in COL)(
  sum(i in ROW)(grid[i,j]) = sum(i in ROW)(not grid[i,j])
);

% no three consecutive elements (array comprehension - as in Python)
constraint forall(i in ROW, j in COL where i <= M-2)(
  grid[i,j] = grid[i+1,j] -> grid[i,j] != grid[i+2,j]
);

constraint forall(i in ROW, j in COL where j <= N-2)(
  grid[i,j] = grid[i,j+1] -> grid[i,j] != grid[i,j+2]
);

% precolored cells
constraint forall(i in ROW, j in COL)(PRECOL_WHITE[i,j] -> grid[i,j]);
constraint forall(i in ROW, j in COL)(PRECOL_BLACK[i,j] -> not grid[i,j]);
  
 
solve satisfy;

% don't worry about formatting the output for now...
output [ 
  if fix(grid[i,j]) then "⬜" else "⬛" endif 
  ++ if j = max(COL) then "\n" else "" endif
| i in ROW, j in COL];

% optional: test consistency of the input data
constraint assert(M mod 2 = 0, "Invalid input: odd number of rows");
constraint assert(N mod 2 = 0, "Invalid input: odd number of columns");
constraint forall(i in ROW, j in COL)(
  assert(PRECOL_WHITE[i,j] -> not PRECOL_BLACK[i,j],
         "Invalid input: a cell is precolored both white and black")
);
