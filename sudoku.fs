\ Brute-force sudoku solver

: cell- 1 cells - ;
0 value start
0 value end
create colbuf 9 cells allot
create rowbuf 9 cells allot
create blkbuf 9 cells allot
: wipe ( addr -- , erase buffer) 
   9 cells erase ;
: row ( index -- row , row for index)
   9 / ;
: col ( index -- col , col for index)
   9 mod ;
: blk ( index -- blk , blk for index)
   dup row 3 / 3 * swap col 3 / + ;
: inc ( val index buf -- , accumulate value at index in buffer)
   >r >r dup if 1 swap 2* lshift then r> cells r> + +! ;
: markrow ( val index -- , mark value in row)
   row rowbuf inc ;
: markcol ( val index -- , mark value in col)
   col colbuf inc ;
: markblk ( val index -- , mark value in blk)
   blk blkbuf inc ;
: elem ( index -- val , element at index)
   cells start + @ ;
: mark ( val index -- , mark value in buffers)
   2dup markrow 2dup markcol markblk ;
: valid ( buf -- flag, check for valid combination in buffer)
   0 swap 8 cells bounds do 
      i @ [ hex ] AAAAAAAA [ decimal ] and + 
   loop 0= ;
: validate ( -- ok?, check for valid combination)
   colbuf wipe rowbuf wipe blkbuf wipe
   81 0 do i elem i mark loop
   colbuf valid rowbuf valid and blkbuf valid and ;
: back ( addr|0 -- addr|0 )
   dup if cell- then ;
: nomore ( addr|0 -- flag )
   dup if dup @ 9 = else 1 then ;
: (solve) ( addr -- addr|0 )
   dup end = if drop 0 exit then
   validate 0= if exit then
   dup @ if \ Found a fixed number, skip it
         cell+ recurse back
   else \ Found a free number, try all the possibilities
         begin  1 over +! cell+ recurse back nomore until
         dup if dup off then
   then ;
: .sudoku ( addr -- , print board)
   to start
   81 0 do i elem . i col 8 = if cr then loop cr ;
: solve ( addr -- , solve sudoku)
   to start  start 81 cells + to end  start (solve) drop
   cr validate if start .sudoku else ." No solution" then ;

create sudoku1
  1 , 0 , 0 , 8 , 0 , 4 , 0 , 0 , 0 , 
  0 , 2 , 0 , 0 , 0 , 0 , 4 , 5 , 6 , 
  0 , 0 , 3 , 2 , 0 , 5 , 0 , 0 , 0 , 
  0 , 0 , 0 , 4 , 0 , 0 , 8 , 0 , 5 , 
  7 , 8 , 9 , 0 , 5 , 0 , 0 , 0 , 0 , 
  0 , 0 , 0 , 0 , 0 , 6 , 2 , 0 , 3 , 
  8 , 0 , 1 , 0 , 0 , 0 , 7 , 0 , 0 , 
  0 , 0 , 0 , 1 , 2 , 3 , 0 , 8 , 0 , 
  2 , 0 , 5 , 0 , 0 , 0 , 0 , 0 , 9 , 

sudoku1 .sudoku .( Solution: ) sudoku1 solve 
