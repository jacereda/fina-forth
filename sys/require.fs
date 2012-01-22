\g Verbose includes
expose-module private

variable (incs)  (incs) off

:noname 
   deferred inchook0
   (incs) linked 2dup s, ; is inchook0

: (.inc) 
   cell+ count type cr ;

\g Print files included so far
: .included
   forall (incs) (.inc) ;

: (inc?)
   cell+ count 2over compare 0= found or to found ;

\g Has the file been included?
: included?  ( c-addr u -- flag )
   0 to found forall (incs) (inc?) 2drop found ;

\g Include file if not already included
: required  ( c-addr u -- )
   2dup included? if 2drop else included then ;

\g Include file if not already included
: require ( "path" -- )
   parse-word required ;

export required require .included
end-module
