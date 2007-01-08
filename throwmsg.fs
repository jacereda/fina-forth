: ,"
   [char] " parse s, ;
\ here over 1 chars + allot place ;

here pad !
," xxx"
," [IF], [ELSE], or [THEN] exception"             \ -58
," exception in sending or receiving a character" \ -57
," QUIT"                                          \ -56
," floating-point unidentified fault"             \ -55
," floating-point underflow"                      \ -54
," exception stack overflow"                      \ -53
," control-flow stack overflow"                   \ -52
," compilation word list changed"                 \ -51
," search-order underflow"                        \ -50
," search-order overflow"                         \ -49
," invalid POSTPONE"                              \ -48
," compilation word list deleted"                 \ -47
," floating-point invalid argument"               \ -46
," floating-point stack underflow"                \ -45
," floating-point stack overflow"                 \ -44
," floating-point result out of range"            \ -43
," floating-point divide by zero"                 \ -42
," loss of precision"                             \ -41
," invalid BASE for floating point conversion"    \ -40
," unexpected end of file"                        \ -39
," non-existent file"                             \ -38
," file I/O exception"                            \ -37
," invalid file position"                         \ -36
," invalid block number"                          \ -35
," block write exception"                         \ -34
," block read exception"                          \ -33
," invalid name argument (e.g., TO xxx)"          \ -32
," >BODY used on non-CREATEd definition"          \ -31
," obsolescent feature"                           \ -30
," compiler nesting"                              \ -29
," user interrupt"                                \ -28
," invalid recursion"                             \ -27
," loop parameters unavailable"                   \ -26
," return stack imbalance"                        \ -25
," invalid numeric argument"                      \ -24
," address alignment exception"                   \ -23
," control structure mismatch"                    \ -22
," unsupported operation"                         \ -21
," write to a read-only location"                 \ -20
," definition name too long"                      \ -19
," parsed string overflow"                        \ -18
," pictured numeric output string overflow"       \ -17
," attempt to use zero-length string as a name"   \ -16
," invalid FORGET"                                \ -15
," interpreting a compile-only word"              \ -14
," undefined word"                                \ -13
," argument type mismatch"                        \ -12
," result out of range"                           \ -11
," division by zero"                              \ -10
," invalid memory address"                        \ -09
," dictionary overflow"                           \ -08
," do-loops nested too deeply during execution"   \ -07
," return stack underflow"                        \ -06
," return stack overflow"                         \ -05
," stack underflow"                               \ -04
," stack overflow"                                \ -03
," ABORT " char " here 2 - c!                     \ -02
," ABORT"                                         \ -01

: tmsg
   dup -58 0 within 0= -24 ?throw
   [ pad @ ] literal swap 58 + 
   for count + next count ;

: errstr
   parsed 2@ 256 u< swap dict? and if parsed 2@ else s" (wrong)" then ;

:noname ( code -- )
   dup 1 -1 within if
      space
      dup -2 = if  abort"msg 2@ type then
      dup -2 <> if
         errstr type space [char] ? emit space
         dup -1 -58 within if 
            exstr count type dup . 
         else 
            dup tmsg type
         then
      then cr
   then drop ; '.error !
