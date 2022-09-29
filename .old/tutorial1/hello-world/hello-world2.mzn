output ["Hello, world!", "The value of n is \(n).", "The value of n is " ++ show(n) ++ "."] ++ [" The end."];

var int: n;

constraint n <= 5;

solve maximize n;





