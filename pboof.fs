require later.fs

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

\g Depth of object stack
: odepth ( -- u )
   obottom otos - 1 cells / ;

\g Print object stack
: o.s
   ." O: " odepth 0 <# [char] > hold #s [char] < hold #> type space
   odepth 1+ 1 ?do obottom i cells - @ . loop
   cr ;

\ OBJECT ARENA

1024 16 * constant /oarena     \ Size of object arena
create o0 /oarena allot        \ Start of object arena
here constant otop             \ End of object arena
o0 value ohere                 \ Object arena pointer
: osize ( -- u )  ohere o0 - ; \ Current size of object arena
0 value sdict0                 \ Saved dict0
0 value sdicttop               \ Saved dicttop
0 value shere                  \ Saved here
: >oarena                      \ Switch compilation area to object arena
   dict0 to sdict0  dicttop to sdicttop  here to shere
   o0 to dict0  otop to dicttop  ohere to here  ;
: oarena>                      \ Restore normal compilation area
   here to ohere  sdict0 to dict0  sdicttop to dicttop  shere to here ;


\ WORLD

\ Some definitions:
\ Current object: topmost object in object stack
\ Active object: object that will receive subsequent messages
\ Extensible object: object being extended with additional members or methods

\ Create the world, a wordlist and a sizeof field in the object arena
\ and creates the world object
:noname create >oarena wordlist 3 cells , oarena> , does> @ >o ; 
execute world ( O: -- obj )
\g Push world object to object stack

\ Save the current worldist to the object stack
get-current >o 

\ Push the world wordlist to the order stack and establish it as 
\ current wordlist
world o@ +order o@ set-current

\g Make the current object active
: activate ( O: obj -- obj ) o@ +order ;

\g Deactivate active object, the previously active object will become active
: deactivate previous ;

\g Make the current object active
: { ( O: obj -- obj )  activate ; immediate

\g Deactivate active object, the previously active object will become active
: } ( o: obj -- ) 
   deactivate state @ if postpone odrop then odrop ; immediate

\g Make current object extensible
: extend ( O: obj -- obj ) get-current o> swap >o >o o@ set-current ;

\g Restore previously extensible object
: extended  o> o> set-current >o ;

\g Send late message to current object
: (late) ( addr len --  O: obj -- obj ) activate nfa doword deactivate ;

\g Send late message to current object
: late parse-word postpone sliteral postpone (late) ; immediate

\g Push current object to data stack
: self ( -- obj  O: obj -- obj ) postpone o@ ; immediate

\g Address of current object size field
: sizeof ( -- addr )  self cell+ cell+ ;

\g Create member in extensible object
: member ( size "name" -- ) 
   >oarena dup allot oarena> 
   create sizeof @ , sizeof +! does> @ self + ; immediate

\g Clone active object
: cloned ( -- clone  O: prototype -- prototype )
   >oarena here 
   self @ wordlist !  \ Create wordlist and chain it to prototype wordlist
   sizeof here over @ cell- cell- dup allot move  \ Clone prototype data
   oarena> ;

\g Runtime for cloned objects
: doobj @r+ >o ;

\g Clone active object by sending a late CLONED message
: clone ( "name" -- )
   create immediate late cloned , 
   does> ( O: -- obj )
   @ state @ if postpone doobj dup , then >o ;

\g Runtime for instance members
: doinst @r+ self + >o ;

\g Instance active object as member of the previously active object
: instance ( "name" -- )
   late cloned  >o sizeof @ odrop 
   get-current >o activate
   create immediate  sizeof @ , sizeof +!  
   deactivate odrop
   does> @ state @ if postpone doinst dup , then self + >o ;

\g Dump object memory 
: dump  self sizeof @ dump ;

\g Print attribute
: .attr ( "attr" -- )
   odepth 1- spaces @r+ dup xt>name .name ." member at " 
   execute dup . ." : " @ . cr ;

\g Print object
: print
   odepth 2 - spaces ." object at " self . ." :" cr .attr sizeof ;

world { 
clone object
\g Prototype object
}
extended
: {  postpone { ;
}

