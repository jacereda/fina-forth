\ FINA multitasker
\ Inspired by the work of Bill Muench and Wonyong Koh

\ XXX Should we have a per-task HERE?


require assert.fs

: hex. base @ >r hex . r> base ! ;

: user ( "<spaces>name" -- ) 
   nesting?  head, ['] douser xt, drop
   lastuser ,  
   lastuser -1 cells + to lastuser
   linklast ;

: ego userp @ ;

\g User variable holding a pointer to current task status routine
user status ( -- a-addr )

\g User variable holding a pointer to next task's user pointer
user follower  ( -- a-addr )

\g User variable holding the stack pointer for each sleeping task
user stacktop  ( -- a-addr )

\   's          ( tid "uservar" -- a-addr )
\               Index another task's USER variable

\g Obtain user offset for a given variable name
: 's-offset  ( "uvarname" -- n )
   ' execute ego - assert0( dup -1024 1 within ) ; immediate

\g Obtain the address of a user variable in another task
: 's  ( tid "uvarname" -- a-addr )
   postpone 's-offset state @ if
      postpone literal postpone +
   else + then ; immediate

\g Apply xt to each task in list. xt is ( tid -- tid )
: foreachtask ( xt -- )
   >r ego begin
      r@ execute
      's follower @ dup ego =
   until rdrop drop ;

: ?prevtask ( stid tid -- stid tid )
   over over 's follower @ = if dup to found then ;
: prevtask ( tid -- tid' )
   0 to found
   ['] ?prevtask foreachtask
   drop found ;

hex
assert( : built ( tid -- ) 's follower @ 33333333 <> ; )
assert( : active ( tid -- ) 's follower @  ; )
decimal


\g Stop current task and transfer control to the task of which
\g 'status' USER variable is stored in 'follower' USER variable
\g of current task.
: pause  ( -- )
   rp@  \ This item will be consumed by READY
   sp@ stacktop !  follower @ follower @ 's status >r ; compile-only  

: resume
   postpone rdrop postpone userp postpone ! ; immediate compile-only

\g Status for sleeping tasks
: sleeping
   resume pause ;

\g Status for stopped tasks
: stopped
   resume pause ;

\g Status for ready tasks
: ready
   resume stacktop @ sp! rp! ; compile-only 

\g Status for starting tasks
: starting
   resume sp0 @ sp! rp0 @ rp! ['] ready status ! ;

\g Stop current task
: stop  ( -- )
   ['] stopped status ! pause ; 

\g Set sleeping state for given task
: sleep ( tid -- )
   ['] sleeping swap 's status ! ; 

\g Set ready state for given task
: awake  ( tid -- )
    ['] ready swap 's status ! ;

\g Kill given task
: kill ( tid -- )
   >r
   assert( r@ built )
   assert( r@ active )
   assert( r@ 's follower follower <> ) \ suicide not allowed
   r@ prevtask r@ 's follower @ swap 's follower ! 
   r@ 's follower off
   assert( r@ active 0= )
   assert( r@ built )
   rdrop ;

: ,allot ( size fill -- )
   >r here over allot swap r> fill align ;

\g Create a new task.
: task: ( user_size ds_size rs_size "<spaces>name" --  rt: -- tid )
   [ hex ]
   create here 0 , >r 
   033 ,allot here cell- dup r> ! >r
   0AA ,allot here cell- r@ 's rp0 !
   055 ,allot here cell- r@ 's sp0 !
   [ decimal ]
   lastname r> 's taskname ! 
   does> @ ;

\  system:follower/ego  newtask:follower/ego
\g Initialize and link task 
: build ( tid -- )
   assert( dup built 0= )
   follower @ over 's follower !  dup follower !  sleep ;

\g Activate the task identified by tid. ACTIVATE must be used
\g only in definition. The code following ACTIVATE must not
\g EXIT. In other words it must be infinite loop like QUIT.
: activate ( tid -- )
   assert( dup built )
   r> over 's rp0 @ ! \ set entry point
   ['] starting swap 's status ! ;

\ Initializations for system task
' ready status !
ego follower !
ego constant system
lastname taskname !

\ Pause when no key ready
:noname
   ekey? 0= if begin pause ekey? until then [ 'ekey @ compile, ] ;  'ekey !

\g Display task information
: .task ( tid -- tid )
   dup 's taskname @ .name ." at " dup hex.
   dup 's status @ xt>name .name cr ;

\g Display tasks list
: .tasks
   cr ['] .task foreachtask ;

0 [if]
64 64 64 task: mierda1
64 64 64 task: mierda2
64 64 64 task: mierda3
64 64 64 task: mierda4

mierda1 build 
mierda2 build 
mierda3 build 
mierda4 build
hex
:noname mierda1 activate 4 0 do i . pause loop stop ; execute
:noname mierda2 activate 0 begin 1+ dup . pause again ; execute
:noname mierda3 activate 0 begin 1+ dup . pause again ; execute
:noname mierda4 activate 0 begin 1+ dup . pause again ; execute
.tasks 
:noname pause ; execute
mierda3 sleep
mierda4 kill
.tasks
:noname 5 0 do .tasks pause loop cr ; execute
[then]
