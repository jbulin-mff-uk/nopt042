% more swimmers than styles, choose exactly one swimmer per style
constraint assert(length(SWIMMER) >= length(STYLE), "Inconsistent input, there are less swimmers than styles.");

enum SWIMMER;
enum STYLE;
array[SWIMMER, STYLE] of int: time;

set of int: STYLE0 = STYLE union {0};
array[SWIMMER, STYLE0] of var int: time0;

constraint forall(s in SWIMMER)(
    time0[s, 0] = 0 /\
    forall(t in STYLE)(time0[s, t] = time[s, t])
);

array[SWIMMER] of var STYLE0: style;


include "alldifferent_except_0.mzn";
constraint alldifferent_except_0(style);

constraint STYLE subset array2set(style);


var int: obj = sum(s in SWIMMER)(time0[s, style[s]]);


solve minimize obj;

output [show(style) ++ "\ntotal time: \(obj)s"]; 
