int: n; % number of friends
enum ITEM;
array[ITEM] of int: duration;
array[ITEM] of int: people;

int: max_time = sum(duration); %implicit constraint

array[ITEM] of var 0..max_time: start_time;

array[ITEM] of var 0..max_time: end_time;
var 0..max_time: total_time;

constraint end_time = [start_time[i] + duration[i] | i in ITEM];
constraint total_time = max(end_time);
constraint total_time <= max_time; %implicit constraint

include "cumulative.mzn";
constraint cumulative(start_time, duration, people, n);

solve minimize total_time;
