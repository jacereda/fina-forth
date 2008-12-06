require later.fs

16 cells constant /ostack
create otop /ostack allot
otop /ostack + constant obottom
obottom value otos
0 value active
: >o otos cell- to otos  otos ! ;
: odrop otos cell+ to otos ;
: o@ otos @ ;
: o> o@ odrop ;
: odepth obottom otos - 1 cells / ;
: o.s 
   ." O: " odepth 0 <# [char] > hold #s [char] < hold #> type space
   odepth 1+ 1 ?do obottom i cells - @ . loop
   cr ;

1024 16 * constant /oarena
create o0 /oarena allot
here constant otop
o0 value ohere
: osize ohere o0 - ;

0 value sdict0
0 value sdicttop
0 value shere

: >oarena 
   dict0 to sdict0  dicttop to sdicttop  here to shere
   o0 to dict0  otop to dicttop  ohere to here  ;
: oarena>
   here to ohere 
   sdict0 to dict0  sdicttop to dicttop  shere to here ;

: activate o@ +order ;
: deactivate previous ;
: { ( o: obj -- obj ) activate ; immediate
: } ( o: obj -- ) 
   deactivate state @ if postpone odrop then odrop ; immediate
: extend get-current o> swap >o >o o@ set-current ;
: extended  o> o> set-current >o ;
: (late) ( len -- ) activate nfa doword deactivate ;
: late ( "method" -- ? ) 
   parse-word postpone sliteral postpone (late) ; immediate

\ : allot ." Allocating " dup . ." at " here . cr allot ;
\ : wordlist ." Wordlist at " here . cr wordlist ;

:noname create >oarena wordlist 3 cells , oarena> , does> @ >o ; execute world
world activate extend

: self ( -- obj ) o@ ;
: sizeof  self cell+ cell+ ;
: member ( size "name" -- ) 
   >oarena dup allot oarena> 
   create sizeof @ , sizeof +! does> @ self + ; immediate
: cloned
   >oarena here
   sizeof self @ wordlist !  here over @ cell- cell- dup allot move 
   oarena> ;
: doobj @r+ >o ;
: clone 
   create immediate late cloned , 
   does> @ state @ if postpone doobj dup , then >o ;
: doinst @r+ self + >o ;
: instance ( "name" -- )
   late cloned  >o sizeof @ odrop 
   get-current >o activate
   create immediate  sizeof @ , sizeof +!  
   deactivate odrop
   does> @ state @ if postpone doinst dup , then self + >o ;
: .slots self [ expose-module private ] wordsin [ end-module ] ;
: dump  self sizeof @ dump ;
: .attr ( "attr" -- ) 
   odepth 1- spaces @r+ dup xt>name .name ." member at " 
   execute dup . ." : " @ . cr ;
: print
   odepth 2 - spaces ." object at " self . ." :" cr .attr sizeof ;
: .obj late print ;
world { clone object }
