
\g Start recording time
: lap ( --  r: -- d)
  r> nstime 2>r >r ;

\g End recording time
: /lap ( -- d  r: d -- )
  r> nstime 2r> d- rot >r ;

\g Measure raw time required to execute xt including instrumentation.
: rawmeasured ( xt -- d )
   lap execute /lap ;

\g Measure time required to execute xt.
: measured ( i*x xt -- j*x d )
   ['] noop rawmeasured 2drop \ warm up cache
   rawmeasured
   ['] noop rawmeasured d- ;

\g Measure time required to execute word.
: measure ( "word" -- )
   ' measured ;

: .### # # # [char] . hold ;

\g Print nanoseconds in dotted format
: ns. ( d -- )
   <# .### .### .### #s #> type space ;

\g Print measure
: .measure ( d -- )
   ." took " ns. ." nanoseconds" cr ;
