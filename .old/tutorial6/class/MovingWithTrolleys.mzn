% parameters
int: availablehandlers;
int: availabletrolleys;
 
enum OBJECTS;
array[OBJECTS] of int: duration;
array[OBJECTS] of int: handlers;
array[OBJECTS] of int: trolleys;

int: max_start_time = sum(duration);
int: max_end_time = max_start_time + max(duration);
set of int: TIME_WINDOW = 0..max_end_time;

% decision variables
array[OBJECTS] of var 0..max_start_time: start_time;
array[OBJECTS] of var min(duration)..max_end_time: end_time;

array[TIME_WINDOW] of var 0..availablehandlers: handlers_working;
array[TIME_WINDOW] of var 0..availabletrolleys: trolleys_working;

% constraints
constraint end_time = [start_time[object] + duration[object] | object in OBJECTS];

constraint forall (t in TIME_WINDOW) (handlers_working[t] = sum (object in OBJECTS where start_time[object] <= t /\ t <= end_time[object] - 1) (handlers[object]));
constraint forall (t in TIME_WINDOW) (trolleys_working[t] = sum (object in OBJECTS where start_time[object] <= t /\ t <= end_time[object] - 1) (trolleys[object]));

solve minimize max(end_time);

output ["Schedule duration: \(max(end_time)) \n"] ++ 
       ["Object: \(OBJECTS[object]) - start time: \(start_time[object]), end time: \(end_time[object]) \n" | object in OBJECTS];