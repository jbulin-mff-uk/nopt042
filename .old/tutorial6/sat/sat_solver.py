# A (very proof-of-concept-ish) SAT solver which can read DIMACS CNF format
# using MiniZinc and the Gecode solver

import minizinc, sys, time
from itertools import groupby

MODEL = """
int: num_variables;
int: num_clauses;
set of int: VARIABLE = 1..num_variables;
set of int: NEG_LITERAL = {-x | x in VARIABLE};
set of int: LITERAL = VARIABLE union NEG_LITERAL;
set of int: LITERAL_OR_ZERO = LITERAL union {0};
set of int: CLAUSE = 1..num_clauses;
array[CLAUSE] of set of LITERAL: clauses;
array[VARIABLE] of var bool: value;
array[LITERAL_OR_ZERO] of var bool: value_of_literal;
constraint not value_of_literal[0];
constraint forall(x in VARIABLE)(value_of_literal[x] = value[x] /\ value_of_literal[-x] = not value[x]);
constraint forall(c in CLAUSE)(exists(x in clauses[c])(value_of_literal[x]));
solve satisfy;
"""


def read_cnf(infile):
    # reads input in DIMACS CNF format, outputs variables for the model
    
    with open(infile, 'r') as file:
        lines = file.readlines()
    
    # remove comments, read parameters
    lines = [line for line in lines if line[0]!='c']
    num_variables, num_clauses = list(map(int, lines[0].split()[-2:]))
    lines = lines[1:]

    # read clauses to an array of int including 0
    clauses = list(map(int, ' '.join(lines).split()))

    # separate to individual clauses
    clauses = [set(group) for key, group in groupby(clauses, lambda x: x==0)]
    clauses = list(filter(lambda x: x != {0}, clauses))

    return num_variables, num_clauses, clauses


def main(infile):

    # Create a MiniZinc model
    model = minizinc.Model()
    model.add_string(MODEL)
    

    # Transform the model into an instance
    gecode = minizinc.Solver.lookup("gecode")
    inst = minizinc.Instance(gecode, model)
    
    # Read the input
    num_variables, num_clauses, clauses = read_cnf(infile)
    inst["num_variables"] = num_variables
    inst["num_clauses"] = num_clauses
    inst["clauses"] = clauses

    # Solve the instance
    tic = time.perf_counter()
    result = inst.solve(all_solutions=False)
    toc = time.perf_counter()
    
    print(f"Number of variables: {num_variables}")
    print(f"Number of clauses: {num_clauses}")      
    print(f"Running time: {round(toc-tic,2)}s")

    # Output
    if result:
        print(f"A solution found: {result['value']}")
        print("The instance is SATISFIABLE")
    else:
        print("The instance is UNSATISFIABLE")

    print(f"Number of variables: {num_variables}")
    print(f"Number of clauses: {num_clauses}")      
    print(f"Running time: {round(toc-tic,2)}s")


if __name__ == "__main__":
   main(sys.argv[1])
