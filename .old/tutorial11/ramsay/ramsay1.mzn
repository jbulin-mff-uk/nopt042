% Partition the integers 1 to n into three parts, such that for no part are there three different numbers with two adding to the third. For which n is it possible? [only for n<=23]

int: n;

set of int: N = 1..n;

var set of N: A;
var set of N: B;
var set of N: C;

constraint A union B union C = N;
constraint A intersect B = {};
constraint B intersect C = {};
constraint A intersect C = {};

constraint {x + y | x, y in A where x < y} intersect A = {};
constraint {x + y | x, y in B where x < y} intersect B = {};
constraint {x + y | x, y in C where x < y} intersect C = {}; 

solve satisfy;


% n=23