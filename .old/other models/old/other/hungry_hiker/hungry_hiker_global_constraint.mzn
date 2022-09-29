int: LIMIT;
enum ITEMS;
array[ITEMS] of int: WEIGHT;
array[ITEMS] of int: KCAL; 

array[ITEMS] of var int: amount;
var int: total_kcal;
var int: total_weight;

include "knapsack.mzn";
constraint knapsack(WEIGHT, KCAL, amount, total_weight, total_kcal);
constraint total_weight <= LIMIT;

solve maximize total_kcal;

