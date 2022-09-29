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


output ["length: \(length), marks: " ++ show(mark)];

% symmetry breaking
constraint increasing(mark); 
constraint mark[1]=0; 
constraint forall(i, j in 1..n where i >= j)(dist[i, j] = 0);

% implicit constraints
% based on dist[i,j] = dist[i,i+1] + dist[i+1,i+2] + ... + dist[j-1,j], estimate distances by 1, sum from i to j
constraint forall(i, j in 1..n where i < j)(
  dist[i,j] >= (j-i)*(j-i+1) div 2 /\
  dist[i,j] <= length - (n-j+i-1)*(n-j+i) div 2 
);





solve :: int_search(dist, input_order, indomain_min) minimize length;
% n=9 0.350s
% n=10 1.752s
% n=11 51s
% n=12 9m7s

% change #1: change /2 to  div 2
% n=11 (max_length = 100): 30s
% n=12 (max_length = 100): 4m18s

% change #2: optimization level O4
% n=11 25s
% n=12 4m5s

% change #2: optimization level O5
% n=11 25s
% n=12 3m23s
% n=13

