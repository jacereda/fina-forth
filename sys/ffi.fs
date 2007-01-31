: c+! ( n addr -- )
   >r r@  c@ +  r> c! ;

: append ( str len cstr -- )
    2dup 2>r  count chars +  swap chars move  2r> c+! ;

: lastbody ( -- addr )
   lastname name>xt xt>body ;
: funcif cell+ ;
: funnargs   11 cells + ;
: funargs funnargs cell+ ;
: funret dup funnargs @ cells swap funargs + ;
: funname funret cell+ ;
: funresolve ( lib fun -- )
   >r
   r@ funargs r@ funret @  r@ funnargs @  r@ funcif
   ffprep abort" Unable to prepare function call" 
   r@ funname count rot @ dlsym dup 0= abort" Unable to lookup symbol" 
   r> ! ;

: funarg ( fun type -- fun )
   , 1 over funnargs +! ;
: funret ( lib fun type -- )
   , 0 parse s, funresolve ;

: int ( fun -- fun ) ffint funarg ;
: int64 ( fun -- fun ) ffint64 funarg ;
: sf ( fun -- fun ) fffloat funarg ;
: ptr ( fun -- fun ) ffptr funarg ;

: (int) ( lib fun -- ) ffint funret ;
: (int64) ( lib fun -- ) ffint64 funret ;
: (float) ( lib fun -- ) fffloat funret ;
: (ptr) ( lib fun -- ) ffptr funret ;
: (void) ( lib fun -- ) ffvoid funret ;


: libfuncs 2 cells + ;

\ Structure addr|link|9*cif|nargs|args...|name
: newfun ( lib -- lib fun )
   create here 
   0 ,                      \ addr
   9 cells allot            \ 9*cif
   over libfuncs linked     \ link
   0 ,                      \ nargs
   does> dup @ swap cell+ ffcall ;
: link>fun 10 cells - ;

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

: libname 3 cells + ;

: restorelib ( lib -- )
   dup libname count openlib over ! 
   dup libfuncs begin @ dup while 2dup link>fun funresolve repeat 2drop ;


\ Structure: handle|liblink|funclink|name
: library ( "forthname" "libname" ) 
   create here 
   0 ,             \ handle
   libs linked     \ link
   0 ,             \ funcs
   0 parse s, \ name
   restorelib
   does> newfun ;
: link>lib cell- ;


create 0buffer 256 allot

:noname
   libs begin @ dup while dup link>lib restorelib repeat drop
   deferred coldchain ; is coldchain

0 [if]
library libc c

libc sleep int (int) sleep
libc cwrite int ptr int (int) write
1 lastname count cwrite . cr
1 sleep .
[then]
