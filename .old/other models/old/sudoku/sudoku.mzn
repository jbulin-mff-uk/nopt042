int: K; % size of the subsquare
int: N = K * K;

array[1..N,1..N] of var 1..N: puzzle;

include "alldifferent.mzn";

% All cells in a row, in a column, and in a subsquare are different.
constraint
    forall(i in 1..N)( alldifferent(j in 1..N)( puzzle[i,j] ))
    /\
    forall(j in 1..N)( alldifferent(i in 1..N)( puzzle[i,j] ))
    /\
    forall(i,j in 1..K)
        ( alldifferent(x,y in 1..K)( puzzle[K*(i-1)+x, K*(j-1)+y] ));

solve satisfy;


output [ "sudoku:\n" ] ++
    [ show(puzzle[i,j]) ++
        if j = N then
            if i mod K = 0 /\ i < N then "\n\n" else "\n" endif
        else
            if j mod K = 0 then "  " else " " endif
        endif
    | i,j in 1..N ];