.( opening) cr
char " parse handler.fs" r/o open .( opened) cr throw constant h
.( reading) cr
pad 256 h read throw drop
pad 256 dump
h close
