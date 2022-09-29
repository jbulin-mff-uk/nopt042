% Extremely nonassiociative quasigroups

int: N = 7;

array[1..N,1..N] of var 1..N: table;
%var int: numassoc;

include "alldifferent.mzn";

% All rows and columns different
constraint
    forall(i in 1..N)( alldifferent(j in 1..N)( table[i,j] ))
    /\
    forall(j in 1..N)( alldifferent(i in 1..N)( table[i,j] ));

constraint sum(i, j, k in 1..N)(table[i,table[j,k]] = table[table[i,j],k]) = 17;

%constraint numassoc = 17;


solve satisfy;



