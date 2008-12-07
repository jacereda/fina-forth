: .err gluErrorString 0count type cr ;
: ?err glGetError ?dup if .err -1 abort" GL error" then ;
: projection GL_PROJECTION glMatrixMode later GL_MODELVIEW glMatrixMode ;
