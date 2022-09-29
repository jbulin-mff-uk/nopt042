int: N = 4;

int: MODULUS = pow(2,N);
int: MAX = MODULUS-1;

set of int: BYTE = 0..MAX;
set of int: STEP = -1..MAX;

%%% decision variables %%%
array[BYTE] of var 0..1: key; % we will only allow 0's and 1's in the key
array[BYTE] of var BYTE: seed;

array[STEP] of var BYTE: a;
array[STEP,BYTE] of var BYTE: perm;

% initialize
constraint a[-1] = 0;
constraint forall(byte in BYTE)(perm[-1,byte] = byte);

% step: define a_i
constraint forall(i in STEP where i >= 0)(
  a[i] = (a[i-1] + perm[i-1,i] + key[i]) mod MODULUS
);

% step: define pi_i
constraint forall(i in STEP, byte in BYTE where i >= 0)(
  if perm[i-1,byte] = i then
    perm[i,byte] = a[i]
  else if perm[i-1,byte] = a[i] then
    perm[i,byte] = i
  else
    perm[i,byte] = perm[i-1,byte]
  endif endif
);

% return
constraint forall(byte in BYTE)(perm[MAX,byte] = seed[byte]);

solve satisfy;

output 
["key = "] ++ [show(key[i])|i in BYTE] ++ ["\n"] ++
["seed = ["] ++ ["\(seed[i])"++if i < MAX then "," else "" endif|i in BYTE] ++ ["]\n"];

%%% input: either key or seed %%%
%constraint key = array1d(BYTE,[1,1,0,0,0,1,1,0,1,0,1,1,1,1,1,1]);

%constraint key = array1d(BYTE,[1,1,0,0,0,0,1,0,1,1,0,0,1,0,1,0]);
constraint seed = array1d(BYTE,[15,0,1,2,4,3,14,8,10,6,9,7,11,5,13,12]); 









