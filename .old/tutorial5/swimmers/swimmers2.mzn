% Swimmers: any number of swimmers and styles, each swimmer must choose a different style
enum SWIMMER;
enum STYLE;
array[SWIMMER, STYLE] of int: time;

array[SWIMMER] of var STYLE: style;
array[STYLE] of var SWIMMER: swimmer;

include "inverse.mzn";
constraint inverse(swimmer, style);


include "alldifferent.mzn";
constraint alldifferent(style);
constraint alldifferent(swimmer);

var int: obj = sum(s in SWIMMER)(time[s, style[s]]);
var int: obj2 = sum(s in STYLE)(time[swimmer[s], s]);
constraint obj = obj2;

solve minimize obj;

output [show(style) ++ "\ntotal time: \(obj)s"]; 
