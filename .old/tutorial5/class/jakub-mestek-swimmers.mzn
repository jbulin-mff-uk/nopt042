include "alldifferent.mzn";

enum STYLE;
enum SWIMMER;
array[SWIMMER,STYLE] of int: time;

% assuming this generalization of problem: each style has to be swimmed, but not all swimmers have to swim (i.e. there can be more swimmers than styles)
constraint assert(card(STYLE) <= card(SWIMMER), "Invalid datafile: " ++
                  "There should not be more styles than swimmers.");

array[STYLE] of var SWIMMER: selection;

constraint alldifferent(selection);

var int: total_time = sum(style in STYLE)(time[selection[style],style]);

solve minimize total_time;

output ["Relay ", show(selection), " should achieve total time ", show(total_time)];