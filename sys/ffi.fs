: c+! ( n addr -- )
   >r r@  c@ +  r> c! ;

: append ( str len cstr -- )
    2dup 2>r  count chars +  swap chars move  2r> c+! ;

: lastbody ( -- addr )
   lastname name>xt xt>body ;

: fn ( libhandle "name" -- )
   lastbody 9 cells + \ args
   here cell- @ \ ret
   here cell-  lastbody 9 cells +  - 1 cells / \ nargs
   lastbody cell+ \ cif  
   ffprep abort" Unable to prepare function call" 
   0 parse rot dlsym dup 0= abort" Unable to lookup symbol" lastbody ! ;

: int ( -- ) ffint , ;
: int64 ( -- ) ffint64 , ;
: sf ( -- ) fffloat , ;
: df sf ; \ XXX
: ptr ( -- ) ffptr , ;
: (int) ( -- ) ffint , fn ;
: (int64) ( -- ) ffint64 , fn ;
: (float) ( -- ) fffloat , fn ;
: (ptr) ( -- ) ffptr , fn ;
: (void) ( -- ) ffvoid , fn ;

: newfun ( lib -- )
   create 0 , 8 cells allot \ func|cif, will be filled by "ret"
   does> dup @ swap cell+ ffcall ;

: trylib
   s" lib" pad place 2swap pad append pad append  pad count dlopen ;

variable libs libs off

: openlib ( addr len -- handle )
   0 >r
   2dup s" " trylib r> or >r
   2dup s" .dylib" trylib r> or >r
   2dup s" .so" trylib r> or >r
   2dup s" .so.6" trylib r> or >r   \ Special case for libc
   2drop r>
   dup 0= abort" Unable to open library" ;

: library ( "forthname" "libname" ) 
   create here 0 , libs linked 0 parse 2dup s,
   openlib swap !
   does> @ newfun ;

:noname
   libs begin @ dup while dup cell+ count openlib over cell- ! repeat drop
   deferred coldchain ; is coldchain

0 [if]
library libc c

libc sleep int (int) sleep
libc cwrite int ptr int (int) write
1 lastname count cwrite .
1 sleep .
[then]
