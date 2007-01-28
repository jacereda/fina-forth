
require timer.fs

2variable empty 0. empty 2!

\g Start recording time
: lap ( --  r: -- d)
  r> nstime 2>r >r ;

\g End recording time
: /lap ( -- d  r: d -- )
  r> nstime 2r> d- empty 2@ d- rot >r ;

\g Measure raw time required to execute xt including instrumentation.
: rawmeasured ( xt -- d )
   lap execute /lap ;

marker forgetit
:noname 
   0.
   10000 0 do lap /lap d+ loop
   1 10000 m*/ empty 2! 
   ; execute
forgetit

\g Measure time required to execute xt. xt must have stack diagram ( -- )
: measured ( xt -- d )
   rawmeasured ['] noop rawmeasured d- ;

\g Measure time required to execute word. Word must have stack diagram ( -- )
: measure ( "word" -- ) 
   ' measured ;

: .### # # # [char] . hold ;

\g Print nanoseconds in dotted format
: ns. ( d -- )
   <# .### .### .### #s #> type space ;

\g Print measure
: .measure ( d -- )
   ." took " ns. ." nanoseconds" cr ;
