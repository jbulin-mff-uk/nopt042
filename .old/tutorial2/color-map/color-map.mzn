% Colouring states and territories of Australia (cf. The 4-color Theorem)
int: nc;

var 1..nc: wa;    
var 1..nc: nt;     
var 1..nc: sa;    
var 1..nc: q;     
var 1..nc: nsw;   
var 1..nc: v;
var 1..nc: t;

constraint wa = 1;
constraint nt = 2;
constraint sa = 3;

constraint wa != nt;
constraint wa != sa;
constraint nt != sa;
constraint nt != q;
constraint sa != q;
constraint sa != nsw;
constraint sa != v;
constraint q != nsw;
constraint nsw != v;

solve satisfy;

output ["wa is the color \(wa),\n",  
   " nt is the color \(nt),\n", 
   " sa is the color \(sa),\n",
 "q is the color \(q),\n", 
 " nsw is the color \(nsw),\n", 
 " v is the color \(v), and\n",
 "t is the color \(t)\n"];
 
 
% enum COLOR = {RED, GREEN, BLUE};

% var COLOR: wa;    
% var COLOR: nt;     
% var COLOR: sa;    
% var COLOR: q;     
% var COLOR: nsw;   
% var COLOR: v;
% var COLOR: t;
 
 