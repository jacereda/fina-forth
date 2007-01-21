

\g @see ansdouble
: 2rot ( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 )
   2>r 2swap 2r> 2swap ;

\g @see ansdouble
: du<  ( ud1 ud2 -- flag )
   rot 2dup xor if  u>= nip nip  else  2drop u<  then ;

env: double-ext true ;env
