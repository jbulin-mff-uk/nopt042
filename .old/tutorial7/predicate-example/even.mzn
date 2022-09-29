var 1..10: a;

%predicate even(var int: b);
include "even-implementation.mzn";  

constraint not even(a);

solve maximize a;