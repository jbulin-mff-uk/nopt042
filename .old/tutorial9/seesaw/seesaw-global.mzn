enum PERSON;
array[PERSON] of int: weight;
int: length;
int: distance; 

constraint assert(length mod 2 == 0, "The length must be even");
int: half = length div 2;

array[PERSON] of var -half..half: position;

% apart
include "cumulative.mzn";
constraint cumulative(position, [distance | p in PERSON], [1 | p in PERSON], 1);

%balanced
constraint sum(person in PERSON)(weight[person] * position[person]) = 0;

%% symmetry breaking
constraint position[min(PERSON)] >= 0;

solve satisfy;












%solve :: int_search(position, input_order, indomain_median) satisfy;

%try seesaw-data30.dzn with length 34 and 30



