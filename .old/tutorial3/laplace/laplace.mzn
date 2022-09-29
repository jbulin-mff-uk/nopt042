% doesn't work with Gecode, try COIN-BC (better support for floating point)
% run with temperatures.dzn

% parameters

int: w = 8;
int: h = 5;

% give names to these ranges (type safety)
set of int: ROW = 0..h;
set of int: CROW = 1..h-1;
set of int: COL = 0..w;
set of int: CCOL = 1..w-1;  

% declare decision variables

array[ROW,COL] of var float: t; % temperature at point (i,j)

var float: left;   % left   edge temperature
var float: right;  % right  edge temperature
var float: top;    % top    edge temperature
var float: bottom; % bottom edge temperature


% Laplace equation: temperature at each internal point is the average of its neighbours

constraint forall(i in CROW, j in CCOL)(
              4.0*t[i,j] = t[i-1,j] + t[i,j-1] + t[i+1,j] + t[i,j+1]);

% edge constraints

constraint forall(i in CROW)(t[i,0] = left);
constraint forall(i in CROW)(t[i,w] = right);
constraint forall(j in CCOL)(t[0,j] = top);
constraint forall(j in CCOL)(t[h,j] = bottom);

% corner constraints
% constraint t[0,0]=0.0;
% constraint t[0,w]=0.0;
% constraint t[h,0]=0.0;
% constraint t[h,w]=0.0; 



solve satisfy;

output [ show_float(6, 2, t[i,j]) ++ 
         if j == w then "\n" else " " endif |
         i in ROW, j in COL
];
