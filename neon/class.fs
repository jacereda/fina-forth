\ Object-oriented extensions from Yerk/Mops
\ Version 1.0, 4 Feb 1997
\ Andrew McKewan
\ mckewan@austin.finnigan.com

DECIMAL

\ =====================================================================
\ Misc words. You may already have some of these.

: HAVE  ( -- f )  BL WORD FIND NIP ;

1 CELLS CONSTANT CELL
: C+!  ( char addr -- )   DUP C@  ROT +  SWAP C! ;

: RESERVE  ( n -- )  HERE OVER ERASE ALLOT ;

\ Build link to list head at addr
: LINK  ( addr -- )   HERE  OVER @ ,  SWAP ! ;

: NOOP ;

: BOUNDS  ( a n -- limit index )  OVER + SWAP ;

HAVE PARSE 0= [IF]
: PARSE  ( -- addr len )  BL WORD COUNT ;
[THEN]


\ =====================================================================
\ Class Structure.

0 VALUE ^Class          \ pointer to class being defined
0 VALUE newObject       \ object being created
0 VALUE (ClassInit:)    \ selector for ClassInit: message

\ The following offsets refer to the ^Class, or Pfa of the class.
\ The first 8 cells are the hashed method dictionary.

: IFA    8 CELLS + ;    \ ivar dict Latest field
: DFA    9 CELLS + ;    \ datalen of named ivars
: XFA   10 CELLS + ;    \ width of indexed area, <= 0 if not indexed
: SFA   11 CELLS + ;    \ superclass ptr field
: TAG   12 CELLS + ;    \ class tag field

13 CELLS CONSTANT classSize             \ size of class pfa

CREATE classTag         \ contents of tag field for valid class

: ?isClass  ( pfa -- f )  \ is this a valid class?
        TAG @ classTag = ;

: ?isObj  ( pfa -- )  \ is this a valid object?
        @ DUP IF ?isClass THEN ;

: classAllot  ( n -- )  \ Allot space in the current class
        ^Class DFA +! ;

: classAlign  ( -- )  \ Align class data size (optional)
        ^Class DFA @  ALIGNED  ^Class DFA ! ;

: @width  ( ^class -- elWidth )  \ return the indexed element width for a class
        XFA @  0 MAX ;

\ Error if not compiling a new class definition
: ?Class   ^Class   0= ABORT" Not inside a class definition" ;


\ =====================================================================
\ Objects have a pointer to their class stored in the first cell of
\ their pfa. When they execute, they return the address of the cell
\ following the class pointer, which is location of the first named
\ instance variable.
\
\ Object structure:     | ^class | named ivars |
\
\ If an object is indexed, an indexed header appears after the data area.
\ This header consists of a cell containing the number of elements.
\ The indexed data follows this header.
\
\ Indexed object:       | ^class | named ivars | #elems | indexed ivars |
\ =====================================================================

: (Obj)  ( -- )  CREATE  DOES> CELL+ ;


: >obj  ( xt -- ^obj )  \ get the object address from the execution token
        >BODY CELL+ ;

: >class  ( ^obj -- ^class )  \ get the class of an object
        CELL - @ ;


\ =====================================================================
\ Methods are stored in an 8-way linked-list from the MFA field.
\ Each method is identified by a 32-bit selector which is the parameter
\ field of the selector. Offsets are in cells.
\
\ Method Structure:
\       0   link to next method
\       1   selector
\       2   method execution token (called mcfa below)
\
\ =====================================================================

\ Find the top of the method link for a given selector.
\ The "2/ 2/" below is to get a better distribution if the selectors
\ are aligned values.
: MFA  ( SelID ^Class -- SelID MFA )
        OVER 2/ 2/ 7 AND CELLS + ;

\ Search through a linked-list of methods for the given selector.
: ((FINDM))  ( SelID MFA -- mcfa true | false )
        BEGIN   @ DUP
        WHILE   2DUP CELL+ @ = IF  2 CELLS + ( mfca )  NIP TRUE  EXIT THEN
        REPEAT  NIP ;

: (FINDM)   ( SelID ^Class -- xt )      \ find method in a class
        MFA ((FINDM)) IF  @ EXIT  THEN
        TRUE ABORT" Message not understood by class" ;

: FIND-METHOD   ( SelID ^obj -- ^obj xt )   \ find method in object's class
        TUCK >class (FINDM) ;


\ =====================================================================
\ Method execution. The current object address is store in the value ^base.
\ The object is only valid inside of a method definition. When we call a
\ method, we save the old object pointer and set it to the current object.
\ When the method returns, we restore the object pointer.

0 VALUE ^base           \ pointer to current object

: EXECUTE-METHOD  ( ^obj xt -- )        \ execute method, saving object pointer
        ^base >R   SWAP TO ^base   EXECUTE   R> TO ^base ;

: EXECUTE-IVAR  ( xt offset -- )        \ execute ivar method at given offset
        ^base >R  ^base + TO ^base  EXECUTE  R> TO ^base ;


\ Wrap catch so that it preserves the current object
HAVE CATCH [IF]
: CATCH  ( -- n )  ^base >R   CATCH   R> TO ^base ;
[THEN]


\ =====================================================================
\ For late-bound method calls, we compile code to look up the method
\ at runtime and execute it. The syntax is:
\
\       Selector: [ object ]
\
\ The code between [ and ] must return an object reference. If the method
\ is not found in the class of the object, a runtime error occurs.
\ Because we use PARSE, [ and ] must be on the save source line.
\ =====================================================================

: (Defer)  ( ^obj SelId -- )  OVER >class (FINDM) EXECUTE-METHOD ;
: Defer,   ( SelId -- )  POSTPONE LITERAL  POSTPONE (Defer) ;

: Defered  ( SelId -- )         \ Compile or execute a defered message send
        >R  [CHAR] ] PARSE  EVALUATE  R>
        STATE @ IF  Defer,  ELSE  (Defer)  THEN ;

\ True if string is "[" to start defered message send
: ?isParen  ( str -- f )   1+ C@ [CHAR] [ = ;


\ =====================================================================
\ Hash function for instance variable names. The "32 OR" is for
\ case-insensitive names. The compiler will warn you if you have
\ a hash collision.

: HASH  ( addr len -- n )       
        TUCK BOUNDS ?DO  5 LSHIFT  I C@ 32 OR XOR  LOOP
        DUP 0< IF EXIT THEN  INVERT ;

: hash>  ( -- n )  BL WORD COUNT HASH ;


\ =====================================================================
\ Instance variable consists of five cell-sized fields. The fifth field
\ is used for indexed ivars only. Offsets are in cells.
\ 
\     Offset   Name      Description
\     ------   ----      ---------------------------------------
\        0     link      points to link of next ivar in chain
\        1     name      32-bit hash value of name
\        2     class     pointer to class
\        3     offset    offset in object to start of ivar data
\        4     #elem     number of elements (indexed ivars only)
\ 
\ In the stack diagrams, "ivar" refers to the starting address of this
\ structure.  The IFA field of a class points to the first ivar.
\ =====================================================================

: iclass     ( ivar -- 'class )   2 CELLS +   ;
: @IvarOffs  ( ivar -- offset )   3 CELLS + @ ;
: @IvarElems ( ivar -- #elems )   4 CELLS + @ ;


\ =====================================================================
\ Build SUPER and SELF pseudo ivars. These are always the last
\ two ivars in a class. When we define a class, we will patch the
\ class fields to the appropriate class and superclass.

CREATE ^Self
        0 ,             \ link
        hash> self ,    \ name
        0 ,             \ class
        0 ,             \ offset

CREATE ^Super
        ^Self ,         \ link
        hash> super ,   \ name
        0 ,             \ class
        0 ,             \ offset


\ Create a dummy class that "object" inherits from.

CREATE Meta     classSize RESERVE

^Super   Meta IFA !     \ latest ivar
classTag Meta TAG !     \ class tag


\ =====================================================================
\ Determine if next word is an instance var.
\ Return pointer to class field in ivar structure.

: vFind  ( str -- str false | ^iclass true )
        ^Class
        IF      DUP COUNT HASH ^Class IFA ((FINDM))
                DUP IF  ROT DROP  THEN
        ELSE    FALSE
        THEN ;

\ send ClassInit: message to ivar on stack
: InitIvar  ( ivar offset -- )
        OVER @IvarOffs + newObject +   ( ivar addr )
        (ClassInit:) ROT iclass @ (FINDM) EXECUTE-METHOD ;

: ClassInit  ( -- )  \ send ClassInit: to newObject
        newObject (ClassInit:)
        newObject >class (FINDM) EXECUTE-METHOD ;


\ =====================================================================
\ ITRAV traverses the tree of nested ivar definitions in a class,
\ building necessary class pointers and indexed area headers.

: ITRAV   ( ivar offset -- )  >R  ( ivar -- )
        BEGIN   DUP ^Super <>
        WHILE   DUP iclass @ IFA @
                OVER @IvarOffs R@ + RECURSE  ( initialize ivar's ivars )

                DUP iclass @  ( get ivar class )
                DUP XFA @  ( needs class pointer? )
                IF      OVER @IvarOffs R@ + newObject +
                        ( ivar ^Class ivarAddr -- )
                        2DUP CELL - !                   \ store class pointer
                        OVER @width  ( indexed? )
                        IF      SWAP DFA @ +            \ addr of indexed area
                                OVER @IvarElems         \ #elems
                                SWAP !                  \ upper array limit
                        ELSE    2DROP
                        THEN
                ELSE    DROP
                THEN
                DUP R@ InitIvar         \ send ClassInit:
                @                       \ next ivar in chain
        REPEAT  R> 2DROP ;


\ =====================================================================
\ Compile an instance variable dictionary entry.

: <Var  ( #elems ^Class | ^Class -- )
        BL WORD vFind ABORT" Duplicate instance variable"
        COUNT HASH                              \ get hash value of name
        ALIGN ^Class IFA LINK ,                 \ link & name
        DUP ,                                   \ class
        DUP XFA @ IF  CELL classAllot  THEN     \ if indexed, allow for class ptr
        ^Class DFA @ ,                          \ offset to ivar data
        DUP @width DUP
        IF  ROT DUP ,  * CELL+  THEN            \ #elems, cell for idx-hdr
        SWAP DFA @ + classAllot ;               \ Account for named ivar lengths


\ =====================================================================
\ Build an instance of a class. If we are inside a class definition, 
\ build an instance variable. Otherwise build a global object.

\ Compile the indexed data header into an object
: IDX-HDR   ( #elems ^Class | ^Class -- indlen )
        @width DUP IF  OVER , ( limit )  *  THEN ;

: (Build)   ( #elems ^Class | ^Class -- )
        ^Class
        IF      <Var    \ build an ivar if we are inside a class
        ELSE
                (Obj)                   \ create object
                DUP >R ,                \ store class pointer
                HERE TO newObject       \ remember current object
                R@ DFA @ RESERVE        \ allot space for ivars
                R@ IDX-HDR RESERVE      \ allot space for indexed data
                R> IFA @ 0 ITRAV        \ init instance variables
                ClassInit               \ send CLASSINIT: message
        THEN ;


\ =====================================================================
\ Build a class header with its superclass pointer.

: :Class  ( -- )
        CREATE  0 TO ^Class
        DOES>  (Build) ;

: <Super  ( -- )
        HERE TO ^Class                  \ save current class
        classSize ALLOT                 \ reserve rest of class data
        ' >BODY                         \ pfa of superclass
        DUP ^Class classSize MOVE       \ copy class data
        DUP ^Class SFA !                \ store pointer to superclass
        ^Super iclass !                 \ store superclass in SUPER
        ^Class ^Self iclass ! ;         \ store my class in SELF

: ;Class  ( -- )
        classAlign              \ align class data size (optional)
        0 ^Super iclass !       \ clear out super and self class pointers
        0 ^Self  iclass !
        0 TO ^Class ;           \ clear class compiling flag


\ =====================================================================
\ Object Compiler. We rely on being able to classify the type of
\ object from it's execution token. There is no general way to 
\ do this in ANS forth for builtin types such as VALUEs. So we
\ only allow message sends to objects and classes. In Yerk, the
\ following will send a late-bound message to a object pointer:
\
\       0 VALUE theObject  ' myObject TO theObject
\
\       Message: theObject
\
\ Here we will have to use the following syntax (which does the same
\ this and is also allowed in Yerk):
\
\       Message: [ theObject ]
\
\ Key to instantiation actions
\ 1 = objType           defined as an object
\ 2 = classType         as a class
\ 5 = parenType         open paren for defer group
\
\ =====================================================================

\ ( str -- xt tokenID )  Determine type of token referenced by string.
: refToken
        DUP ?isParen       IF  3 EXIT  THEN
        FIND 0= ABORT" undefined object"
        DUP >BODY ?isObj   IF  1 EXIT  THEN
        DUP >BODY ?isClass IF  2 EXIT  THEN
        TRUE ABORT" Invalid object type" ;

: (ivarRef)   ( xt offset -- )          \ compile ivar reference
        SWAP  POSTPONE LITERAL  POSTPONE LITERAL  POSTPONE EXECUTE-IVAR ;

: ivarRef   ( selID ^iclass -- )        \ compile ivar reference
        CELL+ FIND-METHOD  SWAP @  ( xt offset )  ?DUP
        IF      (ivarRef)
        ELSE    COMPILE,  ( optimize for offset zero )
        THEN ;

: callMethod  ( xt -- )   \ compile method call
        POSTPONE LITERAL  POSTPONE EXECUTE-METHOD ;

: (objRef)   ( SelID objCfa -- )        \ compile object reference
        >obj FIND-METHOD SWAP ( xt ^obj )
        POSTPONE LITERAL  callMethod ;

\ ( selID $str -- )  Build a reference to an object or vector
: objRef
        refToken CASE
          1 ( object ) OF  (objRef)                     ENDOF
          2 ( class  ) OF  >BODY (FINDM) callMethod     ENDOF
          3 ( paren  ) OF  DROP Defered                 ENDOF
        ENDCASE ;

\ ( selID $str -- )  Execute using token in stream
: runRef
        refToken CASE
          1 ( object ) OF  >obj FIND-METHOD             ENDOF
          2 ( class  ) OF  >BODY (FINDM)                ENDOF
          3 ( paren  ) OF  DROP Defered EXIT            ENDOF
        ENDCASE  EXECUTE-METHOD ;


\ =====================================================================
\ Selectors are immediate words that send a message to the object
\ that follows. The Yerk requirement that selectors end in ":" is
\ enforced here but not otherwise required by the implementation.

\ This is the message compiler invoked by using a selector.
: message   ( SelID -- )
        BL WORD  STATE @
        IF      vFind   \ instance variable?
                IF    ivarRef   \ ivar reference
                ELSE   objRef   \ compile object/vector reference
                THEN
        ELSE    runRef          \ run state - execute object/vector ref
        THEN ;

: ?isSel  ( str -- flag )  \ true if word at addr is a selector xxx:
        DUP DUP C@ CHARS +  C@ [CHAR] :  =  SWAP C@ 1 > AND ;

: ?Selector ( -- )  \ Verify that following word is valid selector
        >IN @  BL WORD ?isSel 0= ABORT" Not a selector"  >IN ! ;

\ Create a selector that sends a message when executed.
: Selector  ( n -- )  ?Selector
        CREATE IMMEDIATE  DOES> message ;

\ If the selector already exists, just return the existing selector,
\ otherwise create a new selector.
: getSelect  ( -- n )
        >IN @  BL WORD FIND
        IF      >BODY NIP  ( already defined )
        ELSE    DROP >IN ! Selector
                HERE
        THEN ;

Selector ClassInit:    getSelect ClassInit: TO (ClassInit:)


\ =====================================================================
\ Build a methods dictionary entry. :M starts a method definition
\ by adding to the class method list and starting the compiler with
\ :NONAME. ;M ends a method and saves the method xt.

: :M    ( -- )
        ?Class
        getSelect
        DUP ^Class MFA ((FINDM))                \ is method already defined?
        IF
\               CR ." Method redefined "
\               HERE COUNT TYPE SPACE
\               ^Class BODY> >NAME .ID          \ print class name

                ^Class U> ABORT" Method redefined in same class"
        THEN
        ALIGN                   \ align method
        ^Class MFA LINK         \ link into method chain
        ( SelID ) ,             \ name is selector's hashed value
        HERE 0 ,                \ save location for method xt
        :NONAME  ;              \ compile nameless definition

: ;M    ( -- )  \ end a method definition
        ?Class  POSTPONE ;  SWAP ! ( save xt )  ; IMMEDIATE


\ =====================================================================
\ Build a new object on the heap for class. Use: Heap> className
\ gets heap, and returns ptr. Throws an error if not enough memory

HAVE ALLOCATE [IF]

: ?MEMERR  ( ior -- )  ABORT" Memory allocation error" ;

Selector Release:       \ sent to an object before it is freed

: allocObj  ( size class -- )  \ allocate object and store in newObject
        OVER CELL+              \ allow for class ptr
        ALLOCATE ?MEMERR        \ ( size class addr -- )
        DUP CELL+ TO newObject  \ object address
        !                       \ create the class ptr
        newObject SWAP ERASE ;  \ clear to zero

: (heapObj)  ( #elems class | class -- ^obj )
        >R  ( save class on return stack )
        R@ DFA @  ( ivar data size )
        R@ @width ?DUP
        IF      \ indexed object, add size of indexed area
                \ ( #elems size width -- )
                2 PICK * + ( indexed data )  CELL+ ( idxHdr )
                R@ allocObj
                newObject R@ DFA @ + !  ( store #elems in idxHdr )
        ELSE
                R@ allocObj     \ non-indexed object
        THEN
        R> IFA @ 0 ITRAV        \ initialize instance variables
        ClassInit               \ send ClassInit: message to new object
        newObject  ;            \ return object address

: HEAP>   ( -- addr )
        ' >BODY  DUP ?isClass 0= ABORT" Not a class"
        STATE @
        IF      POSTPONE LITERAL  POSTPONE (heapObj)
        ELSE    (heapObj)
        THEN ; IMMEDIATE

: RELEASE  ( ^obj -- )          \ free heap object
        Release: [ DUP ]        \ send Release: message to object
        CELL - FREE ?MEMERR ;   \ deallocate it

[THEN]


\ =====================================================================
\ Support for indexed instance variables. When object of these classes
\ are defined, the number of elements should be on the stack.

\ Set a class and its subclasses to indexed

: <Indexed  ( width -- )  ?Class  ^Class XFA !  ;

\ For some classes, we always want the class pointer to be stored whenever
\ the object is an instance variable, so that the object can receive late-
\ bound messages. This is already the case for indexed classes. Here we
\ fake it out by storing -1 into the indexed field. This is the reason
\ for the "0 MAX" in the definition of @width.

: <General  ( -- )  -1 <Indexed ;

\ self returns the same address as ^base, but is used for late bound calls
\ to the object, i.e.   Selector: [ self ]

: self  ( -- )  ?Class
        ^Class XFA @ 0= ABORT" Class must be <General or <Indexed"
        POSTPONE ^base ; IMMEDIATE

\ =====================================================================
\ Indexed primatives. These should be in code for best performance.

: idxBase  ( -- addr )          \ get base of idx data area
        ^base  DUP >class DFA @ +  CELL+ ;

: limit    ( -- n )             \ get idx limit (#elems)
        ^base  DUP >class DFA @ +  @ ;

: width    ( -- n )             \ width of an idx element
        ^base >class XFA @ ;

: ^elem   ( index -- addr )     \ get addr of idx element
        width *  idxBase + ;

\ Fast access to byte and cell arrays.
: At1  ( index -- char )   idxBase + C@ ;
: At4  ( index -- cell )   CELLS idxBase + @ ;

: To1  ( char index -- )   idxBase + C! ;
: To4  ( cell index -- )   CELLS idxBase + ! ;

: ++1  ( char index -- )   idxBase + C+! ;
: ++4  ( cell index -- )   CELLS idxBase + +! ;

\ Compute total length of object.
\ The length does not include class pointer.
: objlen  ( -- objlen )
        ^base >class DUP DFA @  ( non-indexed data )
        SWAP @width ?DUP
        IF  idxBase CELL - @ ( #elems ) * +  CELL+  THEN ;

\ =====================================================================
\ Runtime indexed range checking. Use +range and -range to turn range
\ checking on and off.

: ?range  ( index -- index )  \ range check
        DUP idxBase CELL - @ ( #elems )  U< IF EXIT THEN
        TRUE ABORT" Index out of range" ;

0 VALUE (?idx)          \ execution vector for range checking

: ?idx   (?idx) EXECUTE ;

: +range  ['] ?range TO (?idx) ;  +range
: -range  ['] NOOP   TO (?idx) ;

\ =====================================================================
\ Primatives for cell-sized objects.

: M@  ( -- n )  POSTPONE ^base  POSTPONE @ ; IMMEDIATE
: M!  ( n -- )  POSTPONE ^base  POSTPONE ! ; IMMEDIATE

\ =====================================================================
\ Define base class "object" from which all other classes inherit
\ Some of the common indexed methods are defined here.

:Class Object  <Super Meta

        :M Class:   ^base >class  ;M    \ non-IX - leave class ptr
        :M Addr:    ^base         ;M    \ get object address

        \ ( -- len )  Return total length of object
        :M  Length:    objlen      ;M

HAVE DUMP [IF]
        :M  Dump:     ^base objlen DUMP  ;M
[THEN]
        :M  Print:     ." Object@" ^base U.  ;M

        :M ClassInit:   ;M      \ null method for object init
        :M Release:     ;M      \ null method for object release

;Class

\ Bytes is used as the allocation primitive for basic classes
\ It creates an object of class Object that is n bytes long.
\ You can get the address by sending it an addr: message.

: bytes  ( n -- )
        ?Class  ['] Object >BODY <Var  classAllot ;


\ =====================================================================
\ Load primative classes and test routines.

\ S" VAR.FTH"    INCLUDED
\ S" ARRAY.FTH"  INCLUDED
\ S" TEST.FTH"   INCLUDED
include var.fs
include array.fs
include test.fs

CR .( Classes loaded )
