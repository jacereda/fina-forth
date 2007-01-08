\ test.fth -- Class testing
\ Version 1.0, 4 Feb 1997
\ Andrew McKewan
\ mckewan@austin.finnigan.com

HAVE _TEST_ [IF] _TEST_ [THEN]  MARKER _TEST_

\ S" TESTER.FTH" INCLUDED
include ../tester.fs
TRUE VERBOSE !
DECIMAL
{ -> }


\ ======================================================================
TESTING OBJECT CREATION

{ Var x -> }
{ 99 Put: x -> }
{ Get: x -> 99 }
{ Var y -> }
{ Get: x 1+ Put: y -> }
{ Get: y -> 100 }

: T1  Get: x ;
{ T1 -> 99 }

:Class Point  <Super Object

        Var x
        Var y

        :M Get:  Get: x  Get: y  ;M
        :M Put:  Put: y  Put: x  ;M

        :M Print:  Get: self  SWAP . .  ;M

        :M ClassInit:   1 Put: x  2 Put: y ;M

;Class

{ Point p -> }
{ Get: p -> 1 2 }
{ 3 4 Put: p -> }
{ Get: p -> 3 4 }

:Class Pixel  <Super Point

        Var color

        :M Put:  ( x y color -- )  Put: color  Put: super  ;M
        :M Get:  Get: super  Get: color  ;M

        :M Print:   Print: super  Print: color  ;M

;Class

{ Pixel pix -> }
{ 1 2 3 Put: pix -> }
{ Get: pix -> 1 2 3 }


TESTING ExecVec

ExecVec ex
{ Exec: ex -> }
: NINE 9 ;
' NINE Put: ex
{ Exec: ex -> 9 }


\ ======================================================================
TESTING LATE BINDING

:Class C1  <Super Object  <General

        :M Draw:   1 ;M

        :M Print:  3 0 DO  Draw: [ self ]  LOOP ;M

;Class

{ C1 o1 -> }
{ Print: o1 -> 1 1 1 }

:Class C2   <Super C1

        :M Draw:   2  ;M

;Class

{ C2 o2 -> }
{ Print: o2 -> 2 2 2 }


\ ======================================================================
TESTING OBJECT POINTER

:Class C3  <Super Object

        C1 p1
        C2 p2
        Var pp1         \ pointer to p1
        Var pp2

        :M ClassInit:  Addr: p1 Put: pp1   Addr: p2 Put: pp2 ;M
        :M Print:      Print: [ Get: pp1 ]  Print: [ Get: pp2 ]  ;M
        :M Switch:     Get: pp1 Get: pp2   Put: pp1 Put: pp2 ;M
;Class

{ C3 o3 -> }
{ Print: o3 -> 1 1 1 2 2 2 }
{ Switch: o3 -> }
{ Print: o3 -> 2 2 2 1 1 1 }


\ ======================================================================

TESTING ARRAY

10 Array a1
{ 6 2 To: a1 -> }
{ 2 At: a1 -> 6 }
{ 99 Fill: a1 -> }
{ 5 At: a1 -> 99 }

:Class C4  <Super Object

    10 Array a1

    :M At:  ( index -- value )  At: a1  ;M
    :M To:  ( value index -- )  To: a1  ;M
    :M Fill:  Fill: a1  ;M

;Class

{ C4 o4 -> }
{ 6 2 To: o4 -> }
{ 2 At: o4 -> 6 }
{ 99 Fill: o4 -> }
{ 5 At: o4 -> 99 }

TESTING X-ARRAY

{ 10 X-Array xa -> }
: ONE 111 ;
: TWO 222 ;
: THREE 333 ;
{ ' ONE 1 To: xa -> }
{ ' TWO 2 To: xa -> }
{ : T3 ['] THREE 3 To: xa ; T3 -> }
{ 1 Exec: xa -> 111 }
{ 2 Exec: xa -> 222 }
{ 3 Exec: xa -> 333 }
{ 4 Exec: xa -> }


\ ======================================================================

HAVE ALLOCATE [IF]
TESTING HEAP OBJECTS

0 VALUE POBJ

{ Heap> Point TO POBJ -> }
{ Get: [ POBJ ] -> 1 2 }
{ 3 4 Put: [ POBJ ] -> }
{ Get: [ POBJ ] -> 3 4 }
{ POBJ Get: Point -> 3 4 }  ( class binding )
{ POBJ RELEASE -> }

{ 10 Heap> Array TO POBJ -> }
{ 6 2 To: [ POBJ ] -> }
{ 2 At: [ POBJ ] -> 6 }
{ 99 Fill: [ POBJ ] -> }
{ 5 At: [ POBJ ] -> 99 }
{ POBJ RELEASE -> }

{ : T10  10 Heap> Array TO POBJ ; T10 -> }
{ : T11  6 2 To: [ POBJ ] ; T11 -> }
{ : T12  2 At: [ POBJ ] ; T12 -> 6 }
{ : T13  99 Fill: [ POBJ ] ; T13 -> }
{ : T14  5 At: [ POBJ ] ; T14 -> 99 }
{ : T15  5 POBJ At: Array ; T15 -> 99 }  ( class binding )
{ : T16  POBJ RELEASE ; T16 -> }

[THEN]

CR .( Class tests complete )

