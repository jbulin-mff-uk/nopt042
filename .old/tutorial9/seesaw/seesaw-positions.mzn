enum PERSON;
array[PERSON] of int: weight;
int: length;
int: distance; 

constraint assert(length mod 2 == 0, "The length must be even");
int: half = length div 2;

array[PERSON] of var -half..half: position;

% apart
predicate apart(var int: x, var int: y, var int: distance) = abs(x-y) >= distance;
predicate all_apart(array[int] of var int: x, var int: distance) = forall(a, b in index_set(x) where a < b)(apart(x[a], x[b], distance));
constraint all_apart(position, distance);

%balanced
constraint sum(person in PERSON)(weight[person] * position[person]) = 0;

solve satisfy;
%seesaw-data10unsat.dzn: 2m2s


