int: max = 42000;

var 0..max: x;

array[1..5] of int: primes = [5, 7, 9, 11, 13];
array[1..5] of int: moduli = [3, 2, 4, 10, 1];

constraint forall(i in 1..5)(x mod primes[i] == moduli[i]);

solve satisfy;