int: num_variables;
int: num_clauses;

set of int: VARIABLE = 1..num_variables;
set of int: NEG_LITERAL = {-x | x in VARIABLE};
set of int: LITERAL = VARIABLE union NEG_LITERAL;
set of int: LITERAL_OR_ZERO = LITERAL union {0};
set of int: CLAUSE = 1..num_clauses;

array[CLAUSE] of set of LITERAL: clauses;

% decision variable
var set of LITERAL: solution;

% each variable has exactly one value
var set of VARIABLE: positive = solution intersect VARIABLE;
var set of VARIABLE: negative = {-x | x in solution intersect NEG_LITERAL};
constraint positive union negative = VARIABLE;
constraint positive intersect negative = {};

% all clauses are satisfied
constraint forall(c in CLAUSE)(clauses[c] intersect solution != {});

solve satisfy;
output [show(solution)];

