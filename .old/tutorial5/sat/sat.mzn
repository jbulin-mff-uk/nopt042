int: num_variables;
int: num_clauses;

set of int: VARIABLE = 1..num_variables;
set of int: NEG_LITERAL = {-x | x in VARIABLE};
set of int: LITERAL = VARIABLE union NEG_LITERAL;
set of int: LITERAL_OR_ZERO = LITERAL union {0};
set of int: CLAUSE = 1..num_clauses;

array[CLAUSE] of set of LITERAL: clauses;

% decision variables

array[VARIABLE] of var bool: value;
% index set has to be a range of integers, 0 is dummy
array[LITERAL_OR_ZERO] of var bool: value_of_literal;

% to avoid duplicity of solutions
constraint not value_of_literal[0];

% values of literals agree with values of variables;
constraint 
    forall(x in VARIABLE)(
        value_of_literal[x] = value[x] /\
        value_of_literal[-x] = not value[x]
);

% all clauses are satisfied
constraint 
    forall(c in CLAUSE)(
        exists(x in clauses[c])(
            value_of_literal[x]
        )
    );

output ["x\(i) = \(value[i])\n" | i in VARIABLE];

solve satisfy;