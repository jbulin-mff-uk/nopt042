int: N; % size of the square
set of int: ROW = 1..N;
set of int: COL = 1..N;
set of int: VALUE = 1..N*N;

var int: magic_constant;
array[1..N,1..N] of var VALUE: square;


include "alldifferent.mzn";

% different entries
constraint alldifferent([square[i,j] | i in ROW, j in COL]);

% sum of each row
constraint forall(i in ROW)(
  sum(j in COL)(square[i,j]) = magic_constant
);

% sum of each column
constraint forall(j in COL)(
  sum(i in ROW)(square[i,j]) = magic_constant
);

% sum of the two diagonals
constraint sum(i in ROW)(square[i,i]) = magic_constant;
constraint sum(i in ROW)(square[i,N+1-i]) = magic_constant;

solve satisfy;
output 
  ["The magic constant is \(magic_constant).\n"] ++
  ["The magic square:\n"] ++
  [ show_int(floor(log10(int2float(N*N))+1), square[i,j]) ++
    if j = N then "\n" else " " endif | i, j in 1..N];



