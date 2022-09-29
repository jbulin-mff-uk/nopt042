% Planning a balanced meal
enum FOOD;

set of FOOD: desserts;
set of FOOD: mains;
set of FOOD: sides;

int: min_energy;
int: min_protein;
int: max_salt;
int: max_fat;

% food database
enum FEATURE = { name, energy, protein, salt, fat, cost}; 
array[FOOD,FEATURE] of int: dd; 

% decision variables

array[FEATURE] of var int: main;
array[FEATURE] of var int: side;
array[FEATURE] of var int: dessert; 

include "table.mzn";
constraint table(main, dd);
constraint table(side, dd);
constraint table(dessert, dd);

constraint main[name] in mains;
constraint side[name] in sides;
constraint dessert[name] in desserts;

constraint main[energy] + side[energy] + dessert[energy] >=min_energy;
constraint main[protein]+side[protein]+dessert[protein] >=min_protein;
constraint main[salt] + side[salt] + dessert[salt] <= max_salt;
constraint main[fat] + side[fat] + dessert[fat] <= max_fat;


var int: budget = main[cost] + side[cost] + dessert[cost];
solve minimize budget; 

output ["main = ",show(to_enum(FOOD,main[name])),", side = ",show(to_enum(FOOD,side[name])),
        ", dessert = ",show(to_enum(FOOD,dessert[name])),", cost = ",show(budget), "\n"];
        
        
% % Comments
% var desserts: chosen_dessert;
% var mains: chosen_main;
% var sides: chosen_side;
% constraint main[name] = chosen_main;
% dd[chosen_dessert,salt]
