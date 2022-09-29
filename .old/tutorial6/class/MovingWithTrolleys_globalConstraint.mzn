include "cumulative.mzn";

% parameters
int: availablehandlers;
int: availabletrolleys;
 
enum OBJECTS;
array[OBJECTS] of int: duration;
array[OBJECTS] of int: handlers;
array[OBJECTS] of int: trolleys;

int: max_start_time = sum(duration);

% decision variables
array[OBJECTS] of var 0..max_start_time: start_time;

% constraints
constraint cumulative(start_time, duration, handlers, availablehandlers);
constraint cumulative(start_time, duration, trolleys, availabletrolleys);

solve minimize max(start_time);

output ["Schedule duration: \(max (object in OBJECTS) (start_time[object] + duration[object])) \n"] ++ 
       ["Object: \(OBJECTS[object]) - start time: \(start_time[object]), end time: \(start_time[object] + duration[object]) \n" | object in OBJECTS];