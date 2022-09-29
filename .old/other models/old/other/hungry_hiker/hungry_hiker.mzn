int: LIMIT;
enum ITEMS;
array[ITEMS] of int: WEIGHT;
array[ITEMS] of int: KCAL; 

array[ITEMS] of var int: amount;
var int: total_kcal;

constraint forall(item in ITEMS)(amount[item] >= 0);

constraint sum(item in ITEMS)(amount[item]*WEIGHT[item]) <= LIMIT;

constraint total_kcal = sum(item in ITEMS)(amount[item]*KCAL[item]);

solve maximize total_kcal;

