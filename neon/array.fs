\ Classes for indexed objects
\ Version 1.0, 4 Feb 1997
\ Andrew McKewan
\ mckewan@austin.finnigan.com

\ ==================================================================
\ This is the base class for all indexed objects. It provides the
\ primatives that are common to all indexed objects.

:Class IndexedObj  <Super Object  CELL <Indexed

        \ ( -- addr )  Leave addr of 0th indexed element
        :M  IxAddr:   idxBase   ;M

        \ ( -- limit ) Leave max #elements for array
        :M  Limit:  limit   ;M

        \ ( -- len )  leave width of indexed elements
        :M  Width:  width  ;M

        \ ( index -- addr )  return then address of an indexed element
        :M  ^Elem:  ?idx  ^elem    ;M

        \ ( -- )  Indexed Clear: erases indexed area
        :M  Clear:  idxBase  width limit * ERASE  ;M

;Class


\ ==================================================================
\ Basic cell array

:Class Array  <Super IndexedObj  CELL <Indexed

        :M  At:    ?idx  At4  ;M   ( index -- val )
        :M  To:    ?idx  To4  ;M   ( val Index -- )
        :M  +To:   ?idx  ++4  ;M   ( incVal index -- )

        \ Fill the array with a value
        :M Fill: ( val -- )  limit 0 DO  DUP I To4  LOOP DROP  ;M

;Class

\ ==================================================================
\ X-Array can execute its elements.

:Class X-Array  <Super Array

        \ ( ind -- )  execute the cfa at Ind
        :M  Exec:  ?idx  At4  DUP 0= ABORT" Null xt"  EXECUTE  ;M

        :M  ClassInit:  ['] NOOP Fill: self  ;M

;Class

\ ==================================================================
\ Basic byte array.

:Class ByteArray  <Super IndexedObj  1 <Indexed

        :M  At:    ?idx  At1  ;M   ( index -- val )
        :M  To:    ?idx  To1  ;M   ( val Index -- )
        :M  +To:   ?idx  ++1  ;M   ( incVal index -- )

        \ Fill the array with a value
        :M Fill: ( val -- )  idxBase limit ROT FILL  ;M

;Class

