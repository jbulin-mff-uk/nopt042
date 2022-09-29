enum PERSON;
array[PERSON] of int: weight;
int: length;
int: distance; 

constraint assert(length mod 2 == 0, "The length must be even");
int: half = length div 2;

int: n = card(PERSON);


include "alldifferent.mzn";
array[1..n] of var PERSON: order;
constraint alldifferent(order);

%distances between persons
int: max_dist = length-distance*(n-2);
array[1..n-1] of var 1..max_dist: dist;
var -half..0: pos_of_first;

% length
constraint pos_of_first + sum(dist) <= half; 

% apart
constraint min(dist) >= distance;



%balanced
constraint sum(i in 1..n)(weight[order[i]] * (pos_of_first + sum(j in 1..i-1)(dist[j]))) = 0;

solve satisfy;
%seesaw-data10unsat.dzn: 2s



