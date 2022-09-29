int: M; % number of applicants
int: N; % number of courses

enum DAY = {Mon, Tue, Wed, Thu, Fri};

set of int: STUDENT = 1..M;
set of int: COURSE = 1..N;

array[STUDENT] of set of int: WISHLIST;

array[COURSE] of var DAY: schedule;

include "alldifferent.mzn";

constraint forall(student in STUDENT)(
  alldifferent([schedule[course]|course in WISHLIST[student]])
);

solve satisfy;

output ["Course no.\(course) on \(schedule[course])\n"| course in COURSE];

