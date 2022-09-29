int: n;

array[0..n+1,0..n+1] of var bool: board;

constraint forall(i in 0..n+1)((not board[0, i]) /\ (not board[n+1,i]) /\ (not board[i,0]) /\ (not board[i,n+1]));

function int alive_neighbours(1..n

