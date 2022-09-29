int: num_queens;

set of int: ROWS = 1..num_queens;
set of int: COLUMNS = 1..num_queens;

array [ROWS, COLUMNS] of var bool: chessboard;

constraint forall(r1, r2 in ROWS, c1 in COLUMNS where r1 < r2)(chessboard[r1, c1] = false \/ chessboard[r2, c1] = false);
constraint forall(r1 in ROWS, c1, c2 in COLUMNS where c1 < c2)(chessboard[r1, c1] = false \/ chessboard[r1, c2] = false);
constraint forall(r1, r2 in ROWS, c1, c2 in COLUMNS where r1 != r2 /\ abs(r1 - r2) == abs(c1 - c2))(chessboard[r1, c1] = false \/ chessboard[r2, c2] = false);  
constraint sum(chessboard) = num_queens;

solve satisfy;