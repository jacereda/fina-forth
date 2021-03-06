0
value dict0 ( -- a-addr )
\g Start of dictionary space

-1414673666
value dicttop  ( -- a-addr )
\g Holds upper dictionary limit

\ USER VARIABLES
\g User variable holding the signal handler for each task
user sighandler  ( -- a-addr )

\g User variable holding the throw frame pointer for each task
user throwframe  ( -- a-addr )

\ XXX could this be a normal var?
\ probably, under the restriction that no task will check it between PAUSEs
\g User variable holding decimal point location
user dpl  ( -- a-addr )

\g User variable holding a pointer to the stack origin
user sp0  ( -- a-addr )

\g User variable holding a pointer to the return stack origin
user rp0  ( -- a-addr )

\g User variable holding a pointer to the task name
user taskname ( -- a-addr )

\ SYSTEM VARIABLES

variable parsed ( -- a-addr )
\g Double variable holding last found word
0 ,

variable sourcevar ( -- a-addr )
\g Double variable holding input buffer string
0 ,

variable userp  ( -- a-addr )
\g User variables pointer

variable warnings  ( -- a-addr )
\g Holds flag to control printing of warnings

variable base  ( -- a-addr )
\g @see anscore

variable >in  ( -- a-addr )
\g @see anscore

\g @see anscore
variable span

variable state  ( -- a-addr )
\g @see anscore

variable hasname?  ( -- a-addr )
\g Contains true when the last definition has a name

\ SYSTEM VALUES
0
value get-current  ( -- wid )
\g @see anssearch

-1414673666
value memtop  ( -- a-addr )
\g Holds upper memory limit

0
value lastname  ( -- a-addr )
\g Pointer to NFA of last word

0
value lastxt  ( -- a-addr )
\g Pointer to XT of last word

-1414673666
value here  ( -- c-addr )
\g @see anscore

-1414673666
value source-id  ( -- 0 | -1 )
\g @see anscore

-1414673666
value pad  ( -- a-addr )
\g @see anscore

-1414673666
value tib  ( -- c-addr )
\g @see anscore

-1414673666
value hld0  ( -- c-addr )
\g Pointer to end of hold buffer

-1414673666
value hld  ( -- a-addr )
\g Pointer to numeric output string

0
value found  ( -- a-addr )
\g Result of lastest NFA search
\g @also nfa

useroffset
value lastuser ( -- n )
\g Offset of last user variable

0 , 0 ,
0
value forth-wordlist  ( -- a-addr )
\g @see anssearch


\ CONSTANTS
32
constant bl  ( -- char )
\g @see anscore

\ PRIMITIVES

\ arithmetic

\g Returns sum and carry of two unsigned numbers
prim um+ ( u1 u2 -- u3 1|0 )

\g @see anscore
prim and  ( x1 x2 -- x3 )

\g @see anscore
prim 2*  ( x1 -- x2 )

\g @see anscore
prim 2/  ( x1 -- x2 )

\g @see anscore
prim xor  ( x1 -- x2 )

\g @see anscore
prim or ( x1 -- x2 )

\ comparisons

\g @see anscore
prim 0<  ( n -- flag )

\g @see anscore
prim 0=  ( x -- flag )


\ i/o

\g Returns true if any key is pressed
prim rx?  ( -- flag )

\g Receive keyboard event
prim rx@  ( -- u )

\g Returns true if output device is ready
prim tx?  ( -- flag )

\g Send char to output device
prim tx!  ( u --)

\ stack

\g @see anscore
prim drop ( x -- )

\g @see anscore
prim dup ( x -- x x )

\g @see anscore
prim over ( x1 x2 -- x1 x2 x1 )

\g @see anscore
prim swap ( x1 x2 -- x2 x1 )

\g Fetch current return stack pointer
prim rp@ ( -- a-addr )

\g Set return stack pointer
prim rp! ( a-addr -- )

\g Fetch current data stack pointer
prim sp@ ( -- a-addr )

\g Set data stack pointer )
prim sp! ( a-addr -- )


\ memory

\g @see anscore
prim ! ( x a-addr -- )

\g @see anscore
prim @ ( a-addr -- x )

\g @see anscore
prim c! ( char c-addr -- )

\g @see anscore
prim c@ ( c-addr -- char )

\g @see anscore
prim move ( c-addr1 c-addr2 u -- )

\g Compare strings alphabetically, case-insensitive
prim isame? ( c-addr1 c-addr2 u -- -1|0|1 )

\g Compare strings alphabetically
prim same? ( c-addr1 c-addr2 u -- -1|0|1 )

\ misc

\g @see anscore
prim execute ( i*x xt -- j*x )

\g Return control to caller program
prim endtick ( -- )

\ @see anstools
prim bye ( -- )

\g If xt1 calls a runtime, return the address after the call and the xt of the runtime
prim ?dodefine ( xt1 -- xt1 0 | a xt2)

\g Compile call to xt1 and return xt of current word
prim xt, ( xt1 -- xt2 )

\g @see ansfacility
prim ms  ( u -- )

\g @see ansfacility
prim time&date ( -- +n1 +n2 +n3 +n4 +n5 +n6 )


\ compile-only primitives


\ Runtime for CREATE
prim docreate  ( -- a-addr )
compile-only


\g Runtime for LITERAL
prim dolit  ( -- x )
compile-only

\g Runtime for USER
prim douser  ( -- x )
compile-only

\g Runtime for VARIABLE
prim dovar  ( -- a-addr )
compile-only

\g Runtime for CONSTANT
prim doconst  ( -- x )
compile-only

\g Runtime for VALUE
prim dovalue  ( -- x )
compile-only


\g Runtime for processing colon lists
prim dolist  ( -- )
compile-only

\g Runtime for LOOP
prim doloop  ( r: n1 n2 -- n1 n3 )
compile-only

\g Runtime for +LOOP
prim do+loop  ( r: n1 n2 -- n1 n3 )
compile-only

\g Runtime for NEXT
prim donext  ( r: n1 -- n2 )
compile-only

\g Branch to inline address if flag is zero
prim 0branch  ( flag -- )
compile-only

\g Branch unconditionally to inline address
prim branch  ( -- )
compile-only

\g @see anscore
prim exit  ( -- )
compile-only

\g @see anscore
prim i  ( -- x )
compile-only

\g @see anscore
prim >r  ( x --  r: -- x )
compile-only

\g @see anscore
prim r>  ( -- x  r: x -- )
compile-only

\g @see anscore
prim r@  ( -- x  r: x -- x )
compile-only

\ Memory allocation
\g @see ansmemory
mprim allocate ( u -- a-addr throw )

\g @see ansmemory
mprim free  ( a-addr -- )

\g @see ansmemory
mprim resize  ( a-addr1 u -- a-addr2 )

\ Files

\g Open file
fprim openf  ( c-addr u1 u2 -- handle ior )

\g Close file
fprim closef  ( handle -- ior )

\g Read from file
fprim readf  ( c-addr u1 handle -- u2 ior )

\g Write to file
fprim writef  ( c-addr u1 handle -- u2 ior )

\g Map file in memory
fprim mmapf  ( handle -- a-addr )

\g Size of file
fprim sizef  ( handle -- ud )

\g Seek to file position
fprim seekf  ( ud handle -- ior )

\g Tell file position
fprim tellf  ( handle -- ud ior )

\g Read line from file
fprim linef  ( c-addr u1 handle -- u2 u3 ior )

\g Delete file
fprim deletef ( c-addr u -- ior )

\g File status
fprim statf ( c-addr u -- x ior )

\g Rename file
fprim renf  ( c-addr1 u1 c-addr2 u2 -- ior )

\g Resize file
fprim truncf  ( ud fileid -- ior )

\g Flush file
fprim flushf  ( fileid -- ior )

\g Convert 16.16 fixed point integer to float
fxprim fx>float

\g Convert float to 16.16 fixed point integer
fxprim float>fx

\g Convert 16.16 fixed point integer to double
fxprim fx>double

\g Convert double to 16.16 fixed point integer
fxprim double>fx

\g Prepare foreign function call
ffprim ffprep

\g Call to foreign function
ffprim ffcall

\g Prepare function closure
ffprim ffclos

ffprim ffvoid
ffprim ffint
ffprim fffloat
ffprim ffdouble
ffprim ffptr
ffprim ffint64

ffprim dlopen
ffprim dlsym

\g Number of arguments in command line
prim argc ( -- u )

\g Get command line argument
prim argv ( -- addr )

\g End of xt
prim xtend ( xt -- addr )

\g Do nothing
prim noop ( -- )


\ HOOKS

\g Print THROW error codes
defer .error  ( throwcode -- )

\g Set error source
defer .error!  ( throwcode -- throwcode )

\g Interpret input string
defer interpret  ( i*x -- j*x )

\g Called by accept to filter keys
defer keyhandler ( buf buflen char -- buf buflen char | 0 )

\g @see anscore
defer refill ( -- flag )

\ COLON DEFINITIONS

: cellshift sighandler throwframe - 2/ 2/ 2/ 2 + ;
\ 1 cells 2/ 2/ 2/ 2 + ;

: cellbits 8 cells ;

\g Throw code if flag is true
: ?throw
   and throw ;
\ swap 0<> and throw ;

\ I/O

\g Execute content of a
: @execute  ( a-addr -- i*x )
   @ execute ;

\g @see ansfacility
defer ekey?  ( -- flag )

\g @see ansfacility
defer ekey  ( -- u )

\g @see ansfacility
defer emit?  ( -- flag )

\g @see anscore
defer emit  ( char -- )

\g Display prompt
defer .prompt  ( -- )

\g @see anscore
: cr  ( -- )
   10 emit ;

\g @see anscore
: space  ( -- )
   32 emit ;

\g @see anscore
: spaces  ( n -- )
   0 max 0 ?do space loop ;

\ Stack

\g @see anscore
p: ?dup  ( x -- x x | 0 )
   dup if dup then ;

\g @see anscore
p: nip  ( x1 x2 -- x2 )
   swap drop ;

\g @see anscore
p: rot  ( x1 x2 x3 -- x2 x3 x1 )
   >r swap r> swap ;

\g @see anscore
p: 2drop  ( x1 x2 -- )
   drop drop ;

\g @see anscore
p: 2dup  ( x1 x2 -- x1 x2 x1 x2 )
   over over ;

\g @see anscore
p: 2swap  ( x1 x2 x3 x4 -- x3 x4 x1 x2 )
   rot >r rot r> ;

\g @see anscore
p: 2over  ( x1 x2 x3 x4 -- x1 x2 x3 x4 x1 x2 )
   >r >r 2dup r> r> 2swap ;

\g @see anscore
p: unloop  ( --  r: x1 x2 -- )
   r> r> r> 2drop >r ; compile-only

\g Drop top of return stack
p: rdrop  ( --  r: x -- )
   r> r> drop >r ; compile-only

\g Fetch from postincremented RTOS
: @r+  ( -- x  r: a-addr1 -- a-addr2 )
   r> r@ @ r> cell+ >r swap >r ; compile-only

\g Store to postincremented RTOS
: !r+  ( x --  r: a-addr1 -- a-addr2 )
   r> swap r@ ! r> cell+ >r >r ; compile-only

\ More stack

\g Current data stack values
: dstack ( -- current bottom)
   postpone sp@ postpone sp0 postpone @ ; immediate compile-only

\g Current return stack values
: rstack ( -- current bottom)
   postpone rp@ postpone rp0 postpone @ ; immediate compile-only

\g Stack depth
: sdepth ( bottom current -- +n)
   swap - cellshift arshift ;

\g @see anscore
: depth ( -- +n )
   dstack sdepth ;

: rdepth ( -- +n )
   rstack sdepth ;

\g @see anscore
p: pick ( xu ... x1 x0 u -- xu ... x1 x0 xu )
   depth dup 2 < -4 ?throw
   2 - over u< -4 ?throw
   1+ cells sp@ + @ ;

: rpick ( x_u ... x1 x0 u -- x_u ... x1 x0 x_u )
   rdepth dup 2 < -4 ?throw
   2 - over u< -4 ?throw
   1+ cells rp@ + @ ;

\g Print number as <number>, used in .s and .backtrace
: .depth ( u -- )
   0 <# [char] > hold #s [char] < hold #> type 3 spaces ;

\g @see anstools
: .s
   depth .depth
   depth dup 0 ?do dup pick . 1- loop drop cr ;

: .rs
   rdepth .depth
   rdepth 0 ?do i rpick . loop cr ;

\ Exception handling

\g @see ansexception
: throw  ( i*x n -- i*x | j*x n )
   ?dup if
      throwframe @ rp!
      r> throwframe !
      r> swap >r sp!
      drop r>
   then ;

\g @see ansexception
: catch  ( i*x xt -- j*x 0 | i*x n )
   sp@ >r throwframe @ >r
   rp@ throwframe !  execute
   r> throwframe !
   rdrop 0 ;

\ Arithmetic

\g @see anscore
p: +  ( n1|u1 n2|u2 -- n3|u3 )
   um+ drop ;

\g @see anscore
p: 1+  ( n1|u1 -- n2|u2 )
   1 + ;

\g @see anscore
p: 1-  ( n1|u1 -- n2|u2 )
   -1 + ;

\g @see anscore
p: invert  ( x1 -- x2 )
   -1 xor ;

\g @see anscore
p: negate  ( n1 -- n2 )
   invert 1+ ;

\g @see anscore
p: -  ( n1|u1 n2|u2 -- n3|u3 )
  negate + ;


\ Looping

\g @see anscore
p: j  ( -- n|u  r: n|u x1 x2 -- n|u x1 x2)
   rp@ 3 cells + @ ; compile-only

\ Comparisons
\g @see anscore
p: 0<>  ( x -- flag )
   0= 0= ;

\g @see anscore
p: <  ( n1 n2 -- flag )
   2dup xor 0< if  drop 0< exit  then - 0< ;

\g @see anscore
p: u<  ( u1 u2 -- flag )
   2dup xor 0< if  nip 0< exit  then - 0< ;

\g @see anscore
p: >  ( n1 n2 -- f )
   swap < ;

\g @see anscore
: u>  ( u1 u2 -- flag )
   swap u< ;

\g Returns true if u1 >= u2
: u>=  ( u1 u2 -- flag )
   u< 0= ;

\g @see anscore
p: =  ( x1 x2 -- flag )
   xor 0= ;

\g @see anscore
p: <>  ( x1 x2 -- f )
   = 0= ;

\g @see anscore
p: cell+  ( a-addr1 -- a-addr2 )
   1 cells + ;

\g Runtime for DO
p: dodo  ( x1 x2 --  r: x1 x2 )
   r> rot >r swap >r >r ; compile-only

\g Runtime for FOR
: dofor ( n1 --  r: -- n1 n1 )
   r> swap dup >r >r >r ; compile-only

\g Runtime for ?DO
: do?do ( n1 n2 --  r: -- n2 n1 )
   2dup = if 2drop r> dup @ cells + cell+ >r exit then
   r> rot >r swap >r cell+ >r ; compile-only


\ Arithmetic

\g @see anscore
p: abs  ( n -- u )
   dup 0< if  negate  then ;

\g @see anscore
p: lshift  ( x1 u -- x2 )
   0 ?do 2* loop ;

\g Shift n1 u bits right arithmetically
: arshift  ( n1 u -- n2 )
   0 ?do 2/ loop ;

\g @see anscore
p: rshift  ( x1 u -- x2 )
   >r r@ arshift 1 cellbits r> - lshift 1- and ;

\g @see anscore
p: max  ( n1 n2 -- n3 )
   2dup < if swap then drop ;

\g @see anscore
p: min  ( n1 n2 -- n3 )
   2dup > if swap then drop ;

\g Minimum of two unsigned values
: umin ( u1 u2 -- u3 )
   2dup u> if swap then drop ;

\g @see anscore
p: um*  ( u1 u2 -- ud )
   0 swap cellbits 1- for
      dup um+ >r >r dup um+ r> +
      r> if >r over um+ r> + then
   next rot drop ;

\g @see ansdouble
p: dnegate  ( d1 -- d2 )
   invert >r invert 1 um+ r> + ;

\g @see anscore
p: m*  ( n1 n2 -- d )
   2dup xor 0< >r abs swap abs um* r> if dnegate then ;

\g @see anscore
p: *  ( n1|u1 n2|u2 -- n3|u3 )
   um* drop ;

\g @see anscore
p: um/mod  ( ud1 u1 -- u2 u3 )
   negate cellbits 1- for
      >r dup um+ >r >r dup um+ r> + dup
      r> r@ swap >r um+ r> or
      if >r drop 1+ r> else drop then r>
   next drop swap ;

\g @see anscore
p: s>d  ( n1 -- d1 )
   dup 0< ;

\g @see anscore
p: within  ( n1|u1 n2|u2 n3|u3 -- flag )
   over - >r - r> u< ;

\g @see ansdouble
p: d+  ( d1 d2 -- d3 )
   >r swap >r um+ r> r> + + ;

\g From Comus. Add n2|u2 to n1|u1, giving the sum n3|u3
: under+  ( n1|u1 x n2|u2 -- n3|u3 x )
   rot + swap ;

\ Memory

\g @see anscore
p: char+  ( c-addr1 -- c-addr2 )
   1+ ;

\g Is address within dictionary space?
: dict?  ( c-addr -- flag )
   dict0 dicttop within ;

\g Check for dictionary overflow
: ?dict  ( -- )
   here dict? 0= -8 ?throw ;

\g @see anscore
p: cells  ( n1 -- n2 )
   cellshift lshift ;

\g Decrement by the size of a cell
p: cell-  ( a-addr1 -- a-addr2 )
   -1 cells + ;

\g @see anscore
p: 2!  ( x1 x2 a-addr -- )
   swap over ! cell+ ! ;

\g @see anscore
p: 2@  ( a-addr -- x1 x2 )
   dup cell+ @ swap @ ;

\g @see anscore
p: aligned  ( addr -- a-addr )
   1 cells 1- +  -1 cells and ;

\g @see anscore
: align  ( -- )
   here aligned to here ?dict ;

\g Rotate backwards top three items
: -rot  ( x1 x2 x3 -- x3 x2 x1 )
   rot rot ;

\g @see anscore
p: fill  ( c-addr u char -- )
   -rot 0 ?do 2dup c! char+ loop 2drop ;

\g @see anscore
p: count  ( c-addr1 -- c-addr2 u )
   dup char+ swap c@ ;

\g Convert word name to counted string
: namecount  ( c-addr1 -- c-addr2 u )
   count 31 and ;

\g Place string at c-addr2
: place  ( c-addr1 u c-addr2 -- )
   over 255 u>= -18 ?throw
   over >r rot over 1+ r> move c! ;

\g @see anscore
p: +!  ( x a-addr -- )
   dup @ under+ ! ;

\g @see anscore
: allot  ( n -- )
   here + to here ?dict ;

\g @see anscore
: ,  ( x -- )
   here !  1 cells allot ;

\g Store 0 at address
: off  ( a-addr -- )
   0 swap ! ;

\g Store -1 at address
: on  ( a-addr -- )
   -1 swap ! ;

\ Parsing

\g @see anscore
: source  ( -- c-addr u )
   sourcevar 2@ ;

\g @see ansstring
: /string  ( c-addr1 u1 n -- c-addr2 u2 )
   >r r@ under+ r> - ;

\g Returns unparsed input
: unparsed  ( -- c-addr u )
   source >in @ /string ;

\g Set start of unparsed input
: unparsed! ( c-addr -- )
   source -rot - umin >in ! ;

\g Scan string looking for char
: scan  ( c-addr1 u1 char -- c-addr2 u2 )
   >r  begin  dup while over c@ r@ xor while 1 /string repeat then  rdrop ;

\g Skip leading characters
: skip  ( c-addr1 u1 char -- c-addr2 u2 )
   >r  begin  dup while over c@ r@ = while 1 /string repeat then  rdrop ;

\g @see anscore
: parse  ( char "xxxc" -- c-addr u )
   >r unparsed over swap r> scan drop over - 2dup + 1+ unparsed! ;

 \g Parse input skipping leading delimiters
: skipparse ( char "cccxxxc" -- c-addr u )
   >r unparsed r@ skip drop unparsed! r> parse ;

\g Skip leading spaces and parse word
: parse-word  ( "  xxx " -- c-addr u )
   bl skipparse ;

\ Dictionary

\g Buffer holding the search order stack, first cell holds the depth
create #order ( -- a-addr )
0 ,
0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,

\g  Go from name to execution token
: name>xt  ( a-addr -- xt )
   namecount + aligned
   dup @ -559038737 = if cell+ @ then ;

\g Convert address/count to loop limits
: bounds  ( c-addr1 u -- c-addr2 c-addr3 )
   over + swap ;

: link? dup 0= swap dict? or ;

: name? ( xt addr -- flag)
   >r r@ name>xt = r@ cell- @ link? and
   r> namecount 0 scan nip 0= and ;

\g Get name for colon definition
: colname ( xt -- c-addr)
   dup ?dodefine nip unless drop 0 exit then
   dup -32 bounds do
      dup i name? if  drop i unloop exit  then
   -1 cells +loop
   drop 0 ;

\g Get name for primitive definition
: primname ( xt -- c-addr)
   >r xtof cold colname  begin cell- @ dup name>xt r@ = until rdrop ;

\g Apply xt to each word in wordlist
: forwordsin ( wid xt -- )
   0 to found
   >r cell+ begin
      cell- @ dup found 0= and
   while
      r@ execute
   repeat drop rdrop ;

\g Apply xt to each word in search order
: forwords ( xt -- )
   >r #order cell+ #order @ cells bounds ?do
      i @ j forwordsin found if leave then
   1 cells +loop rdrop ;

: match? ( c-addr -- c-addr )
   dup namecount parsed @ = if
      parsed 2@ isame? unless dup to found then
   else drop then ;

\g Find word in wordlist, sets PARSED, result also stored in FOUND
\g @also found
\g @also parsed
: nfain  ( a u wid -- nfa )
   >r parsed 2! r> xtof match? forwordsin found ;

\g Find word, sets PARSED, result also stored in FOUND
\g @also found
\g @also parsed
: nfa  ( a u -- nfa )
   parsed 2! xtof match? forwords found ;

\g Immediacy flag of word, 1 if word is immediate, -1 otherwise
: fimmed  ( nfa -- -1|1 )
   c@ [ immed ] literal and 0= 2* 1+ ;

\g Negated compile-only flag of word
: /fcompo  ( nfa -- flag )
   c@ [ compo ] literal and 0= ;

: 'nfa ( "  xxx" -- nfa )
   parse-word nfa dup 0= -13 ?throw ;

\g @see anscore
: '  ( "  xxx" -- xt )
   'nfa name>xt ;

\g @see anscore
: type  ( a u -- )
   bounds ?do i c@ emit loop ;

bcreate redefstr ," redefined "
\g Compile a header
: (head,)  ( c-addr u -- )
   ?dict
   dup 0= -16 ?throw
   dup 31 > -19 ?throw
   2dup get-current nfain
   if  warnings @ if redefstr count type 2dup type space then  then
   align  get-current @ ,
   here to lastname
   s, align ;

\g Parse input and compile header
: head,  ( " xxx" -- )
   parse-word (head,) ;

\ Numeric output

\g @see anscore
: hold   ( char -- )
    hld 1- to hld   hld c! ;

\g @see anscore
: <#   ( -- )
   hld0 to hld ;

\g @see anscore
: #  ( ud1 -- ud2 )
   0 base @ um/mod >r base @ um/mod swap
   9 over < [ char A char 9 1 + - ] literal and +
   [ char 0 ] literal + hold r> ;

\g @see anscore
: #s  ( ud -- 0 0 )
   begin # 2dup or 0= until ;

\g @see anscore
: #>  ( xd -- a-addr u )
   2drop hld hld0 over - 1chars/ ;

\g @see anscore
: sign  ( n -- )
   0< if [char] - hold then ;

\g Convert double number to string
: (d.)  ( d -- c-addr u )
   swap over  dup 0< if  dnegate  then   <# #s rot sign #> ;

\g @ansdouble
: d.  ( d -- )
   (d.) type space ;

\g @see anscore
: .  ( n -- )
   s>d d. ;

\ Interpreter

\g @see anscore
: [  ( -- )
   state off ; immediate compile-only

\g @see anscore
: ]  ( -- )
   state on ;


\g Handle printable character for ACCEPT. Upon return the top of the stack
\g will be 0 if there isn't enough room to hold char. Otherwise it will be
\g the original char.
: printable ( start count char -- start count char|0 )
   over span @ u>= and dup >r if
     over span @ + r@ swap c!  1 span +!
   then r> ;

\g @see anscore
: accept ( c-addr +n1 -- +n2 )
   2dup bl fill  span off
   begin ekey keyhandler 10 = until 2drop
   -1 span +! span @ ;

\g in-kernel refill implementation
: (refill)  ( -- flag )
   tib dup [ /tib ] literal accept sourcevar 2! >in off -1 ;

\g @see anscore
defer compile,  ( xt -- )

\g Compile inline xt into current colon def
: (compile)  ( -- )
   @r+ compile, ;

\g Extract inline xt
: xtof  ( -- xt )
   @r+ ; compile-only

\g Returns true for lower case characters
: lower?  ( char -- flag)
   [char] a [ char z 1+ ] literal within ;

\g Convert character to upper case
: toupper  ( char1 -- char2)
   dup lower? -32 and + ;

\g Convert character to digit
: digit  ( char -- u )
   toupper
   dup [ char 9 1+ ] literal [char] A within 128 and +
   dup [char] A u>= [ char A char 9 - 1- ] literal and -
   [char] 0 - ;

\g Is character a valid digit for current base?
: digit?  ( char -- flag )
   digit base @ u< ;

\g Accumulate u1 into ud1
: accum  ( ud1 u1 -- ud2 )
   swap base @ um* drop rot base @ um* d+ ;

\g @see anscore
: >number  ( ud1 c-addr1 u1 -- ud2 c-addr2 u2 )
   base @ >r
   begin
      over c@ [char] # = if
         2swap drop base ! 0 0 2swap 1 /string
      then
      over c@ digit? over and
   while
      >r >r r@ c@ digit accum r> r> 1 /string
   repeat
   r> base ! ;

\g Convert string to unsigned double number
: s>udnumber ( c-addr u -- ud )
   -1 dpl !
   0 0 2swap begin
      >number dup
   while
      over c@ [char] . <> -13 ?throw dup 1- dpl ! 1 /string
   repeat 2drop ;

\g Convert string to double number
: s>dnumber ( c-addr u -- d )
   over c@ [char] - = >r
   r@ negate /string
   s>udnumber r> if dnegate then ;

\g Convert string to unsigned number
: s>unumber ( c-addr u1 -- u2 | ud )
   s>udnumber dpl @ 0< if drop then ;

\g Convert string to number
: s>number ( c-addr u -- n | d )
   s>dnumber dpl @ 0< if drop then ;

\g @see anscore
: literal ( ct: x -- rt: -- x )
   postpone dolit , ; immediate compile-only

\g Runtime for 2LITERAL
: do2lit ( ct: xd --  rt: -- xd )
   @r+ @r+ ;

\g @see ansdouble
: 2literal ( ct: xd --  rt: -- xd )
   postpone do2lit swap , , ; immediate compile-only

\ process last found word
: doword ( nfa -- )
   dup /fcompo state @ or 0= -14 ?throw
   dup name>xt swap fimmed 0< state @ and if compile, else execute then ;

: donumber ( -- )
   parsed 2@ s>number state @ if
      dpl @ 0< if postpone literal else postpone 2literal then
   then ;

\g Interpret input string
: (interpret) ( i*x -- j*x )
   begin
      depth 0< -4 ?throw
      parse-word dup
   while
      nfa ?dup if  doword  else donumber then
   repeat 2drop ;

bcreate exstr ,"  exception # "

\g Print error
: .err  ( throwcode -- )
   parsed 2@ type exstr count type . cr ;

\g @see anscore
: quit  ( --  r: i*x -- )
   begin
      rp0 @ rp!  0 to source-id  postpone [  begin
         refill drop
         xtof interpret catch .error! ?dup 0=
      while
         state @ unless .prompt then
      repeat
      .error sp0 @ sp!
   again ;

\g @see anscore
: :noname ( -- xt colon-sys )
   hasname? off  ]
   here to lastxt
   xtof dolist xt, dup -1 ;

\g @see anscore
: : ( "<spaces>name" -- colon-sys )
   head, :noname rot drop   hasname? on ;

variable dummy1

\g Make last name visible in name searches
: linklast ( -- )
   lastname get-current ! ;

: reveal ( -- )
   hasname? @ if linklast then ;

\g @see anscore
: ; ( colon-sys -- )
   nip 1+ -22 ?throw
   reveal
   postpone exit  postpone [ ; immediate compile-only

\ Definers

\g Runtime for TO, store x at inline address
p: doto  ( x -- )
   @r+ [ /tcall ] literal + ! ; compile-only

\g @see anscore
: postpone ( "<spaces>name" -- )
   'nfa dup name>xt swap fimmed 0< if postpone (compile) , exit then
   compile, ; immediate compile-only

\ Strings

\g Compile string at HERE
: s, ( c-addr u -- )
   here over char+ allot place ;

: (is) @r+ ?dodefine drop cell+ ! ;

\ Initialization

\g Startup word
: cold ( -- )
   xtof dummy2 colname  to here
   xtof dict0
   begin cell- dup @ -17974594 = until  to dict0
   here [ /tdict ] literal +
   begin cell+ dup @ -892679478 = until  to memtop
   memtop cell-
   \ userp must be initialized before rp0 and sp0
   dup userp ! [ /user ]  literal cells -
   dup rp0 !   [ /rs ]    literal cells -
   dup sp0 !   [ /ds ]    literal cells -
   [ /pad ]   literal - dup to pad
   [ /tib ]   literal - dup to tib
   dup to hld0 [ /hld ]   literal -
   dup to dicttop
   drop
   10 base !
   xtof rx? (is) ekey?
   xtof rx@ (is) ekey
   xtof tx? (is) emit?
   xtof tx! (is) emit
   xtof printable (is) keyhandler
   xtof (interpret) (is) interpret
   xtof .err (is) .error
   xtof noop (is) .error!
   xtof , (is) compile,
   xtof noop (is) .prompt
   xtof (refill) (is) refill
   xtof forth-wordlist colname 3 cells - to forth-wordlist
   xtof cold colname forth-wordlist !
   forth-wordlist to get-current
   get-current 1 #order 2!
   sp0 @ sp!
   quit ;
variable dummy2
bye
