% Swimmers: pure assignment, matching
enum SWIMMER;
enum STYLE;
array[STYLE, SWIMMER] of int: time;

constraint assert(length(SWIMMER) = length(STYLE), "The number of swimmers and styles must be the same.");

% a function style: SWIMMER -> STYLE
array[SWIMMER] of var STYLE: style;

% function SWIMMER -> STYLE is injective
include "alldifferent.mzn";
constraint alldifferent(style);

var int: obj = sum(s in SWIMMER)(time[style[s], s]);

solve minimize obj;

output [show(style) ++ "\ntotal time: \(obj)s"]; 
