include "inverse.mzn";

% parameters
enum MEN;
enum WOMEN;

array[MEN, WOMEN] of 1..length(WOMEN): preferences_men;
array[WOMEN, MEN] of 1..length(MEN): preferences_women;

% assertion
constraint assert(length(MEN) == length(WOMEN), "The number of men and women is different.");

% decision variables
array[MEN] of var WOMEN: decisions_men;
array[WOMEN] of var MEN: decisions_women;

% constraints
constraint inverse(decisions_men, decisions_women);

constraint forall (man in MEN, woman in WOMEN) 
                  ((preferences_men[man, woman] >= preferences_men[man, decisions_men[man]]) \/ (preferences_women[woman, decisions_women[woman]] < preferences_women[woman, man]));
                                 
constraint forall (woman in WOMEN, man in MEN) 
                  ((preferences_women[woman, man] >= preferences_women[woman, decisions_women[woman]]) \/ (preferences_men[man, decisions_men[man]] < preferences_men[man, woman]));

solve satisfy;

output ["Man: \(MEN[man]), woman: \(decisions_men[man]) \n" | man in MEN];