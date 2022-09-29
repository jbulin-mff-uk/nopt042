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


%solve satisfy;


% dual model for distances
array[1..card(PERSON)-1] of var int: distances;
constraint forall(i in 1..card(PERSON)-1)(distances[i] >= distance);
constraint forall(i in 1..card(PERSON)-1)(distances[i] = abs(position[to_enum(PERSON, i+1)]-position[to_enum(PERSON, i)]));







%% improvements

%% symmetry breaking
constraint position[min(PERSON)] >= 0;

%% More symmetry breaking? [on seesaw-data10unsat: 3s vs. 50s]
% include "increasing.mzn";

% array[min(weight)..max(weight)] of set of PERSON: persons_by_weight = array1d(min(weight)..max(weight),[{p | p in PERSON where weight[p] = w} | w in min(weight)..max(weight)]);
% constraint forall(w in min(weight)..max(weight))(increasing([position[p] | p in persons_by_weight[w]]));

%% Better seach strategy? 
solve :: int_search(position, input_order, indomain_median) satisfy;



