enum colors;
bool: repeat;

array[int,int] of colors: board;

set of int: rounds = index_set_1of2(board);
set of int: pins = index_set_2of2(board);
int: num_pins = length(pins);

array[rounds] of 0..num_pins: black_pins;
array[rounds] of 0..num_pins: white_pins;

% decision variables
array[pins] of var colors: guess;

% constraints
constraint forall(round in rounds)(
    black_pins[round] = sum(i in pins)(board[round, i] = guess[i]) /\
    white_pins[round] + black_pins[round] = sum(c in colors)(
      min(sum(i in pins)(board[round, i] = c), sum(i in pins)(guess[i] = c))
    )
);

% repeating allowed?
include "alldifferent.mzn";
constraint repeat -> forall(round in rounds)(all_different([board[round,i] | i in pins]));

solve satisfy;






