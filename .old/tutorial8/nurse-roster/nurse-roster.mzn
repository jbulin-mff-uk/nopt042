% Simple nurse rostering
enum NURSE;
enum DAY;
int: req_day;
int: req_night;
int: min_night;

enum SHIFT = { d, n, o };

array[NURSE,DAY] of var SHIFT: roster;

% TODO: constraints
constraint forall(nurse in NURSE, i in 1..card(DAY)-3)(
exists(j in i..i+3)(roster[nurse, to_enum(DAY,j)] == o)
);

constraint forall(nurse in NURSE, i in 1..card(DAY)-2)(
exists(j in i..i+2)(roster[nurse, to_enum(DAY,j)] != n)
);

constraint forall(day in DAY)(
    sum(nurse in NURSE)(roster[nurse, day] == d) >= req_day /\
    sum(nurse in NURSE)(roster[nurse, day] == n) >= req_night
);

constraint forall(nurse in NURSE)(
    sum(day in DAY)(roster[nurse, day] == n) >= min_night
);


solve satisfy;

output [ show(roster[i,j]) ++ if j==card(DAY) then "\n" else " " endif
       | i in NURSE, j in DAY ]; 
