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
   >r 2dup parsed 2! r>
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

pad tib - 2 + constant /line
create line /line allot

: filesource? source-id 1 -1 within ;

: nextline ( file -- addr len flag )
   line /line rot read-line throw line -rot ;

: tabs>spaces ( addr len -- )
  begin 9 scan dup while >r bl over c! r> repeat 2drop ;

variable sourcepos 0 ,

: line>source ( -- flag )
   1 sourceline# + to sourceline#
   source-id file-position throw sourcepos 2!
   source-id nextline
   if sourcevar 2! >in off source tabs>spaces true else 2drop false then ;

:noname 
   sourcepos 2@ 2stksave
   deferred inputsaver ; is inputsaver

:noname 
   deferred inputrestorer
   2stkrest sourcepos 2!
   filesource? if 
      sourcepos 2@ source-id reposition-file throw 
      source-id nextline drop 2drop
   then ; is inputrestorer

: foreachline ( file xt -- )
   2>r begin
      2r@ drop nextline
   while
      r@ execute
   repeat 2drop rdrop rdrop ;


: interpret-file
   begin  refill  while  interpret  repeat ;

\g @see ansfile
: include-file
   save-input n>r
   parsed 2@ sourcename 2! \ XXX
   to source-id  0 to sourceline#
   ['] interpret-file catch .error!
   nr> restore-input -37 ?throw 
   throw ;


\g Deferred word called at start of INCLUDED. 
\g The xt must be ( c-addr1 u1 --- c-addr2 u2 )
defer inchook0  ' noop is inchook0

\g Deferred word called at end of INCLUDED. 
\g The xt must be ( c-addr -- c-addr ).
\g Will be called with the value of HERE before file was included.
defer inchook1  ' noop is inchook1

\g @see ansfile
: included  ( i*x c-addr u -- j*x )
   inchook0
   here >r
   r/o open-file throw >r 
   r@ ['] include-file catch
   r> close-file throw
   r> inchook1 drop 
   throw ;

\g Include file
\g @also included
: include ( i*x "filename" -- j*x )
   here parse-word s, count included ;

:noname dup 9 = if drop bl then deferred keyhandler ; is keyhandler

env: file true ;env
