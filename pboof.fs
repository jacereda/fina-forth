\ OBJECT STACK

16 cells
constant /ostack
\g Size of object stack

create otop /ostack allot
\g Start of object stack

otop /ostack + 
constant obottom
\g Bottom of object stack

obottom 
value otos
\g Pointer to top of object stack

\g Push object to object stack
: >o ( obj -- O: -- obj )
   otos cell- to otos  otos ! ;

\g Drop object from object stack
: odrop ( O: obj -- )
   otos cell+ to otos ;

\g Fetch topmost object from object stack
: o@ ( -- obj O: obj -- obj )
   otos @ ;

\g Pop object from object stack
: o> ( -- obj O: obj -- )
   o@ odrop ;

\g Duplicate topmost object
: odup ( O: obj -- obj )
   o@ >o ;

\g Pick item from object stack
: opick ( u -- obj ) 
   cells otos + @ ;

\g Depth of object stack
: odepth ( -- u )
   obottom otos - 1 cells / ;

\g Print object stack
: o.s
   ." O: " odepth 0 <# [char] > hold #s [char] < hold #> type space
   odepth 0 ?do odepth 1- i - opick . loop cr ;

\g Print context information
: .ctx
   cr order o.s .s cr ;

\ OBJECT ARENA

1024 16 * constant /oarena     \ Size of object arena
create o0 /oarena allot        \ Start of object arena
here constant otop             \ End of object arena
o0 value ohere                 \ Object arena pointer
: osize ( -- u )  ohere o0 - ; \ Current size of object arena
: (>oarena) 
   dict0 dicttop here 3 
   o0 to dict0  otop to dicttop  ohere to here ;
: >oarena                      \ Switch compilation area to object arena
   postpone (>oarena) postpone n>r ; immediate compile-only
: (oarena>)
   here to ohere
   3 <> throw  to here  to dicttop  to dict0 ;
: oarena>                      \ Restore normal compilation area
   postpone nr> postpone (oarena>) ; immediate compile-only
: oallot ( u -- )              \ Allocate space in object arena
   >oarena allot oarena> ;
: o, ( u -- )                  \ Compile word in object arena
   >oarena , oarena> ;
: owordlist ( -- addr )        \ Create wordlist in object arena
   >oarena wordlist oarena> ;

-1 value mbrhandler 
-1 value objhandler
-1 value inshandler
: handler ( xt -- addr )
   ?dodefine ['] docreate = swap @ and ;

\ WORLD

\ Some definitions:
\ Current object: topmost object in object stack
\ Active object: object that will receive subsequent messages

\ Create the bootstrap world, just a wordlist and a sizeof field 
\ in the object arena
:noname owordlist 3 cells o, ; execute constant (world)


\ Push the bootstrap world to the object and order stacks and establish it as 
\ current worldist, making it the active object
(world) >o o@ +order definitions

\ Add current object to order stack and set it as current wordlist
: (extend) ( O: obj -- obj )
   o@ +order definitions ;

\ Remove active object from the order stack and restore previously
\ current wordlist
: (extended)  previous definitions ;

\g Make current object the active object
: extend ( O: obj -- obj )
   odup (extend) ;

\g Restore previously active object
: extended ( O: obj -- )
   (extended) odrop ;

\g Send late message to current object
: (late) ( addr len --  O: obj -- ) nfa doword ;

\g Send late message to current object
: late ( "message" -- ?  runtime: ? -- ?  O: obj -- )
   parse-word postpone sliteral postpone (late) ; immediate

\g Address of current object size field
: sizeof ( -- addr  O: obj -- obj )
   o@ cell+ cell+ ;

\g Create member in active object
: member ( size "name" -- ) 
   dup oallot  create sizeof @ , sizeof +! does> @ o@ + ; immediate

\ Create wordlist and chain it to prototype wordlist
: clonewl o@ @ owordlist ! ;

\ Clone the sizeof field
: clonesz sizeof @ o, ;

: mbr?  name>xt handler mbrhandler = ;
: ins?  name>xt handler inshandler = ;
: obj?  name>xt handler objhandler = ;
: slot? dup mbr? swap ins? or ;

0 value nextslot

: (findoffset) ( offset nfa -- offset nfa )
   >r  r@ slot? if 
      r@ name>xt >body @ over = if  r@ to found else  r@ to nextslot  then
   then r> ;

: offset>slot ( offset -- nfa )
   0 to nextslot
   o@ ['] (findoffset) forwordsin drop  found ;

: forslots ( xt -- )
   0 to nextslot
   >r 0 begin dup sizeof @ < while 
      dup offset>slot ?dup if
          r@ execute
      then 1+
   repeat rdrop drop ;

: slotoffset ( nfa -- offset )
   name>xt >body @ ;

: slotaddr ( nfa -- addr )
   slotoffset o@ + ;

: /slot ( nfa -- )
   nextslot if nextslot slotoffset else sizeof @ then swap slotoffset - ;

: clonembr ( nfa -- )
   >r  r@ slotaddr  ohere  r> /slot dup oallot move ;

: cloneins ( nfa -- )
   slotaddr >o (extend) late cloned extended ;

: cloneslot ( nfa -- )
   dup mbr? if clonembr else cloneins then ;

: cloneslots ( cloneaddr -- cloneaddr )
   ['] cloneslot forslots ;

\g Clone active object
: cloned ( -- O: prototype -- prototype )
   ohere clonewl clonesz cloneslots extended >o (extend) ;

: single  (extend) parse-word (late) (extended) ;

\g Runtime for cloned objects
: doobj @r+ >o @r+ execute odrop ;

: (clone) 
   create immediate here 0 , 
   does> @ state @ if postpone doobj dup , then >o single odrop ;

\g Clone active object by sending a late CLONED message
:  clone ( "name" --  )
   (extended) (clone) (extend)  late cloned  o@ swap ! ;

\g Runtime for instance members
: doinst @r+ o@ + >o @r+ execute odrop ;

: (instance)
   create immediate sizeof @ , sizeof +!
   does> @ state @ if postpone doinst dup , then o@ + >o single odrop ;

\g Instance active object as member of the previously active object
: instance ( "name" -- )
   o@ sizeof @ extended (instance) >o (extend) late cloned ;

\g Dump object memory 
\ : dump  o@ sizeof @ dump ;

: .mbr ( nfa -- )
   ." member at " slotaddr dup 16 based . ." : " @ . cr ;

: .ins ( nfa -- )
   slotaddr
   ." instance at " dup . cr
   >o (extend) late print extended ;

: .slot ( nfa -- )
   odepth 1- spaces  dup .name dup mbr? if .mbr else .ins then ;

\g Print object
: print
   odepth 2 - spaces ." object at " o@ 16 based . ." sized " sizeof @ . cr
   ['] .slot forslots ;

extended

(world) +order
: world (world) >o single odrop ;
previous

\ OBJECT

world extend

world clone object
\g Prototype object

object clone dummy
dummy extend
' dummy handler to objhandler
1 cells member mbr  ' mbr handler to mbrhandler
object instance ins  ' ins handler to inshandler
extended

extended
