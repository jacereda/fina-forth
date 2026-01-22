expose-module private
: lastbody ( -- addr )
   lastname name>xt xt>body ;
: funcif cell+ ;
: funnargs   10 cells + ;
: funargs funnargs cell+ cell+ ;
: funret dup funnargs @ cells swap funargs + ;
: funname funret cell+ ;
: setupcif ( fun -- )
   >r  r@ funargs r@ funret @  r@ funnargs @  r@ funcif
   ffprep abort" Unable to prepare function call"  rdrop ;

: lookup ( addr len lib -- addr )
   @ dlsym dup 0= abort" Unable to lookup symbol" ;

: funresolve ( lib fun -- )
   >r  r@ setupcif  r@ funname count rot lookup  r> ! ;

: funarg ( fun type -- fun )
   , 1 over funnargs +! ;
defer ret
: funret ( lib fun type -- )
   , 0 parse s, funresolve ;

: int ( fun -- fun ) ffint funarg ;
: int64 ( fun -- fun ) ffint64 funarg ;
: sf ( fun -- fun ) fffloat funarg ;
: df ( fun -- fun ) ffdouble funarg ;
: ptr ( fun -- fun ) ffptr funarg ;

: (int) ( lib fun -- ) ffint ret ;
: (int64) ( lib fun -- ) ffint64 ret ;
: (float) ( lib fun -- ) fffloat ret ;
: (ptr) ( lib fun -- ) ffptr ret ;
: (void) ( lib fun -- ) ffvoid ret ;
: (sf) ( lib fun -- ) fffloat ret ;
: (df) ( lib fun -- ) ffdouble ret ;

: libfuncs 2 cells + ;

: newproto (  -- )
   create here
   0 ,                      \ addr
   9 cells allot            \ 9*cif
   0 ,                      \ nargs
;

\ Structure addr|9*cif|link|nargs|args...|name
: newfun ( lib -- lib fun )
   ['] funret is ret  newproto
   over libfuncs linked
   does> dup @ swap cell+ ffcall ;
: link>fun 11 cells - ;

: trylib ( addr len suffix suffixlen prefix prefixlen -- handle)
   pad place 2swap pad append pad append  pad count dlopen ;

variable libs libs off

: openlib ( addr len -- handle )
   0 >r
   2dup s" " s" " trylib r> or >r
   2dup s" .dylib" s" lib" trylib r> or >r
   2dup s" .so" s" lib" trylib r> or >r
   2dup s" .so.6" s" lib" trylib r> or >r   \ Special case for libc
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


: cbret ( cif type -- )
   , ;

256 constant /clos

: cbexec ( ... spbase inline:xt -- )
   @r+ sp0 @ >r  swap sp0 !
   execute
   r> sp0 ! endtick ;

: wrapcb ( xt -- xt')
   pad ! :noname postpone cbexec pad @ , postpone ; ;
: callback ( -- cif )
   ['] cbret is ret  newproto 0 ,
   does> ( xt cif -- ) >r wrapcb r> funcif create here /clos allot
   ffclos abort" Unable to setup closure" ;

: callback; ( cif -- ) setupcif ;

:noname
   libs begin @ dup while dup link>lib restorelib repeat drop
   deferred coldchain ; is coldchain

: symbolfrom: ' >body lookup ;

export library 0buffer
export (int) (int64) (float) (ptr) (void) (sf) (df)
export int int64 sf df ptr
export callback callback;
export symbolfrom:

end-module
