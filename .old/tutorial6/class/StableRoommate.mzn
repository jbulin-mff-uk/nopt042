include "alldifferent.mzn";

% parameters
enum PEOPLE;
int: n = length(PEOPLE);
array[PEOPLE, PEOPLE] of 1..n: preferences;

% assertion
constraint assert(forall (people in PEOPLE) (preferences[people, people] == n), "Invalid preferences."); % The values on the diagonal are equal to n
constraint assert(n mod 2 == 0, "Invalid number of people.");

% decision variables
array[PEOPLE] of var PEOPLE: decisions;

% constraints
constraint alldifferent(decisions);
constraint forall (people in PEOPLE) (decisions[decisions[people]] == people); % symmetry

constraint forall (p1 in PEOPLE, p2 in PEOPLE)
                  ((preferences[p1, p2] >= preferences[p1, decisions[p1]]) \/ (preferences[p2, decisions[p2]] < preferences[p2, p1]));

solve satisfy;

output ["Pair: \(PEOPLE[people]) and \(decisions[people]) \n" | people in PEOPLE];