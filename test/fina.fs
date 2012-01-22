\ This is the place for FINA regression tests

decimal
{ char " parse test/rightinclude.fs" included -> }
{ 55 55 3 ' um/mod catch nip nip nip 0 <> -> -1 }
{ :noname 256. 16 based (d.) ; execute char " parse 100" compare -> 0 }

{
1 [if]
42
0 [if]
0 [if]
1 2 3
[else]
4 5 6
[then]
[then]
[then]
 -> 42 }
