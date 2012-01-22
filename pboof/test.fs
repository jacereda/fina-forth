include fixed.fs
include ns.fs
include units.fs
include pboof.fs
world extend

include cce.fs
include gl.fs
include glu.fs
include glhelpers.fs

include pboof/vector2.fs
include pboof/vector3.fs
include pboof/position.fs
include pboof/glposition.fs
include pboof/axisangle.fs
include pboof/glaxisangle.fs
include pboof/location.fs
include pboof/gllocation.fs
include pboof/color3.fs
include pboof/color4.fs
include pboof/glcolor4.fs
include pboof/rect.fs
include pboof/viewport.fs
include pboof/glviewport.fs
include pboof/string.fs
include pboof/task.fs
include pboof/window.fs
include pboof/glwindow.fs
include pboof/windowtask.fs
include pboof/camera.fs
include pboof/glcamera.fs

window open 
window push
include pboof/glbuffer.fs
include pboof/glvbuffer.fs
window pop

base c@ [if]
: h, dup c, 8 rshift c, ;
[else]
: h, dup 8 rshift c, dup c, ;
[then]

window push
vbuffer bind 
vbuffer data 
vbuffer map 
vbuffer blob
0 h, 0 h, 0 h,
1 h, 0 h, 0 h,
1 h, 1 h, 0 h,
vbuffer /blob 2constant v
vbuffer unmap
window pop

color4 clone fg  fx# 1 fx# 0 fx# 1 fx# 1 fg pack

:noname 
   camera apply
   location apply
   fg apply
   vbuffer bind vbuffer data
   GL_VERTEX_ARRAY glEnableClientState ?err
   3 GL_SHORT 0 0 glVertexPointer ?err
   GL_TRIANGLES 0 3 glDrawArrays ?err
; window scene !

extended
