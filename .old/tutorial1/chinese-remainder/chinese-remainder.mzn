int: max = 42000;

var 0..max: n;

constraint n mod 5 = 3; % = vs. ==
constraint n mod 7 = 2;
constraint n mod 9 = 4;
constraint n mod 11 = 10;
%constraint n mod 13 = 1;
%constraint n mod 17 = 3;
%constraint n mod 19 = 15;

solve satisfy;

