include "alldifferent.mzn";
include "increasing.mzn";

int: n; % number of marks ('order')
int: max_length; % upper bound on the length

array[1..n] of var 0..max_length: mark;
var int: length = max(mark);

array[1..n,1..n] of var 0..max_length: dist;

constraint forall(i, j in 1..n where i < j)(dist[i, j] = abs(mark[i] - mark[j]));

constraint alldifferent(mark);

constraint alldifferent(i, j in 1..n where i < j)(dist[i, j]);

%solve minimize length;

output ["length: \(length), marks: " ++ show(mark)];

% symmetry breaking
constraint increasing(mark); % n=7, max_length=100: 200ms, n=9 4s
constraint mark[1]=0; % n=9 1.7s
constraint forall(i, j in 1..n where i >= j)(dist[i, j] = 0);

% implicit constraints
% based on dist[i,j] = dist[i,i+1] + dist[i+1,i+2] + ... + dist[j-1,j], estimate distances by 1, sum from i to j
constraint forall(i, j in 1..n where i < j)(
  dist[i,j] >= (j-i)*(j-i+1)/2 /\
  dist[i,j] <= length - (n-j+i-1)*(n-j+i)/2
);
% n=9 0.5s, n=10 1.7s, n=11  1m47s

solve :: int_search(dist, input_order, indomain_min) minimize length;
% n=9 0.350ms, n=11 43s
