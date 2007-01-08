\ BNF Parser                                (c) 1988 B. J. Rodriguez
\ Adapted to FINA by Jorge Acereda

: dp! here - allot ;
0 value matched

\g enter rule
: <bnf ( -- R: x -- old>in oldhere x | x -- )
   r> matched if  >in @ here 2>r  >r  else  drop  then ;

\g leave rule
: bnf> ( -- R: old>in oldhere x -- x | old>in oldhere x -- x )
   r> 2r> matched if  2drop  else  dp! >in !  then >r ;

\g prepare to evaluate alternate rule
: | ( -- R: old>in oldhere x -- | old>in oldhere x -- x )
   r> 2r> matched if  2drop drop  else  2dup dp! >in ! 2>r >r then 
   true to matched ;

\g start rule definition
: bnf: ( -- )
   : reveal postpone <bnf ;

\g end rule definition
: ;bnf ( -- )
   postpone bnf> postpone ; ; immediate

\g get current token
: @token ( - n )
   source >in @ /string drop c@ ;

\g consume token
: +token ( -- )
   matched negate >in +! ;

\g compare against current token and set matched
: =token ( n -- )
   @token =  matched and to matched ;

\g create a token
: token ( n "name" -- )
   create c, does> c@ =token +token ;

\g start bnf definition
: 0bnf ( -- )
   0 source + c!
   true to matched ;

\g end bnf definition
: /bnf ( -- )
   source nip >in ! ;


1 [if]


\ BNF Parser Example #1 - pattern recog.
\ from Aho & Ullman, Principles of Compiler Design, p.137
\ this grammar recognizes strings having balanced parentheses
hex    28 token '('      29 token ')'      0 token <eol>
bnf: <char>
   @token  dup 2a 7f within  swap 1 27 within or to matched  +token ;bnf
bnf: <s>   '(' <s> ')' <s>  |  <char> <s>  |  ;bnf
: parse1
   0bnf <s> <eol> /bnf
   cr matched if ." matched " else ." failed " then ;


\  BNF Parser Example    #2  - infix notation        18 9 88 bjr 14:54
hex    2b token   '+'    2d  token '-'     2a  token  '*'     2f token '/'
       28 token   '('    29  token ')'     5e  token  '^'
       30 token   '0'    31  token '1'     32  token  '2'     33 token '3'
       34 token   '4'    35  token '5'     36  token  '6'     37 token '7'
       38 token   '8'    39  token '9'       0 token  <eol>
bnf: <digit>      
   '0'  | '1' | '2' |  '3' | '4' | '5' | '6' | '7' |  '8' | '9' ;bnf
bnf: <number>    <digit> <number>    |     <digit> ;bnf

\ from Aho & Ullman,     Principles of Compiler Design, pp.135,178
0 value (expression)
bnf: <element>     '(' (expression) execute ')'  |   <number> ;bnf
bnf: <primary>     '-' <primary>    |   <element> ;bnf
bnf: <factor>    <primary> '^' <factor> | <primary> ;bnf
bnf: <t'>     '*' <factor> <t'> | '/' <factor> <t'> | ;bnf
bnf: <term>  <factor> <t'> ;bnf
bnf: <e'>    '+' <term> <e'>  | '-' <term> <e'>  | ;bnf
bnf: <expression>     <term> <e'> ;bnf
' <expression> to (expression)
: parse2     
   0bnf  <expression> <eol> /bnf
   cr matched if  ." matched " else ." failed " then ;



\  BNF Example #3       code generation               18 9 88 bjr 21:57

: (s,)
   tuck here swap move allot ;
: ," 
  [char] " parse postpone sliteral postpone (s,) ; immediate compile-only


hex    2b token   '+'    2d  token '-'     2a  token  '*'     2f token '/'
       28 token   '('    29  token ')'     5e  token  '^'
       30 token   '0'    31  token '1'     32  token  '2'     33 token '3'
       34 token   '4'    35  token '5'     36  token  '6'     37 token '7'
       38 token   '8'    39  token '9'       0 token  <eol>
bnf: {digit}      
   '0'  | '1' | '2' |  '3' | '4' | '5' | '6' | '7' |  '8' | '9' ;bnf
bnf: <digit>       @token {digit} c, ;bnf
bnf: <number>      <digit> <number>    |    <digit> ;bnf

0 value (expression)
bnf: <element>     '(' (expression) execute  ')'
                |   <number> bl c, ;bnf
bnf: <primary>      '-'  <primary>  ," minus "
                |    <element> ;bnf
bnf: <factor>      <primary> '^' <factor>      ," power "
                |  <primary> ;bnf
bnf: <t'>      '*' <factor>     ," * "    <t'>
            |  '/' <factor>     ," / "    <t'>
            |  ;bnf
bnf: <term>     <factor> <t'>       ;bnf
bnf: <e'>      '+' <term>    ," + "   <e'>
            |  '-' <term>    ," - "   <e'>
            |  ;bnf
bnf: <expression>       <term> <e'> ;bnf
' <expression> to (expression)
: parse3    
   0bnf  here <expression> <eol>  /bnf
   cr matched if here over - dup negate allot type  else ." failed" then ;
decimal
[then]