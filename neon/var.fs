\ Basic object variables
\ Version 1.0, 4 Feb 1997
\ Andrew McKewan
\ mckewan@austin.finnigan.com


\ ======================================================================
\ Define the basic cell-sized variable class. This is a generic superclass
\ that defines the basic access operators.

:Class CellObj  <Super Object

        CELL bytes Data

        :M  Get:   ( -- n )   M@   ;M
        :M  Put:   ( n -- )   M!   ;M

        :M  Clear:   0 M!  ;M
        :M  Print:   M@ .  ;M

        \ ( ^obj -- )  copies data from another CellObj
        :M ->:   @ M!  ;M

;Class


\ ======================================================================
\ Var is for integer data

:Class Var   <Super CellObj

        :M  +:  ( n -- )         ^base +!  ;M
        :M  -:  ( n -- )  NEGATE ^base +!  ;M

        :M  *:  ( n -- )  M@  *       M!   ;M
        :M  /:  ( n -- )  M@  SWAP /  M!   ;M
        :M  Negate:       M@  NEGATE  M!   ;M

;Class


\ ======================================================================
\ Bool is for storing booleans. It always returns TRUE or FALSE.

:Class Bool   <Super CellObj

        \ Put: always stored Forth boolean flag
        :M Put:  ( f -- )   0= 0= M!  ;M

        :M Set:      TRUE  M!  ;M
        :M Invert:   M@ 0= M!  ;M

        :M Print:  M@ IF ." true " ELSE ." false " THEN  ;M
;Class


\ ======================================================================
\ ExecVec stores an execution token.

:Class ExecVec   <Super CellObj

        \ Execute xt stored in variable
        :M Exec:  ( -- )   M@ EXECUTE  ;M

        \ Initialize to do nothing
        :M Clear:      ['] NOOP M!  ;M
        :M ClassInit:  Clear: self  ;M

;Class

\ ======================================================================
\ Ptr stores a pointer to dynamically-allocated memory. We also keep track
\ of the current size of the memory block.

HAVE ALLOCATE [IF]

:Class Ptr   <Super CellObj

        Var size        \ current size

        :M Size:  ( -- n )  \ get current size
                Get: size  ;M

        :M Release:  ( -- )   \ release current memory
                M@ IF  M@ FREE ?MEMERR  0 M!  THEN   Clear: size  ;M

        :M New:  ( len -- )  \ create a new memory block
                Release: self  DUP ALLOCATE ?MEMERR  M!  Put: size  ;M

        :M Resize:  ( len -- )  \ resize memory block
                M@ OVER RESIZE ?MEMERR  M!  Put: size  ;M

        :M Nil?:  ( -- f )  \ true if no memory has been allocated
                M@ 0=  ;M

;Class

[THEN]
