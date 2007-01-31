
\g Syntactic sugar used in combination with FOREACHPARSED
: apply ( "word" --  xt )
   postpone ['] ;  immediate compile-only

\g apply xt to each word parsed. The xt stack picture must be
\g ( i*x a u -- i*x 0 | j*x -1). If tos=0 the parsing process ends.
: foreachparsed ( xt -- )
   >r begin
      begin
         parse-word dup
      while 
         r@ execute if rdrop exit then
      repeat 2drop refill 0=
   until rdrop ;

\ helper word for [else]
: []handle
   s" [if]"   2over icompare 0= if 2drop 1+ -1 exit then
   s" [else]" 2over icompare 0= if 2drop 1- -1 exit then
   s" [then]" 2over icompare 0= if 2drop 1- -1 exit then 
   2drop 0 ; 

\g @see anstools
: [else] 
   1 begin apply []handle foreachparsed dup 0= until drop ; immediate

\g @see anstools
: [if] 
   0= if postpone [else] then ; immediate

\g @see anstools
: [then] ( -- )
   ; immediate 
