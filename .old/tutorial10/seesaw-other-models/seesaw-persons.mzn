enum PERSON;
array[PERSON] of int: weight;
int: length;
int: distance; 

constraint assert(length mod 2 == 0, "The length must be even");
int: half = length div 2;

set of int: PERSON_OR_NONE = PERSON union {0};
array [PERSON_OR_NONE] of int: weight0 = array1d(PERSON_OR_NONE,[0] ++ weight);


array[-half..half] of var PERSON_OR_NONE: person;

% length: constraint implicit

% apart
constraint forall(i in -half..half)(person[i] != 0 ->
forall(j in 1..distance-1 where i+j <= half)(person[i+j] = 0)
);

% balanced
constraint sum(i in -half..half)(i * weight0[person[i]]) = 0;

% every person is on the seesaw exactly once
include "alldifferent_except_0.mzn";
constraint alldifferent_except_0(person);
constraint array2set(person) superset PERSON;


solve satisfy;
%seesaw-data10unsat.dzn: 3s


