\ ============================================================================
\ DOUBLE.FR  -  Testing MinForth's Double Number wordset
\ ============================================================================


CR .( ----------------------------- ) CR
TESTING MINFORTH DOUBLE WORDS
   .( ----------------------------- ) CR
DECIMAL

{ -> }          \ START WITH CLEAN SLATE

HEX 80000000 CONSTANT MSB
DECIMAL

\ ----------------------------------------------------------------------------
TESTING STACK OPERATIONS

{ 1 2 3 4 5 6 2ROT -> 3 4 5 6 1 2 }
\ { 1 2 3 4     4DUP -> 1 2 3 4 1 2 3 4 }

\ ----------------------------------------------------------------------------
TESTING NUMBER RECOGNITION

{ 0.   -> 0 0 }
{ 1.   -> 1 0 }
{ -.1  -> -1 -1 }
{ -2.  -> -2 -1 }

{ : DN1 3. -.4 ; -> }
{ 1 2 DN1 -> 1 2 3 0 -4 -1 }

\ ----------------------------------------------------------------------------
TESTING ARITHMETICS

{ : MIN-D  0 MSB ; -> }
{ : MAX-D -1 MSB INVERT ; -> }

{ 1.  D>S -> 1 }
{ -2. D>S -> -2 }
{ 0.  D>S -> 0 }

{ 0.  DNEGATE -> 0. }
{ 1.  DNEGATE -> -1. }
{ -2. DNEGATE -> 2. }

{ 1.  DABS -> 1. }
{ -2. DABS -> 2. }

{ 3. 4.    D+ -> 7. }
{ 3. -4.   D+ -> -1. }
{ -1. 1.   D+ -> 0. }
{ -1 0 1 0 D+ -> 0 1 }

{ 2. 2DUP D- -> 0. }
{ 3. -3.  D- -> 6. }
{ -3. 3.  D- -> -6. }

{ 0.    D2* -> 0. }
{ 1.    D2* -> 2. }
{ -1.   D2* -> -2 -1 }
{ MSB 0 D2* -> 0 1 }
{ -1 0  D2* -> -2 1 }

{ 0.   D2/ -> 0. }
{ 1.   D2/ -> 0. }
{ -1.  D2/ -> -1. }
{ 0 1  D2/ -> MSB 0 }
{ -1 0 D2/ -> MSB INVERT 0 }
{ 0 -1 D2/ -> MSB -1 }

\ ----------------------------------------------------------------------------
TESTING COMPARISONS

{ 0.  D0= -> TRUE }
{ 1.  D0= -> FALSE }
{ 0 1 D0= -> FALSE }
{ -1. D0= -> FALSE }

{ 0.    D0< -> FALSE }
{ -1.   D0< -> TRUE }
{ 1.    D0< -> FALSE }
{ 0 1   D0< -> FALSE }
{ MAX-D D0< -> FALSE }
{ MIN-D D0< -> TRUE }

{ 0. 0.   D= -> TRUE }
{ 1. 0.   D= -> FALSE }
{ 0 1 1 0 D= -> FALSE }
{ 0 1 0 1 D= -> TRUE }

{ 0. 0.       DU< -> FALSE }
{ MIN-D MIN-D DU< -> FALSE }
{ 0. 1.       DU< -> TRUE }
{ 0. -1.      DU< -> TRUE }
{ MAX-D MIN-D DU< -> TRUE }

{ -1. 0.      D< -> TRUE }
{ 0. 0.       D< -> FALSE }
{ 0. 1.       D< -> TRUE }
{ MIN-D MAX-D D< -> TRUE }
{ MAX-D MIN-D D< -> FALSE }

{ 0. 1.       DMIN -> 0. }
{ 1. 0.       DMIN -> 0. }
{ -1. 1.      DMIN -> -1. }
{ MIN-D 0.    DMIN -> MIN-D }
{ MAX-D 0.    DMIN -> 0. }
{ MAX-D MIN-D DMIN -> MIN-D }

{ 0. 1.       DMAX -> 1. }
{ 1. 0.       DMAX -> 1. }
{ -1. 1.      DMAX -> 1. }
{ MIN-D 0.    DMAX -> 0. }
{ MAX-D 0.    DMAX -> MAX-D }
{ MAX-D MIN-D DMAX -> MAX-D }

\ ----------------------------------------------------------------------------
TESTING MIXED ARITHMETICS

{ -1. 1  M+ -> 0. }
{ 0 1 1  M+ -> 1 1 }
{ -1 0 1 M+ -> 0 1 }


{ -2. 2 1   M*/ -> -4. }
{ -2. 1 2   M*/ -> -1. }
{ -1. 2 2   M*/ -> -1. }
{ -1. 2 1   M*/ -> -2. }
{ -1. 1 2   M*/ -> 0. }
{ -1. -1 1  M*/ -> 1. }

