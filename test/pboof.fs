\ require test/tester.fs
\ : {{ { ;
\ : }} } ;
: {{ ;
: }} 2drop ;
: -> ;
require copboof.fs

osize value lastosize
: increased osize lastosize over to lastosize - ;

{{ osize -> 6 cells }}
{{ increased -> 0 cells }}

object { clone v2 }
{{ increased -> 3 cells }}
v2 { extend  
1 cells member x  x off
1 cells member y  y off
: print print .attr x .attr y ;
extended }
{{ increased -> 2 cells }}
v2 { print } cr

v2 { clone v3 }
{{ increased -> 5 cells }} 
v3 { extend
1 cells member z  z off
: print print .attr z ;
extended }
{{ increased -> 1 cells }}

v3 { print } cr

object { clone rect }
{{ increased -> 3 cells }}
rect { extend
v2 { instance pos }
v2 { instance dim }
dim { 100 x !  200 y ! }
: print print pos { print } dim { print } ;
extended }

{{ increased -> 10 cells }}

object { clone window }
{{ increased -> 3 cells }}
window { extend
rect { instance inner } inner { dim { 300 x ! } }
rect { instance outer } outer { dim { 400 y ! } }
: print inner { print } outer { print } ;
extended }
{{ increased -> 26 cells }}

{{ rect { pos { x } } window { inner { pos { x } } } = -> false }}

rect { print } cr

