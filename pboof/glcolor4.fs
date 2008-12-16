color4 extend
: clear 
   unpack glClearColor 
   GL_COLOR_BUFFER_BIT GL_DEPTH_BUFFER_BIT or glClear ?err ;
: apply
   unpack glColor4f ?err ;
extended
