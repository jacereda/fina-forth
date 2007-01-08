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
: sf ( -- ) fffloat , ;
: df sf ; \ XXX
: ptr ( -- ) ffptr , ;
: (int) ( -- ) ffint , fn ;
: (float) ( -- ) fffloat , fn ;
: (ptr) ( -- ) ffptr , fn ;
: (void) ( -- ) ffvoid , fn ;
: newfun ( lib -- )
   create 0 , 8 cells allot \ func|cif, will be filled by "ret"
   does> dup @ swap cell+ ffcall ;
: trylib
   2swap pad place pad append  pad count dlopen ;
: library ( "forthname" "libname" ) 
   create 0 parse 2dup s" .dylib" trylib >r s" .so" trylib r> or
   dup 0= abort" Unable to open library" , 
   does> @ newfun ;

0 [if]
library libc libc

libc sleep int (int) sleep
libc cwrite int ptr int (int) write
1 lastname count cwrite .
1 sleep .
[then]
