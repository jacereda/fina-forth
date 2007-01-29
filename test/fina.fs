\ This is the place for FINA regression tests

decimal
{ char " parse test/rightinclude.fs" included -> }
{ 55 55 3 ' um/mod catch nip nip nip 0 <> -> -1 }
\ { 16 _ ff -> 255 }
\ { :noname 16 _ ff ; execute -> 255 }
\ { 256. 16 based (d.) char " parse 100" compare -> 0 }
\ { :noname 256. 16 based (d.) ; execute char " parse 100" compare -> 0 }
