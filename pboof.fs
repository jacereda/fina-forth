\ TODO: clone should be a method
16 cells constant /ostack
create ostack /ostack allot
ostack /ostack + value otos
0 value active
: >o otos cell- to otos  otos ! ;
: odrop otos cell+ to otos ;
: o@ otos @ ;
: o> o@ odrop ;

1024 16 * constant /oarena
create o0 /oarena allot
here constant otop
o0 value ohere

0 value sdict0
0 value sdicttop
0 value shere

: >oarena 
   dict0 to sdict0  dicttop to sdicttop  here to shere
   o0 to dict0  otop to dicttop  ohere to here  ;
: oarena>
   here to ohere 
   sdict0 to dict0  sdicttop to dicttop  shere to here ;

: activate ( obj -- ) dup +order >o ;
: deactivate previous odrop ;
: { dup +order state @ if postpone literal postpone >o else >o then ; immediate
: } previous state @ if postpone odrop else odrop then ; immediate
: odefs get-current o> swap >o >o o@ set-current ;

: (late) ( obj method len -- ) rot activate nfa doword deactivate ;
: late ( object "method" -- ? ) 
   parse-word postpone sliteral postpone (late) ; immediate compile-only


>oarena wordlist 3 cells , oarena> constant object immediate

object { odefs
: self o@ ;
: /object self cell+ cell+ ;
: extend odefs ;
: extended o> o> swap >o set-current ;
: member ( size "name" -- ) 
   >oarena dup allot oarena> 
   create /object @ , /object +! does> @ self + ;
: cloned ( -- o )
   >oarena here
   /object self @ wordlist ! here over @ cell- cell- dup allot move 
   oarena> ;
: clone ( "name" -- ) cloned constant immediate ;
: dump  self /object @ dump ;
: .slots self [ expose-module private ] wordsin [ end-module ] ;
: .attr ( "attr" -- ) @r+ dup xt>name .name ." : " execute @ . ;
: name self begin cell- dup xt>name until xt>name ;
: print name .name ." at " self . ." : " ;
extended }
: .obj late print ;
