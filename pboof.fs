\ TODO: clone should be a method
16 cells constant /ostack
create ostack /ostack allot
ostack /ostack + value otos
0 value active
: >o otos cell- to otos  otos ! ;
: odrop otos cell+ to otos ;
: o@ otos @ ;
: o> o@ odrop ;

: { dup +order state @ if postpone literal postpone >o else >o then ; immediate
: } previous state @ if postpone odrop else odrop then ; immediate
: odefs get-current o> swap >o >o o@ set-current ;
create object immediate wordlist 3 cells ,
object { odefs
: self o@ ;
: /object self cell+ cell+ ;
: extend odefs ;
: extended o> o> swap >o set-current ;
: member ( size "name" -- ) create /object @ , /object +! does> @ self + ;
: cloned self /object self @ wordlist ! here over @ dup allot move ;
: clone ( "name" -- ) create immediate cloned ;
: dump  self /object @ dump ;
: .slots self [ expose-module private ] wordsin [ end-module ] ;
: late ( "method" -- ? ) 
   parse-word postpone sliteral postpone evaluate ; immediate compile-only
: .attr ( "attr" -- ) @r+ dup xt>name .name ." : " execute @ . ;
: name self begin cell- dup xt>name until xt>name ;
: print name .name ." at " self . ." : " ;
extended }
