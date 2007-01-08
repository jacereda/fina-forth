0 
constant r/o ( -- fam )
\g @see ansfile

2 
constant r/w ( -- fam )
\g @see ansfile

4 
constant w/o ( -- fam )
\g @see ansfile

\g @see ansfile
: bin ( fam1 -- fam2 )
   1 or ;

\g @see ansfile
: open-file ( c-addr u fam -- fileid ior )
\   >r 2dup parsed 2! r>
   openf ;

\g @see ansfile
: read-file ( c-addr u1 fileid -- u2 ior )
   readf ;

\g @see ansfile
: write-file ( c-addr u fileid -- ior )
   writef ;

\g @see ansfile
: close-file ( fileid -- ior )
   closef ;

\g Map file in memory
: mmap-file ( a1 -- a2 ior )
   mmapf ;

\g @see ansfile
: file-size ( fileid -- ud ior )
   sizef ;

\g @see ansfile
: file-position ( fileid -- ud ior )
   tellf ;

\g @see ansfile
: reposition-file ( ud fileid -- ior )
   seekf ;

\g @see ansfile
: read-line ( c-addr u1 fileid -- u2 flag ior )
   linef ;

here 1 c, 10 c, pad !
: newline [ pad @ ] literal count ;

\g @see ansfile
: write-line ( c-addr u fileid -- ior )
   >r r@ write-file ?dup 0= if newline r@ write-file then rdrop ;

\g @see ansfile
: create-file ( c-addr u fam -- fileid ior )
   open-file ;

\g @see ansfile
: delete-file ( c-addr u -- ior )
   deletef ;

\g @see ansfile
: resize-file ( ud fileid -- ior )
   truncf ;

variable (fname) 0 ,

-1 value sourceline#
here ," the terminal" count (fname) 2!

: sourcefilename 
   (fname) 2@ ;

\ Extend save-input and restore-input to save file name and line number
:noname  ( -- xn ... x1 n )
   sourcefilename  sourceline# deferred save-input 3 + ; is save-input

:noname  ( xn ... x1 n -- flag )
   3 - deferred restore-input if 
      2drop drop -1 
   else 
      to sourceline# (fname) 2! 0 
   then ; is restore-input

create nrbuf 2 cells allot
: n>r ( n1 .. nn n -- )
    dup 10 > abort" too many items"
    r> over nrbuf 2! 
    cells negate [ here 9 cells + 5 cells + ] literal + >r exit
    >r >r >r >r   >r >r >r >r   >r
    nrbuf 2@ >r >r ; compile-only
: nr> ( -- n1 .. nn n )
    r> r> dup rot nrbuf 2!
    cells negate [ here 9 cells + 5 cells + ] literal + >r exit
    r> r> r> r>   r> r> r> r>   r> 
    nrbuf 2@ >r ; compile-only

create line 102 allot

: foreachline ( file xt -- )
   2>r begin
      1 sourceline# + to sourceline# 
      line 100 2r> over swap 2>r read-line throw
   while ( u )
      line swap r@ execute
   repeat drop rdrop rdrop ;

: intline
   sourcevar 2! >in off interpret ;

: (finclude)
   to source-id  0 to sourceline#
   source-id ['] intline foreachline ;

\g @see ansfile
: include-file
   save-input n>r (finclude) nr> restore-input -37 ?throw ;


\g Deferred word called at start of INCLUDED. 
\g The xt must be ( c-addr1 u1 --- c-addr2 u2 )
defer inchook0  ' noop is inchook0

\g Deferred word called at end of INCLUDED. 
\g The xt must be ( c-addr -- c-addr ).
\g Will be called with the value of HERE before file was included.
defer inchook1  ' noop is inchook1

\g @see ansfile
: included  ( i*x c-addr u -- j*x )
   2dup parsed 2!  
   inchook0
   save-input n>r  here >r
   2dup r/o open-file throw >r 
   (fname) 2!
   r@ (finclude)
   r> close-file throw
   r> inchook1 drop
   nr> restore-input -37 ?throw ;

\g Include file
\g @also included
: include ( i*x "filename" -- j*x )
   here parse-word s, count included ;


env: file true ;env
