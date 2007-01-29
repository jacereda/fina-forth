TESTING FILES

decimal
0 value file
0 value fsize
{ -> }
{ char " parse esto no existe ni de conya" r/o open-file -> 0 -38 }
{ char " parse LICENSE" r/o open-file swap to file -> 0 }
{ file 0= -> 0 }
{ file file-size rot to fsize -> 0 0 }
{ fsize 0 > -> -1 }
{ 0 file-size -> -1 -1 -37 }
{ pad 80 file read-file -> 80 0 }
{ fsize 0 -40 -1 d+ file reposition-file -> 0 }
{ file file-position -> fsize 0 -40 -1 d+ 0 }
{ pad 41 file read-file -> 40 -39 }
{ pad 80 file read-line -> 0 0 0 }
{ file file-position -> fsize 0 0 }
{ 0 file-position -> -1 -1 -37 }
{ 0 0 file reposition-file -> 0 }
{ pad 20 file read-line -> 20 -1 0 }
{ pad 80 file read-line -> 25 -1 0 }
{ pad 80 file read-line -> 20 -1 0 }
{ pad 80 file read-line -> 0 -1 0 }
{ 0 close-file -> -37 }
{ file close-file -> 0 }
\ Can't detect this one, glibc aborts due to double free.
\ One approach would be to keep a table of open files.
\ { file close-file -> -37 } 
{ char " parse test/right.fs" ' included catch -> 0 }
{ char " parse test/error.fs" ' included catch nip nip -> -13 }
{ char " parse test/wrong.fs" ' included catch nip nip -> 42 }
{ char " parse test/wrongeval.fs" ' included catch nip nip -> 42 }
{ char " parse test/wronginclude.fs" ' included catch nip nip -> 42 }
{ char " parse test/wrongafterinclude.fs" ' included catch nip nip -> 42 }

