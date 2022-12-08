expose-module private

\g apply xt to each word parsed. The xt stack picture must be
\g ( i*x a u -- i*x 0 | j*x -1). If tos is true the parsing process ends.
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
   s" [if]"   2over icompare unless 2drop 1+ false exit then
   s" [else]" 2over icompare unless 2drop dup 1 = + dup 0= exit then
   s" [then]" 2over icompare unless 2drop 1- dup 0= exit then
   2drop false ;

\g @see anstools
: [else]
   1 ['] []handle foreachparsed drop ; immediate

\g @see anstools
: [if]
   unless postpone [else] then ; immediate

\g @see anstools
: [then] ( -- )
   ; immediate

export [if] [else] [then]
end-module
