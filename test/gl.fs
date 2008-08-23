require test/aw.fs
require gl.fs

: i>fx 65536 * ;
: i>sf i>fx fx>float ;
: i>df i>fx fx>double ;

1 i>sf constant sf1
-1 i>sf constant -sf1

1 i>df 2constant df1
-1 i>df 2constant -df1

: square ( size -- )
  >r GL_POLYGON glBegin
      r@ negate r@ negate glVertex2f
      r@ negate r@ glVertex2f
      r@ r@  glVertex2f
      r@ r@ negate glVertex2f
  glEnd rdrop ;
      
: <int> bl parse s>number , ;

: color: create <int> <int> <int> <int> does> glColor4uiv ;

color: fg -1  -1  0  0

:noname
    sf1 0 0 sf1 glClearColor
    GL_COLOR_BUFFER_BIT GL_DEPTH_BUFFER_BIT or glClear
   -df1 df1 -df1 df1 -df1 df1 glOrtho
   fg 30000 fx>float square
; is draw

:noname
   >r 0 0 r> 2@ swap glViewport
; is resize
