\g @see ansdouble 
: d=  ( d1 d2 -- flag )
    rot xor >r xor r> or 0= ;

\g @see ansdouble
: 2constant ( xd "name" -- )
   create , , does> 2@ ;

\g @see ansdouble
: 2variable ( xd "name" -- )
   create 0 , 0 , does> ;

\g @see ansdouble
: d- ( d1 d2 -- d3 )
   dnegate d+ ;

\g @see ansdouble
: d< ( d1 d2 -- flag )
   rot 2dup > >r = >r u< r> and r> or ;

\g @see ansdouble
: d0< ( d -- flag )
   nip 0< ;

\g @see ansdouble
: d0=  ( d -- flag )
   or 0= ;

\g @see ansdouble
: d2*  ( d1 -- d2 )
   2dup d+ ;

\g @see ansdouble
: d2/  ( d1 -- d2 )
   swap 1 rshift over 1 and [ 1 cells 8 * 1- ] literal lshift or swap 2/ ;

\g @see ansdouble
: d>s  ( d -- u )
   drop ; 

\g Discard second pair
: 2nip  ( x1 x2 x3 x4 -- x3 x4 )
   >r nip nip r> ;

\g @see ansdouble
: dmax  ( d1 d2 -- d3 )
   2over 2over d< if 2nip else 2drop then ;

\g @see ansdouble
: dmin  ( d1 d2 -- d3 )
   2over 2over d< if 2drop else 2nip then ;

\g @see ansdouble
: dabs  ( d1 -- d2 )
   dup 0< if dnegate then ;
\   2dup dnegate dmax ;

\g @see ansdouble
: m+  ( d1 n1 -- d2 )
   s>d d+ ;

\g @see ansdouble
\ : m*/
\   >r s>d >r abs -rot
\   s>d r> xor r> swap >r >r dabs rot tuck um* 2swap um*
\   swap >r 0 d+ r> -rot r@ um/mod -rot r> um/mod nip swap
\   r> if dnegate then ;

\g Invert pair
: 2invert ( x1 x2 -- x3 x4 )
   invert >r invert r> ;

\g Increment double number
: d1+  ( d1 -- d2 )
   >r 1+ dup 0= negate r> + ;

\g Invert triple
: 3invert  ( x1 x2 x3 -- x4 x5 x6 )
   invert >r 2invert r> ;

\g Increment triple number
: t1+ ( t1 -- t2 )
   >r d1+ 2dup d0= negate r> + ;

\g Negate triple number
: tnegate ( t1 -- t2 )
   3invert t1+ ;

\g Absolute value of a triple number
: tabs ( t1 -- t2 )
   dup 0< if tnegate then ;

\g Multiply unsigned double by unsigned giving a unsigned triple number
: ud*u  ( ud u -- ut )
   tuck um* 2swap um* swap >r 0 d+ r> -rot ;  

\g Multiply double by signed giving a triple number 
: d*n  ( d n -- t )
   2dup xor 0< >r abs >r dabs r> ud*u r> if tnegate then ;

\g Divide unsigned triple by unsigned giving a unsigned double number
: ut/u  ( ut u -- ud )
   dup >r um/mod -rot r> um/mod nip swap ;

\g Divide triple by signed giving a double number
: t/n  ( t n -- d )
   2dup xor 0< >r abs >r tabs r> ut/u r> if dnegate then ;

\g @see ansdouble
: m*/  ( d1 n1 +n2 -- d2 )
    >r d*n  r> t/n ;

env: double true ;env
