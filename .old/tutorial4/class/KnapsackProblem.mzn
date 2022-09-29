% parameters
int: capacity;

enum items;
array[items] of int: weighs;
array[items] of int: costs;

% decision variables
array[items] of var bool: packed;
var int: total_cost;
var int: total_weigh;

total_cost = sum (i in items) (if packed[i] then costs[i] else 0 endif);
total_weigh = sum (i in items) (if packed[i] then weighs[i] else 0 endif);

% constraints
constraint total_weigh <= capacity;

% solve
solve maximize total_cost;

% output
output ["Total cost: \(total_cost)$\n"] ++
       ["Total weigh: \(total_weigh)kg\n"] ++
       ["Packed items: "] ++
       ["\(items[i]), "| i in items where fix(packed[i])];