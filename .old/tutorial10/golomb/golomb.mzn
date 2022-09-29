include "alldifferent.mzn";

int: n; % number of marks ('order')
int: max_length; % upper bound on the length

array[1..n] of var 0..max_length: mark;
var int: length = max(mark);

array[1..n,1..n] of var 0..max_length: dist;

constraint forall(i, j in 1..n where i < j)(dist[i, j] = abs(mark[i] - mark[j]));

constraint alldifferent(mark);

constraint alldifferent(i, j in 1..n where i < j)(dist[i, j]);


solve minimize length;

output ["length: \(length), marks: " ++ show(mark)];

% n=7, max_length=100: 1m25s
