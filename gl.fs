library GL GL
hex

8892 constant GL_ARRAY_BUFFER
8893 constant GL_ELEMENT_ARRAY_BUFFER
88E4 constant GL_STATIC_DRAW
88B9 constant GL_WRITE_ONLY


cconstant GL_TRUE
cconstant GL_COLOR_BUFFER_BIT
cconstant GL_DEPTH_BUFFER_BIT
cconstant GL_TRIANGLES
cconstant GL_POLYGON
cconstant GL_SMOOTH
cconstant GL_PROJECTION
cconstant GL_MODELVIEW
cconstant GL_DEPTH_TEST
cconstant GL_LIGHTING
cconstant GL_LIGHT0
cconstant GL_FLOAT

decimal

GL glGetError (int) glGetError

GL glShadeModel int (void) glShadeModel
GL glMatrixMode int (void) glMatrixMode
GL glClearColor sf sf sf sf (void) glClearColor

GL glColor4uiv ptr (void) glColor4uiv
GL glVertexPointer int int int ptr (void) glVertexPointer
GL glEnable int (void) glEnable
GL glViewport int int int int  (void) glViewport
GL glClear int  (void) glClear
GL glLoadIdentity (void) glLoadIdentity
GL glBegin int (void) glBegin
GL glEnd (void) glEnd
GL glFlush (void) glFlush
GL glVertex3iv ptr (void) glVertex3iv
GL glVertex2f sf sf (void) glVertex2f
GL glTranslatef sf sf sf (void) glTranslatef

GL glOrtho df df df df df df (void) glOrtho

GL glUseProgram int (void) glUseProgram

GL glGenBuffers int ptr (void) glGenBuffers
GL glMapBuffer int int (ptr) glMapBuffer
GL glUnmapBuffer int (int) glUnmapBuffer
GL glBindBuffer int int (void) glBindBuffer
GL glBufferData int int ptr int (void) glBufferData
