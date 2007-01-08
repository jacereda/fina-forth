\ C Constants Extractor

\ Copyright (c) 2004 Jorge Acereda Maciá <jacereda@users.sourceforge.net>
\
\ Permission is hereby granted, free of charge, to any person obtaining
\ a copy of this software and associated documentation files (the
\ "Software"), to deal in the Software without restriction, including
\ without limitation the rights to use, copy, modify, merge, publish,
\ distribute, sublicense, and/or sell copies of the Software, and to
\ permit persons to whom the Software is furnished to do so, subject to
\ the following conditions:
\ 
\ The above copyright notice and this permission notice shall be
\ included in all copies or substantial portions of the Software.
\ 
\ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
\ EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
\ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
\ NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
\ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
\ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
\ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require sh.fs
include cce.cache

char " parse cce.cache" r/w open-file throw constant cache
cache file-size throw   cache reposition-file throw

: c+!  ( n addr -- )  dup >r  c@ +  r> c! ;

: append ( str len addr -- )
    assert( 2dup count nip + 256 < )
    2dup 2>r  count chars +  swap chars move 2r> c+! ;

create inp 256 allot
create cbuf 256 allot
create res 256 allot

: cexpr ( addr len -- addr' len', result in cbuf)
   ." compiling..."
   s" ./cce " cbuf place   cbuf append   cbuf count
   r/o open-pipe throw >r
   cbuf 256 r@ read-line throw drop
   r> close-pipe throw drop
   cbuf swap
   ." done" cr ;

: cconstant ( "name" -- )
   bl parse inp place
   inp find nip 0= if
      inp count cexpr res place
      s"  constant "  res append
      inp count res append
      res count evaluate
      newline res append
      res count cache write-file throw
   then ;

0 [if]
cconstant GLUT_API_VERSION
.( GLUT_API_VERSION: ) GLUT_API_VERSION . cr
cconstant GL_ONE
.( GL_ONE: ) GL_ONE . cr
[then]
