enum ITEM;
int: capacity;

array[ITEM] of int: profits;
array[ITEM] of int: weights;

var set of ITEM: knapsack;

var int: total_weight = sum(i in knapsack)(weights[i]);
constraint total_weight <= capacity;

var int: total_profit;
constraint total_profit = sum (i in knapsack) (profits[i]); 

solve maximize total_profit;

output ["knapsack = \(knapsack), weight = \(total_weight), profit= \(total_profit)\n"];
