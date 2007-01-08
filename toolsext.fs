
\g Apply xt to each parsed word. The xt stack picture must be
\g ( i*x a u -- i*x 0 | j*x -1). If flag=0 the parsing process will terminate.
: apply ( "word" --  xt )
   postpone ['] ;  immediate compile-only

: foreachparsed ( xt -- )
   >r begin
      begin
         parse-word dup
      while 
         r@ execute if rdrop exit then
      repeat 2drop refill 0=
   until rdrop ;

: []handle
   s" [if]"   2over compare 0= if 2drop 1+ -1 exit then
   s" [else]" 2over compare 0= if 2drop 1- -1 exit then
   s" [then]" 2over compare 0= if 2drop 1- -1 exit then 
   2drop 0 ; 

: [else] 
   1 begin apply []handle foreachparsed dup 0= until drop ; immediate

: [if] 
   0= if postpone [else] then ; immediate

: [then] ( -- )
   ; immediate 
