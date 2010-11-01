: /dict memtop dict0 - ;
: call# /dict + cell+ ;
: profarea dict0 call# ;
: 0prof profarea /dict erase ;
: .call# ( xt -- )
   dup call# ? 
   xt>name ?dup if .name else ." noname" then cr ;
: .calls
   here aligned dict0 do
      i call# @ if i .call# then
   1 cells +loop ;
