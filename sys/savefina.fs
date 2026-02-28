expose-module private
: .line type cr ;
: ftype ( path -- )
   r/o open-file throw >r
   r@ ['] .line foreachline
   r> close-file throw ;
: license
   s" share/doc/fina/LICENSE" >inst ftype ;
defer banner
:noname
   ." FINA v0.3-" buildstr type
   ." , Copyright (c) 2004-2010, Jorge Acereda Macia." cr
   ." FINA comes with EVEN LESS WARRANTY; for details type 'license'." cr
   ." Type 'bye' to exit." cr
; is banner

: doargs
   #args 1 ?do
      0
      i arg drop c@ [char] - = if
         i arg s" -e" compare unless  i swap >r 1+ arg evaluate  r> 2 +  then
         i arg s" -s" compare unless  ['] noop is banner 1+  then
         dup unless i arg type ."  ignored" cr 1+ then
      else i swap >r arg included r> 1+ then
   +loop ;

:noname
   deferred coldchain
   s" *cmdline*" errorname 2!
   ['] doargs catch .error
   banner quit ; is coldchain

:noname
   ." ok" cr ; is .prompt
echo on
export license
end-module
