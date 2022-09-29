% a parameter
int: max;

% declare decision variables
var 1..max: a;
var 1..max: b;
var 1..max: c;

/* alternatively:
var int: a;
constraint a > 0;
constraint a <= max;
*/

% constraints:

% 1. pythagorean triple
constraint a*a + b*b = c*c;

% 2. symmetry breaking
constraint a < b;

% solve statement
%solve satisfy;
solve maximize a;

% optional output statement
output ["\(a)**2 + \(b)**2 = \(c)**2\n"]





