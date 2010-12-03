library libc c
create 0buffer 1024 allot \ MUST be at least PATH_MAX chars
: 0term 0buffer place 0 0buffer count + c! 0buffer 1+ ;
: 0count 0 over begin dup c@ while 1 under+ 1+ repeat drop ;
: 0s, 1+ s, 0 here 1- c! ;
: 0sliteral postpone dos" 0s, align postpone drop ; immediate compile-only
: 0s"
   [char] " parse state @ if 
      postpone 0sliteral 
   else  0term  then ; immediate 