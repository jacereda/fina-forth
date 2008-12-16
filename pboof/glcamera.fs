camera extend
: perspective projection
   glLoadIdentity fovy @  aspect @  near @  far @  gluPerspective ;
: apply
   glLoadIdentity  perspective  loc -apply ?err ;
extended
