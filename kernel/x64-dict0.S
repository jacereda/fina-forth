 .globl Forth_Entry 
 .globl Forth_UserP
 .globl Forth_Here
 .globl Forth_End
 .globl _Forth_Entry 
 .globl _Forth_UserP
 .globl _Forth_Here
 .globl _Forth_End
 .text
 .p2align 3
 .quad -17974594, -559038737
_Forth_Entry:
Forth_Entry:
 .quad XT_COLD
_Forth_UserP:
Forth_UserP:
 .quad XT_USERP
_Forth_Here:
Forth_Here:
 .quad XT_HERE

 .p2align 3
 .quad 0
1:
  .byte 5 ,100 ,105 ,99 ,116 ,48 
 .p2align 3
XT_DICTZERO:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 7 ,100 ,105 ,99 ,116 ,116 ,111 ,112 
 .p2align 3
XT_DICTTOP:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 10 ,115 ,105 ,103 ,104 ,97 ,110 ,100 ,108 ,101 ,114 
 .p2align 3
XT_SIGHANDLER:
 nop
 nop
 nop
 call XT_DOUSER
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 10 ,116 ,104 ,114 ,111 ,119 ,102 ,114 ,97 ,109 ,101 
 .p2align 3
XT_THROWFRAME:
 nop
 nop
 nop
 call XT_DOUSER
 .quad -8 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,100 ,112 ,108 
 .p2align 3
XT_DPL:
 nop
 nop
 nop
 call XT_DOUSER
 .quad -16 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,115 ,112 ,48 
 .p2align 3
XT_SPZERO:
 nop
 nop
 nop
 call XT_DOUSER
 .quad -24 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,112 ,48 
 .p2align 3
XT_RPZERO:
 nop
 nop
 nop
 call XT_DOUSER
 .quad -32 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,116 ,97 ,115 ,107 ,110 ,97 ,109 ,101 
 .p2align 3
XT_TASKNAME:
 nop
 nop
 nop
 call XT_DOUSER
 .quad -40 
 .p2align 3
 .quad 1b
1:
  .byte 6 ,112 ,97 ,114 ,115 ,101 ,100 
 .p2align 3
XT_PARSED:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 ,0 
 .p2align 3
 .quad 1b
1:
  .byte 9 ,115 ,111 ,117 ,114 ,99 ,101 ,118 ,97 ,114 
 .p2align 3
XT_SOURCEVAR:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 ,0 
 .p2align 3
 .quad 1b
1:
  .byte 5 ,117 ,115 ,101 ,114 ,112 
 .p2align 3
XT_USERP:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,119 ,97 ,114 ,110 ,105 ,110 ,103 ,115 
 .p2align 3
XT_WARNINGS:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,98 ,97 ,115 ,101 
 .p2align 3
XT_BASE:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,62 ,105 ,110 
 .p2align 3
XT_GTIN:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,115 ,112 ,97 ,110 
 .p2align 3
XT_SPAN:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,116 ,97 ,116 ,101 
 .p2align 3
XT_STATE:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,104 ,97 ,115 ,110 ,97 ,109 ,101 ,63 
 .p2align 3
XT_HASNAMEQ:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 11 ,103 ,101 ,116 ,45 ,99 ,117 ,114 ,114 ,101 ,110 ,116 
 .p2align 3
XT_GETMINUSCURRENT:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 6 ,109 ,101 ,109 ,116 ,111 ,112 
 .p2align 3
XT_MEMTOP:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,108 ,97 ,115 ,116 ,110 ,97 ,109 ,101 
 .p2align 3
XT_LASTNAME:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 6 ,108 ,97 ,115 ,116 ,120 ,116 
 .p2align 3
XT_LASTXT:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,104 ,101 ,114 ,101 
 .p2align 3
XT_HERE:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 9 ,115 ,111 ,117 ,114 ,99 ,101 ,45 ,105 ,100 
 .p2align 3
XT_SOURCEMINUSID:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,112 ,97 ,100 
 .p2align 3
XT_PAD:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,116 ,105 ,98 
 .p2align 3
XT_TIB:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,104 ,108 ,100 ,48 
 .p2align 3
XT_HLDZERO:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,104 ,108 ,100 
 .p2align 3
XT_HLD:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -1414673666 
 .p2align 3
 .quad 1b
1:
  .byte 5 ,102 ,111 ,117 ,110 ,100 
 .p2align 3
XT_FOUND:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,108 ,97 ,115 ,116 ,117 ,115 ,101 ,114 
 .p2align 3
XT_LASTUSER:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad -48 ,0 ,0 
 .p2align 3
 .quad 1b
1:
  .byte 14 ,102 ,111 ,114 ,116 ,104 ,45 ,119 ,111 ,114 ,100 ,108 ,105 ,115 ,116 
 .p2align 3
XT_FORTHMINUSWORDLIST:
 nop
 nop
 nop
 call XT_DOVALUE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 2 ,98 ,108 
 .p2align 3
XT_BL:
 nop
 nop
 nop
 call XT_DOCONST
 .quad 32 
 .p2align 3
 .quad 1b
1:
  .byte 3 ,117 ,109 ,43 
 .p2align 3
_XT_UMPLUS:
 .quad  -559038737,XT_UMPLUS

 .p2align 3
 .quad 1b
1:
  .byte 3 ,97 ,110 ,100 
 .p2align 3
_XT_AND:
 .quad  -559038737,XT_AND

 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,42 
 .p2align 3
_XT_TWOSTAR:
 .quad  -559038737,XT_TWOSTAR

 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,47 
 .p2align 3
_XT_TWOSLASH:
 .quad  -559038737,XT_TWOSLASH

 .p2align 3
 .quad 1b
1:
  .byte 3 ,120 ,111 ,114 
 .p2align 3
_XT_XOR:
 .quad  -559038737,XT_XOR

 .p2align 3
 .quad 1b
1:
  .byte 2 ,111 ,114 
 .p2align 3
_XT_OR:
 .quad  -559038737,XT_OR

 .p2align 3
 .quad 1b
1:
  .byte 2 ,48 ,60 
 .p2align 3
_XT_ZEROLT:
 .quad  -559038737,XT_ZEROLT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,48 ,61 
 .p2align 3
_XT_ZEROEQUALS:
 .quad  -559038737,XT_ZEROEQUALS

 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,120 ,63 
 .p2align 3
_XT_RXQ:
 .quad  -559038737,XT_RXQ

 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,120 ,64 
 .p2align 3
_XT_RXFETCH:
 .quad  -559038737,XT_RXFETCH

 .p2align 3
 .quad 1b
1:
  .byte 3 ,116 ,120 ,63 
 .p2align 3
_XT_TXQ:
 .quad  -559038737,XT_TXQ

 .p2align 3
 .quad 1b
1:
  .byte 3 ,116 ,120 ,33 
 .p2align 3
_XT_TXSTORE:
 .quad  -559038737,XT_TXSTORE

 .p2align 3
 .quad 1b
1:
  .byte 4 ,100 ,114 ,111 ,112 
 .p2align 3
_XT_DROP:
 .quad  -559038737,XT_DROP

 .p2align 3
 .quad 1b
1:
  .byte 3 ,100 ,117 ,112 
 .p2align 3
_XT_DUP:
 .quad  -559038737,XT_DUP

 .p2align 3
 .quad 1b
1:
  .byte 4 ,111 ,118 ,101 ,114 
 .p2align 3
_XT_OVER:
 .quad  -559038737,XT_OVER

 .p2align 3
 .quad 1b
1:
  .byte 4 ,115 ,119 ,97 ,112 
 .p2align 3
_XT_SWAP:
 .quad  -559038737,XT_SWAP

 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,112 ,64 
 .p2align 3
_XT_RPFETCH:
 .quad  -559038737,XT_RPFETCH

 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,112 ,33 
 .p2align 3
_XT_RPSTORE:
 .quad  -559038737,XT_RPSTORE

 .p2align 3
 .quad 1b
1:
  .byte 3 ,115 ,112 ,64 
 .p2align 3
_XT_SPFETCH:
 .quad  -559038737,XT_SPFETCH

 .p2align 3
 .quad 1b
1:
  .byte 3 ,115 ,112 ,33 
 .p2align 3
_XT_SPSTORE:
 .quad  -559038737,XT_SPSTORE

 .p2align 3
 .quad 1b
1:
  .byte 1 ,33 
 .p2align 3
_XT_STORE:
 .quad  -559038737,XT_STORE

 .p2align 3
 .quad 1b
1:
  .byte 1 ,64 
 .p2align 3
_XT_FETCH:
 .quad  -559038737,XT_FETCH

 .p2align 3
 .quad 1b
1:
  .byte 2 ,99 ,33 
 .p2align 3
_XT_CSTORE:
 .quad  -559038737,XT_CSTORE

 .p2align 3
 .quad 1b
1:
  .byte 2 ,99 ,64 
 .p2align 3
_XT_CFETCH:
 .quad  -559038737,XT_CFETCH

 .p2align 3
 .quad 1b
1:
  .byte 4 ,109 ,111 ,118 ,101 
 .p2align 3
_XT_MOVE:
 .quad  -559038737,XT_MOVE

 .p2align 3
 .quad 1b
1:
  .byte 6 ,105 ,115 ,97 ,109 ,101 ,63 
 .p2align 3
_XT_ISAMEQ:
 .quad  -559038737,XT_ISAMEQ

 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,97 ,109 ,101 ,63 
 .p2align 3
_XT_SAMEQ:
 .quad  -559038737,XT_SAMEQ

 .p2align 3
 .quad 1b
1:
  .byte 7 ,101 ,120 ,101 ,99 ,117 ,116 ,101 
 .p2align 3
_XT_EXECUTE:
 .quad  -559038737,XT_EXECUTE

 .p2align 3
 .quad 1b
1:
  .byte 7 ,101 ,110 ,100 ,116 ,105 ,99 ,107 
 .p2align 3
_XT_ENDTICK:
 .quad  -559038737,XT_ENDTICK

 .p2align 3
 .quad 1b
1:
  .byte 3 ,98 ,121 ,101 
 .p2align 3
_XT_BYE:
 .quad  -559038737,XT_BYE

 .p2align 3
 .quad 1b
1:
  .byte 9 ,63 ,100 ,111 ,100 ,101 ,102 ,105 ,110 ,101 
 .p2align 3
_XT_QDODEFINE:
 .quad  -559038737,XT_QDODEFINE

 .p2align 3
 .quad 1b
1:
  .byte 3 ,120 ,116 ,44 
 .p2align 3
_XT_XTCOMMA:
 .quad  -559038737,XT_XTCOMMA

 .p2align 3
 .quad 1b
1:
  .byte 2 ,109 ,115 
 .p2align 3
_XT_MS:
 .quad  -559038737,XT_MS

 .p2align 3
 .quad 1b
1:
  .byte 9 ,116 ,105 ,109 ,101 ,38 ,100 ,97 ,116 ,101 
 .p2align 3
_XT_TIMEANDDATE:
 .quad  -559038737,XT_TIMEANDDATE

 .p2align 3
 .quad 1b
1:
  .byte 40 ,100 ,111 ,99 ,114 ,101 ,97 ,116 ,101 
 .p2align 3
_XT_DOCREATE:
 .quad  -559038737,XT_DOCREATE

 .p2align 3
 .quad 1b
1:
  .byte 37 ,100 ,111 ,108 ,105 ,116 
 .p2align 3
_XT_DOLIT:
 .quad  -559038737,XT_DOLIT

 .p2align 3
 .quad 1b
1:
  .byte 38 ,100 ,111 ,117 ,115 ,101 ,114 
 .p2align 3
_XT_DOUSER:
 .quad  -559038737,XT_DOUSER

 .p2align 3
 .quad 1b
1:
  .byte 37 ,100 ,111 ,118 ,97 ,114 
 .p2align 3
_XT_DOVAR:
 .quad  -559038737,XT_DOVAR

 .p2align 3
 .quad 1b
1:
  .byte 39 ,100 ,111 ,99 ,111 ,110 ,115 ,116 
 .p2align 3
_XT_DOCONST:
 .quad  -559038737,XT_DOCONST

 .p2align 3
 .quad 1b
1:
  .byte 39 ,100 ,111 ,118 ,97 ,108 ,117 ,101 
 .p2align 3
_XT_DOVALUE:
 .quad  -559038737,XT_DOVALUE

 .p2align 3
 .quad 1b
1:
  .byte 38 ,100 ,111 ,108 ,105 ,115 ,116 
 .p2align 3
_XT_DOLIST:
 .quad  -559038737,XT_DOLIST

 .p2align 3
 .quad 1b
1:
  .byte 38 ,100 ,111 ,108 ,111 ,111 ,112 
 .p2align 3
_XT_DOLOOP:
 .quad  -559038737,XT_DOLOOP

 .p2align 3
 .quad 1b
1:
  .byte 39 ,100 ,111 ,43 ,108 ,111 ,111 ,112 
 .p2align 3
_XT_DOPLUSLOOP:
 .quad  -559038737,XT_DOPLUSLOOP

 .p2align 3
 .quad 1b
1:
  .byte 38 ,100 ,111 ,110 ,101 ,120 ,116 
 .p2align 3
_XT_DONEXT:
 .quad  -559038737,XT_DONEXT

 .p2align 3
 .quad 1b
1:
  .byte 39 ,48 ,98 ,114 ,97 ,110 ,99 ,104 
 .p2align 3
_XT_ZEROBRANCH:
 .quad  -559038737,XT_ZEROBRANCH

 .p2align 3
 .quad 1b
1:
  .byte 38 ,98 ,114 ,97 ,110 ,99 ,104 
 .p2align 3
_XT_BRANCH:
 .quad  -559038737,XT_BRANCH

 .p2align 3
 .quad 1b
1:
  .byte 36 ,101 ,120 ,105 ,116 
 .p2align 3
_XT_EXIT:
 .quad  -559038737,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 33 ,105 
 .p2align 3
_XT_I:
 .quad  -559038737,XT_I

 .p2align 3
 .quad 1b
1:
  .byte 34 ,62 ,114 
 .p2align 3
_XT_GTR:
 .quad  -559038737,XT_GTR

 .p2align 3
 .quad 1b
1:
  .byte 34 ,114 ,62 
 .p2align 3
_XT_RGT:
 .quad  -559038737,XT_RGT

 .p2align 3
 .quad 1b
1:
  .byte 34 ,114 ,64 
 .p2align 3
_XT_RFETCH:
 .quad  -559038737,XT_RFETCH

#if BUILD_ALLOCATE
 .p2align 3
 .quad 1b
1:
  .byte 8 ,97 ,108 ,108 ,111 ,99 ,97 ,116 ,101 
 .p2align 3
_XT_ALLOCATE:
 .quad  -559038737,XT_ALLOCATE
#endif

#if BUILD_ALLOCATE
 .p2align 3
 .quad 1b
1:
  .byte 4 ,102 ,114 ,101 ,101 
 .p2align 3
_XT_FREE:
 .quad  -559038737,XT_FREE
#endif

#if BUILD_ALLOCATE
 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,101 ,115 ,105 ,122 ,101 
 .p2align 3
_XT_RESIZE:
 .quad  -559038737,XT_RESIZE
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,111 ,112 ,101 ,110 ,102 
 .p2align 3
_XT_OPENF:
 .quad  -559038737,XT_OPENF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 6 ,99 ,108 ,111 ,115 ,101 ,102 
 .p2align 3
_XT_CLOSEF:
 .quad  -559038737,XT_CLOSEF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,114 ,101 ,97 ,100 ,102 
 .p2align 3
_XT_READF:
 .quad  -559038737,XT_READF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 6 ,119 ,114 ,105 ,116 ,101 ,102 
 .p2align 3
_XT_WRITEF:
 .quad  -559038737,XT_WRITEF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,109 ,109 ,97 ,112 ,102 
 .p2align 3
_XT_MMAPF:
 .quad  -559038737,XT_MMAPF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,105 ,122 ,101 ,102 
 .p2align 3
_XT_SIZEF:
 .quad  -559038737,XT_SIZEF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,101 ,101 ,107 ,102 
 .p2align 3
_XT_SEEKF:
 .quad  -559038737,XT_SEEKF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,116 ,101 ,108 ,108 ,102 
 .p2align 3
_XT_TELLF:
 .quad  -559038737,XT_TELLF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,108 ,105 ,110 ,101 ,102 
 .p2align 3
_XT_LINEF:
 .quad  -559038737,XT_LINEF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 7 ,100 ,101 ,108 ,101 ,116 ,101 ,102 
 .p2align 3
_XT_DELETEF:
 .quad  -559038737,XT_DELETEF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,116 ,97 ,116 ,102 
 .p2align 3
_XT_STATF:
 .quad  -559038737,XT_STATF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 4 ,114 ,101 ,110 ,102 
 .p2align 3
_XT_RENF:
 .quad  -559038737,XT_RENF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 6 ,116 ,114 ,117 ,110 ,99 ,102 
 .p2align 3
_XT_TRUNCF:
 .quad  -559038737,XT_TRUNCF
#endif

#if BUILD_FILES
 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,108 ,117 ,115 ,104 ,102 
 .p2align 3
_XT_FLUSHF:
 .quad  -559038737,XT_FLUSHF
#endif

 .p2align 3
 .quad 1b
1:
  .byte 8 ,102 ,120 ,62 ,102 ,108 ,111 ,97 ,116 
 .p2align 3
_XT_FXGTFLOAT:
 .quad  -559038737,XT_FXGTFLOAT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,102 ,108 ,111 ,97 ,116 ,62 ,102 ,120 
 .p2align 3
_XT_FLOATGTFX:
 .quad  -559038737,XT_FLOATGTFX

 .p2align 3
 .quad 1b
1:
  .byte 9 ,102 ,120 ,62 ,100 ,111 ,117 ,98 ,108 ,101 
 .p2align 3
_XT_FXGTDOUBLE:
 .quad  -559038737,XT_FXGTDOUBLE

 .p2align 3
 .quad 1b
1:
  .byte 9 ,100 ,111 ,117 ,98 ,108 ,101 ,62 ,102 ,120 
 .p2align 3
_XT_DOUBLEGTFX:
 .quad  -559038737,XT_DOUBLEGTFX

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,102 ,112 ,114 ,101 ,112 
 .p2align 3
_XT_FFPREP:
 .quad  -559038737,XT_FFPREP
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,102 ,99 ,97 ,108 ,108 
 .p2align 3
_XT_FFCALL:
 .quad  -559038737,XT_FFCALL
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,102 ,99 ,108 ,111 ,115 
 .p2align 3
_XT_FFCLOS:
 .quad  -559038737,XT_FFCLOS
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,102 ,118 ,111 ,105 ,100 
 .p2align 3
_XT_FFVOID:
 .quad  -559038737,XT_FFVOID
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 5 ,102 ,102 ,105 ,110 ,116 
 .p2align 3
_XT_FFINT:
 .quad  -559038737,XT_FFINT
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 7 ,102 ,102 ,102 ,108 ,111 ,97 ,116 
 .p2align 3
_XT_FFFLOAT:
 .quad  -559038737,XT_FFFLOAT
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 8 ,102 ,102 ,100 ,111 ,117 ,98 ,108 ,101 
 .p2align 3
_XT_FFDOUBLE:
 .quad  -559038737,XT_FFDOUBLE
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 5 ,102 ,102 ,112 ,116 ,114 
 .p2align 3
_XT_FFPTR:
 .quad  -559038737,XT_FFPTR
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 7 ,102 ,102 ,105 ,110 ,116 ,54 ,52 
 .p2align 3
_XT_FFINTSIXFOUR:
 .quad  -559038737,XT_FFINTSIXFOUR
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,108 ,111 ,112 ,101 ,110 
 .p2align 3
_XT_DLOPEN:
 .quad  -559038737,XT_DLOPEN
#endif

#if BUILD_FFI
 .p2align 3
 .quad 1b
1:
  .byte 5 ,100 ,108 ,115 ,121 ,109 
 .p2align 3
_XT_DLSYM:
 .quad  -559038737,XT_DLSYM
#endif

 .p2align 3
 .quad 1b
1:
  .byte 4 ,97 ,114 ,103 ,99 
 .p2align 3
_XT_ARGC:
 .quad  -559038737,XT_ARGC

 .p2align 3
 .quad 1b
1:
  .byte 4 ,97 ,114 ,103 ,118 
 .p2align 3
_XT_ARGV:
 .quad  -559038737,XT_ARGV

 .p2align 3
 .quad 1b
1:
  .byte 5 ,120 ,116 ,101 ,110 ,100 
 .p2align 3
_XT_XTEND:
 .quad  -559038737,XT_XTEND

 .p2align 3
 .quad 1b
1:
  .byte 4 ,110 ,111 ,111 ,112 
 .p2align 3
_XT_NOOP:
 .quad  -559038737,XT_NOOP

 .p2align 3
 .quad 1b
1:
  .byte 6 ,46 ,101 ,114 ,114 ,111 ,114 
 .p2align 3
XT_DOTERROR:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 7 ,46 ,101 ,114 ,114 ,111 ,114 ,33 
 .p2align 3
XT_DOTERRORSTORE:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 9 ,105 ,110 ,116 ,101 ,114 ,112 ,114 ,101 ,116 
 .p2align 3
XT_INTERPRET:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 10 ,107 ,101 ,121 ,104 ,97 ,110 ,100 ,108 ,101 ,114 
 .p2align 3
XT_KEYHANDLER:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,101 ,102 ,105 ,108 ,108 
 .p2align 3
XT_REFILL:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,64 ,101 ,120 ,101 ,99 ,117 ,116 ,101 
 .p2align 3
XT_FETCHEXECUTE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCH,XT_EXECUTE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,101 ,107 ,101 ,121 ,63 
 .p2align 3
XT_EKEYQ:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,101 ,107 ,101 ,121 
 .p2align 3
XT_EKEY:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 5 ,101 ,109 ,105 ,116 ,63 
 .p2align 3
XT_EMITQ:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 4 ,101 ,109 ,105 ,116 
 .p2align 3
XT_EMIT:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 7 ,46 ,112 ,114 ,111 ,109 ,112 ,116 
 .p2align 3
XT_DOTPROMPT:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 2 ,99 ,114 
 .p2align 3
XT_CR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,10 ,XT_EMIT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,115 ,112 ,97 ,99 ,101 
 .p2align 3
XT_SPACE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,32 ,XT_EMIT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,115 ,112 ,97 ,99 ,101 ,115 
 .p2align 3
XT_SPACES:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_MAX,XT_DOLIT,0 ,XT_DOQDO,4 ,XT_SPACE,XT_DOLOOP,-2 ,XT_UNLOOP,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 4 ,63 ,100 ,117 ,112 
 .p2align 3
_XT_QDUP:
 .quad  -559038737,XT_QDUP
#else
 .p2align 3
 .quad 1b
1:
  .byte 4 ,63 ,100 ,117 ,112 
 .p2align 3
XT_QDUP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_ZEROBRANCH,2 ,XT_DUP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,110 ,105 ,112 
 .p2align 3
_XT_NIP:
 .quad  -559038737,XT_NIP
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,110 ,105 ,112 
 .p2align 3
XT_NIP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,111 ,116 
 .p2align 3
_XT_ROT:
 .quad  -559038737,XT_ROT
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,114 ,111 ,116 
 .p2align 3
XT_ROT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_SWAP,XT_RGT,XT_SWAP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,100 ,114 ,111 ,112 
 .p2align 3
_XT_TWODROP:
 .quad  -559038737,XT_TWODROP
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,100 ,114 ,111 ,112 
 .p2align 3
XT_TWODROP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DROP,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 4 ,50 ,100 ,117 ,112 
 .p2align 3
_XT_TWODUP:
 .quad  -559038737,XT_TWODUP
#else
 .p2align 3
 .quad 1b
1:
  .byte 4 ,50 ,100 ,117 ,112 
 .p2align 3
XT_TWODUP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_OVER,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,115 ,119 ,97 ,112 
 .p2align 3
_XT_TWOSWAP:
 .quad  -559038737,XT_TWOSWAP
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,115 ,119 ,97 ,112 
 .p2align 3
XT_TWOSWAP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ROT,XT_GTR,XT_ROT,XT_RGT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,111 ,118 ,101 ,114 
 .p2align 3
_XT_TWOOVER:
 .quad  -559038737,XT_TWOOVER
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,50 ,111 ,118 ,101 ,114 
 .p2align 3
XT_TWOOVER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_GTR,XT_TWODUP,XT_RGT,XT_RGT,XT_TWOSWAP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 38 ,117 ,110 ,108 ,111 ,111 ,112 
 .p2align 3
_XT_UNLOOP:
 .quad  -559038737,XT_UNLOOP
#else
 .p2align 3
 .quad 1b
1:
  .byte 38 ,117 ,110 ,108 ,111 ,111 ,112 
 .p2align 3
XT_UNLOOP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_RGT,XT_RGT,XT_TWODROP,XT_GTR,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 37 ,114 ,100 ,114 ,111 ,112 
 .p2align 3
_XT_RDROP:
 .quad  -559038737,XT_RDROP
#else
 .p2align 3
 .quad 1b
1:
  .byte 37 ,114 ,100 ,114 ,111 ,112 
 .p2align 3
XT_RDROP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_RGT,XT_DROP,XT_GTR,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 35 ,64 ,114 ,43 
 .p2align 3
XT_FETCHRPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_RFETCH,XT_FETCH,XT_RGT,XT_CELLPLUS,XT_GTR,XT_SWAP,XT_GTR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 35 ,33 ,114 ,43 
 .p2align 3
XT_STORERPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_SWAP,XT_RFETCH,XT_STORE,XT_RGT,XT_CELLPLUS,XT_GTR,XT_GTR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,100 ,101 ,112 ,116 ,104 
 .p2align 3
XT_DEPTH:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SPFETCH,XT_NEGATE,XT_SPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,3 ,XT_ARSHIFT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,100 ,101 ,112 ,116 ,104 
 .p2align 3
XT_RDEPTH:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RPFETCH,XT_NEGATE,XT_RPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,3 ,XT_ARSHIFT,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 4 ,112 ,105 ,99 ,107 
 .p2align 3
_XT_PICK:
 .quad  -559038737,XT_PICK
#else
 .p2align 3
 .quad 1b
1:
  .byte 4 ,112 ,105 ,99 ,107 
 .p2align 3
XT_PICK:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DEPTH,XT_DUP,XT_DOLIT,2 ,XT_LT,XT_DOQTHROW,-4 ,XT_DOLIT,2 ,XT_MINUS,XT_OVER,XT_ULT,XT_DOQTHROW,-4 ,XT_ONEPLUS,XT_CELLS,XT_SPFETCH,XT_PLUS,XT_FETCH,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 5 ,114 ,112 ,105 ,99 ,107 
 .p2align 3
XT_RPICK:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RDEPTH,XT_DUP,XT_DOLIT,2 ,XT_LT,XT_DOQTHROW,-4 ,XT_DOLIT,2 ,XT_MINUS,XT_OVER,XT_ULT,XT_DOQTHROW,-4 ,XT_ONEPLUS,XT_CELLS,XT_RPFETCH,XT_PLUS,XT_FETCH,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,46 ,115 
 .p2align 3
XT_DOTS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DEPTH,XT_DOLIT,0 ,XT_LTNUMBER,XT_DOLIT,62 ,XT_HOLD,XT_NUMBERS,XT_DOLIT,60 ,XT_HOLD,XT_NUMBERGT,XT_TYPE,XT_SPACE,XT_DEPTH,XT_DUP,XT_DOLIT,0 ,XT_DOQDO,7 ,XT_DUP,XT_PICK,XT_DOT,XT_ONEMINUS,XT_DOLOOP,-5 ,XT_UNLOOP,XT_DROP,XT_CR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 3 ,46 ,114 ,115 
 .p2align 3
XT_DOTRS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RDEPTH,XT_DOT,XT_DOLIT,4 ,XT_SPACES,XT_RDEPTH,XT_DOLIT,0 ,XT_DOQDO,6 ,XT_I,XT_RPICK,XT_DOT,XT_DOLOOP,-4 ,XT_UNLOOP,XT_CR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,116 ,104 ,114 ,111 ,119 
 .p2align 3
XT_THROW:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_QDUP,XT_ZEROBRANCH,13 ,XT_THROWFRAME,XT_FETCH,XT_RPSTORE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RGT,XT_SWAP,XT_GTR,XT_SPSTORE,XT_DROP,XT_RGT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 40 ,100 ,111 ,63 ,116 ,104 ,114 ,111 ,119 
 .p2align 3
XT_DOQTHROW:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ZEROLTGT,XT_FETCHRPLUS,XT_AND,XT_THROW,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,97 ,116 ,99 ,104 
 .p2align 3
XT_CATCH:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SPFETCH,XT_GTR,XT_THROWFRAME,XT_FETCH,XT_GTR,XT_RPFETCH,XT_THROWFRAME,XT_STORE,XT_EXECUTE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RDROP,XT_DOLIT,0 ,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,43 
 .p2align 3
_XT_PLUS:
 .quad  -559038737,XT_PLUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,43 
 .p2align 3
XT_PLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_UMPLUS,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,49 ,43 
 .p2align 3
_XT_ONEPLUS:
 .quad  -559038737,XT_ONEPLUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,49 ,43 
 .p2align 3
XT_ONEPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,1 ,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,49 ,45 
 .p2align 3
_XT_ONEMINUS:
 .quad  -559038737,XT_ONEMINUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,49 ,45 
 .p2align 3
XT_ONEMINUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,-1 ,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,105 ,110 ,118 ,101 ,114 ,116 
 .p2align 3
_XT_INVERT:
 .quad  -559038737,XT_INVERT
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,105 ,110 ,118 ,101 ,114 ,116 
 .p2align 3
XT_INVERT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,-1 ,XT_XOR,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,110 ,101 ,103 ,97 ,116 ,101 
 .p2align 3
_XT_NEGATE:
 .quad  -559038737,XT_NEGATE
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,110 ,101 ,103 ,97 ,116 ,101 
 .p2align 3
XT_NEGATE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_INVERT,XT_ONEPLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,45 
 .p2align 3
_XT_MINUS:
 .quad  -559038737,XT_MINUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,45 
 .p2align 3
XT_MINUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_NEGATE,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 33 ,106 
 .p2align 3
_XT_J:
 .quad  -559038737,XT_J
#else
 .p2align 3
 .quad 1b
1:
  .byte 33 ,106 
 .p2align 3
XT_J:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RPFETCH,XT_DOLIT,24 ,XT_PLUS,XT_FETCH,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,48 ,60 ,62 
 .p2align 3
_XT_ZEROLTGT:
 .quad  -559038737,XT_ZEROLTGT
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,48 ,60 ,62 
 .p2align 3
XT_ZEROLTGT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ZEROEQUALS,XT_ZEROEQUALS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,60 
 .p2align 3
_XT_LT:
 .quad  -559038737,XT_LT
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,60 
 .p2align 3
XT_LT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_XOR,XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_DROP,XT_ZEROLT,XT_EXIT,XT_MINUS,XT_ZEROLT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,117 ,60 
 .p2align 3
_XT_ULT:
 .quad  -559038737,XT_ULT
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,117 ,60 
 .p2align 3
XT_ULT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_XOR,XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_NIP,XT_ZEROLT,XT_EXIT,XT_MINUS,XT_ZEROLT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,62 
 .p2align 3
_XT_GT:
 .quad  -559038737,XT_GT
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,62 
 .p2align 3
XT_GT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_LT,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 2 ,117 ,62 
 .p2align 3
XT_UGT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_ULT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 3 ,117 ,62 ,61 
 .p2align 3
XT_UGTEQUALS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ULT,XT_ZEROEQUALS,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,61 
 .p2align 3
_XT_EQUALS:
 .quad  -559038737,XT_EQUALS
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,61 
 .p2align 3
XT_EQUALS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_XOR,XT_ZEROEQUALS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,60 ,62 
 .p2align 3
_XT_LTGT:
 .quad  -559038737,XT_LTGT
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,60 ,62 
 .p2align 3
XT_LTGT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_EQUALS,XT_ZEROEQUALS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,43 
 .p2align 3
_XT_CELLPLUS:
 .quad  -559038737,XT_CELLPLUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,43 
 .p2align 3
XT_CELLPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,8 ,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 36 ,100 ,111 ,100 ,111 
 .p2align 3
_XT_DODO:
 .quad  -559038737,XT_DODO
#else
 .p2align 3
 .quad 1b
1:
  .byte 36 ,100 ,111 ,100 ,111 
 .p2align 3
XT_DODO:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_ROT,XT_GTR,XT_SWAP,XT_GTR,XT_GTR,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 37 ,100 ,111 ,102 ,111 ,114 
 .p2align 3
XT_DOFOR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RGT,XT_SWAP,XT_DUP,XT_GTR,XT_GTR,XT_GTR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 37 ,100 ,111 ,63 ,100 ,111 
 .p2align 3
XT_DOQDO:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_EQUALS,XT_ZEROBRANCH,10 ,XT_TWODROP,XT_RGT,XT_DUP,XT_FETCH,XT_CELLS,XT_PLUS,XT_CELLPLUS,XT_GTR,XT_EXIT,XT_RGT,XT_ROT,XT_GTR,XT_SWAP,XT_GTR,XT_CELLPLUS,XT_GTR,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,97 ,98 ,115 
 .p2align 3
_XT_ABS:
 .quad  -559038737,XT_ABS
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,97 ,98 ,115 
 .p2align 3
XT_ABS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_NEGATE,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,108 ,115 ,104 ,105 ,102 ,116 
 .p2align 3
_XT_LSHIFT:
 .quad  -559038737,XT_LSHIFT
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,108 ,115 ,104 ,105 ,102 ,116 
 .p2align 3
XT_LSHIFT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_DOQDO,4 ,XT_TWOSTAR,XT_DOLOOP,-2 ,XT_UNLOOP,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 7 ,97 ,114 ,115 ,104 ,105 ,102 ,116 
 .p2align 3
XT_ARSHIFT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_DOQDO,4 ,XT_TWOSLASH,XT_DOLOOP,-2 ,XT_UNLOOP,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,115 ,104 ,105 ,102 ,116 
 .p2align 3
_XT_RSHIFT:
 .quad  -559038737,XT_RSHIFT
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,115 ,104 ,105 ,102 ,116 
 .p2align 3
XT_RSHIFT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_DOQDO,7 ,XT_TWOSLASH,XT_DOLIT,2147483647 ,XT_AND,XT_DOLOOP,-5 ,XT_UNLOOP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,109 ,97 ,120 
 .p2align 3
_XT_MAX:
 .quad  -559038737,XT_MAX
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,109 ,97 ,120 
 .p2align 3
XT_MAX:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_LT,XT_ZEROBRANCH,2 ,XT_SWAP,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,109 ,105 ,110 
 .p2align 3
_XT_MIN:
 .quad  -559038737,XT_MIN
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,109 ,105 ,110 
 .p2align 3
XT_MIN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_GT,XT_ZEROBRANCH,2 ,XT_SWAP,XT_DROP,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 4 ,117 ,109 ,105 ,110 
 .p2align 3
XT_UMIN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_UGT,XT_ZEROBRANCH,2 ,XT_SWAP,XT_DROP,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,117 ,109 ,42 
 .p2align 3
_XT_UMSTAR:
 .quad  -559038737,XT_UMSTAR
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,117 ,109 ,42 
 .p2align 3
XT_UMSTAR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_SWAP,XT_DOLIT,63 ,XT_DOFOR,XT_DUP,XT_UMPLUS,XT_GTR,XT_GTR,XT_DUP,XT_UMPLUS,XT_RGT,XT_PLUS,XT_RGT,XT_ZEROBRANCH,6 ,XT_GTR,XT_OVER,XT_UMPLUS,XT_RGT,XT_PLUS,XT_DONEXT,-17 ,XT_UNLOOP,XT_ROT,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 7 ,100 ,110 ,101 ,103 ,97 ,116 ,101 
 .p2align 3
_XT_DNEGATE:
 .quad  -559038737,XT_DNEGATE
#else
 .p2align 3
 .quad 1b
1:
  .byte 7 ,100 ,110 ,101 ,103 ,97 ,116 ,101 
 .p2align 3
XT_DNEGATE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_INVERT,XT_GTR,XT_INVERT,XT_DOLIT,1 ,XT_UMPLUS,XT_RGT,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,109 ,42 
 .p2align 3
_XT_MSTAR:
 .quad  -559038737,XT_MSTAR
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,109 ,42 
 .p2align 3
XT_MSTAR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_XOR,XT_ZEROLT,XT_GTR,XT_ABS,XT_SWAP,XT_ABS,XT_UMSTAR,XT_RGT,XT_ZEROBRANCH,2 ,XT_DNEGATE,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 1 ,42 
 .p2align 3
_XT_STAR:
 .quad  -559038737,XT_STAR
#else
 .p2align 3
 .quad 1b
1:
  .byte 1 ,42 
 .p2align 3
XT_STAR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_UMSTAR,XT_DROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,117 ,109 ,47 ,109 ,111 ,100 
 .p2align 3
_XT_UMSLASHMOD:
 .quad  -559038737,XT_UMSLASHMOD
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,117 ,109 ,47 ,109 ,111 ,100 
 .p2align 3
XT_UMSLASHMOD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_NEGATE,XT_DOLIT,63 ,XT_DOFOR,XT_GTR,XT_DUP,XT_UMPLUS,XT_GTR,XT_GTR,XT_DUP,XT_UMPLUS,XT_RGT,XT_PLUS,XT_DUP,XT_RGT,XT_RFETCH,XT_SWAP,XT_GTR,XT_UMPLUS,XT_RGT,XT_OR,XT_ZEROBRANCH,7 ,XT_GTR,XT_DROP,XT_ONEPLUS,XT_RGT,XT_BRANCH,2 ,XT_DROP,XT_RGT,XT_DONEXT,-28 ,XT_UNLOOP,XT_DROP,XT_SWAP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 3 ,115 ,62 ,100 
 .p2align 3
_XT_SGTD:
 .quad  -559038737,XT_SGTD
#else
 .p2align 3
 .quad 1b
1:
  .byte 3 ,115 ,62 ,100 
 .p2align 3
XT_SGTD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_ZEROLT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 6 ,119 ,105 ,116 ,104 ,105 ,110 
 .p2align 3
_XT_WITHIN:
 .quad  -559038737,XT_WITHIN
#else
 .p2align 3
 .quad 1b
1:
  .byte 6 ,119 ,105 ,116 ,104 ,105 ,110 
 .p2align 3
XT_WITHIN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_MINUS,XT_GTR,XT_MINUS,XT_RGT,XT_ULT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,100 ,43 
 .p2align 3
_XT_DPLUS:
 .quad  -559038737,XT_DPLUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,100 ,43 
 .p2align 3
XT_DPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_SWAP,XT_GTR,XT_UMPLUS,XT_RGT,XT_RGT,XT_PLUS,XT_PLUS,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 6 ,117 ,110 ,100 ,101 ,114 ,43 
 .p2align 3
XT_UNDERPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ROT,XT_PLUS,XT_SWAP,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,104 ,97 ,114 ,43 
 .p2align 3
_XT_CHARPLUS:
 .quad  -559038737,XT_CHARPLUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,104 ,97 ,114 ,43 
 .p2align 3
XT_CHARPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ONEPLUS,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 5 ,100 ,105 ,99 ,116 ,63 
 .p2align 3
XT_DICTQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DICTZERO,XT_DICTTOP,XT_WITHIN,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,63 ,100 ,105 ,99 ,116 
 .p2align 3
XT_QDICT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HERE,XT_DICTQ,XT_ZEROEQUALS,XT_DOQTHROW,-8 ,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,115 
 .p2align 3
_XT_CELLS:
 .quad  -559038737,XT_CELLS
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,115 
 .p2align 3
XT_CELLS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,3 ,XT_LSHIFT,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,45 
 .p2align 3
_XT_CELLMINUS:
 .quad  -559038737,XT_CELLMINUS
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,45 
 .p2align 3
XT_CELLMINUS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,-8 ,XT_PLUS,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,33 
 .p2align 3
_XT_TWOSTORE:
 .quad  -559038737,XT_TWOSTORE
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,33 
 .p2align 3
XT_TWOSTORE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_OVER,XT_STORE,XT_CELLPLUS,XT_STORE,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,64 
 .p2align 3
_XT_TWOFETCH:
 .quad  -559038737,XT_TWOFETCH
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,50 ,64 
 .p2align 3
XT_TWOFETCH:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_CELLPLUS,XT_FETCH,XT_SWAP,XT_FETCH,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 7 ,97 ,108 ,105 ,103 ,110 ,101 ,100 
 .p2align 3
_XT_ALIGNED:
 .quad  -559038737,XT_ALIGNED
#else
 .p2align 3
 .quad 1b
1:
  .byte 7 ,97 ,108 ,105 ,103 ,110 ,101 ,100 
 .p2align 3
XT_ALIGNED:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,7 ,XT_PLUS,XT_DOLIT,-8 ,XT_AND,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 5 ,97 ,108 ,105 ,103 ,110 
 .p2align 3
XT_ALIGN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HERE,XT_ALIGNED,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,45 ,114 ,111 ,116 
 .p2align 3
XT_MINUSROT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ROT,XT_ROT,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 4 ,102 ,105 ,108 ,108 
 .p2align 3
_XT_FILL:
 .quad  -559038737,XT_FILL
#else
 .p2align 3
 .quad 1b
1:
  .byte 4 ,102 ,105 ,108 ,108 
 .p2align 3
XT_FILL:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_MINUSROT,XT_DOLIT,0 ,XT_DOQDO,6 ,XT_TWODUP,XT_CSTORE,XT_CHARPLUS,XT_DOLOOP,-4 ,XT_UNLOOP,XT_TWODROP,XT_EXIT
#endif

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,111 ,117 ,110 ,116 
 .p2align 3
_XT_COUNT:
 .quad  -559038737,XT_COUNT
#else
 .p2align 3
 .quad 1b
1:
  .byte 5 ,99 ,111 ,117 ,110 ,116 
 .p2align 3
XT_COUNT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_CHARPLUS,XT_SWAP,XT_CFETCH,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 9 ,110 ,97 ,109 ,101 ,99 ,111 ,117 ,110 ,116 
 .p2align 3
XT_NAMECOUNT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_COUNT,XT_DOLIT,31 ,XT_AND,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,112 ,108 ,97 ,99 ,101 
 .p2align 3
XT_PLACE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_DOLIT,255 ,XT_UGTEQUALS,XT_DOQTHROW,-18 ,XT_OVER,XT_GTR,XT_ROT,XT_OVER,XT_ONEPLUS,XT_RGT,XT_MOVE,XT_CSTORE,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 2 ,43 ,33 
 .p2align 3
_XT_PLUSSTORE:
 .quad  -559038737,XT_PLUSSTORE
#else
 .p2align 3
 .quad 1b
1:
  .byte 2 ,43 ,33 
 .p2align 3
XT_PLUSSTORE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_FETCH,XT_UNDERPLUS,XT_STORE,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 5 ,97 ,108 ,108 ,111 ,116 
 .p2align 3
XT_ALLOT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HERE,XT_PLUS,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,44 
 .p2align 3
XT_COMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HERE,XT_STORE,XT_DOLIT,8 ,XT_ALLOT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 3 ,111 ,102 ,102 
 .p2align 3
XT_OFF:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_SWAP,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,111 ,110 
 .p2align 3
XT_ON:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,-1 ,XT_SWAP,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,115 ,111 ,117 ,114 ,99 ,101 
 .p2align 3
XT_SOURCE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SOURCEVAR,XT_TWOFETCH,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,47 ,115 ,116 ,114 ,105 ,110 ,103 
 .p2align 3
XT_SLASHSTRING:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_RFETCH,XT_UNDERPLUS,XT_RGT,XT_MINUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,117 ,110 ,112 ,97 ,114 ,115 ,101 ,100 
 .p2align 3
XT_UNPARSED:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SOURCE,XT_GTIN,XT_FETCH,XT_SLASHSTRING,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 9 ,117 ,110 ,112 ,97 ,114 ,115 ,101 ,100 ,33 
 .p2align 3
XT_UNPARSEDSTORE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SOURCE,XT_MINUSROT,XT_MINUS,XT_UMIN,XT_GTIN,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,115 ,99 ,97 ,110 
 .p2align 3
XT_SCAN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_DUP,XT_ZEROBRANCH,12 ,XT_OVER,XT_CFETCH,XT_RFETCH,XT_XOR,XT_ZEROBRANCH,6 ,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-13 ,XT_RDROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,115 ,107 ,105 ,112 
 .p2align 3
XT_SKIP:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_DUP,XT_ZEROBRANCH,12 ,XT_OVER,XT_CFETCH,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,6 ,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-13 ,XT_RDROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,112 ,97 ,114 ,115 ,101 
 .p2align 3
XT_PARSE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_UNPARSED,XT_OVER,XT_SWAP,XT_RGT,XT_SCAN,XT_DROP,XT_OVER,XT_MINUS,XT_TWODUP,XT_PLUS,XT_ONEPLUS,XT_UNPARSEDSTORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 9 ,115 ,107 ,105 ,112 ,112 ,97 ,114 ,115 ,101 
 .p2align 3
XT_SKIPPARSE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_UNPARSED,XT_RFETCH,XT_SKIP,XT_DROP,XT_UNPARSEDSTORE,XT_RGT,XT_PARSE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 10 ,112 ,97 ,114 ,115 ,101 ,45 ,119 ,111 ,114 ,100 
 .p2align 3
XT_PARSEMINUSWORD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_BL,XT_SKIPPARSE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,35 ,111 ,114 ,100 ,101 ,114 
 .p2align 3
XT_NUMBERORDER:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad XT_NOOP
 .quad 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 
 .p2align 3
 .quad 1b
1:
  .byte 7 ,110 ,97 ,109 ,101 ,62 ,120 ,116 
 .p2align 3
XT_NAMEGTXT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_NAMECOUNT,XT_PLUS,XT_ALIGNED,XT_DUP,XT_FETCH,XT_DOLIT,-559038737 ,XT_EQUALS,XT_ZEROBRANCH,3 ,XT_CELLPLUS,XT_FETCH,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,98 ,111 ,117 ,110 ,100 ,115 
 .p2align 3
XT_BOUNDS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_PLUS,XT_SWAP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,108 ,105 ,110 ,107 ,63 
 .p2align 3
XT_LINKQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_ZEROEQUALS,XT_SWAP,XT_DICTQ,XT_OR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,110 ,97 ,109 ,101 ,63 
 .p2align 3
XT_NAMEQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_RFETCH,XT_NAMEGTXT,XT_EQUALS,XT_RFETCH,XT_CELLMINUS,XT_FETCH,XT_LINKQ,XT_AND,XT_RGT,XT_NAMECOUNT,XT_DOLIT,0 ,XT_SCAN,XT_NIP,XT_ZEROEQUALS,XT_AND,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,99 ,111 ,108 ,110 ,97 ,109 ,101 
 .p2align 3
XT_COLNAME:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_QDODEFINE,XT_NIP,XT_ZEROEQUALS,XT_ZEROBRANCH,5 ,XT_DROP,XT_DOLIT,0 ,XT_EXIT,XT_DUP,XT_DOLIT,-32 ,XT_BOUNDS,XT_DODO,XT_DUP,XT_I,XT_NAMEQ,XT_ZEROBRANCH,5 ,XT_DROP,XT_I,XT_UNLOOP,XT_EXIT,XT_DOLIT,-1 ,XT_CELLS,XT_DOPLUSLOOP,-13 ,XT_UNLOOP,XT_DROP,XT_DOLIT,0 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,112 ,114 ,105 ,109 ,110 ,97 ,109 ,101 
 .p2align 3
XT_PRIMNAME:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_XTOF,XT_COLD,XT_COLNAME,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,-7 ,XT_RDROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 10 ,102 ,111 ,114 ,119 ,111 ,114 ,100 ,115 ,105 ,110 
 .p2align 3
XT_FORWORDSIN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_DOTO,XT_FOUND,XT_GTR,XT_CELLPLUS,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_FOUND,XT_ZEROEQUALS,XT_AND,XT_ZEROBRANCH,5 ,XT_RFETCH,XT_EXECUTE,XT_BRANCH,-11 ,XT_DROP,XT_RDROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,102 ,111 ,114 ,119 ,111 ,114 ,100 ,115 
 .p2align 3
XT_FORWORDS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_NUMBERORDER,XT_CELLPLUS,XT_NUMBERORDER,XT_FETCH,XT_CELLS,XT_BOUNDS,XT_DOQDO,15 ,XT_I,XT_FETCH,XT_J,XT_FORWORDSIN,XT_FOUND,XT_ZEROBRANCH,3 ,XT_BRANCH,6 ,XT_DOLIT,1 ,XT_CELLS,XT_DOPLUSLOOP,-13 ,XT_UNLOOP,XT_RDROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,109 ,97 ,116 ,99 ,104 ,63 
 .p2align 3
XT_MATCHQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_NAMECOUNT,XT_PARSED,XT_FETCH,XT_EQUALS,XT_ZEROBRANCH,12 ,XT_PARSED,XT_TWOFETCH,XT_ISAMEQ,XT_ZEROEQUALS,XT_ZEROBRANCH,4 ,XT_DUP,XT_DOTO,XT_FOUND,XT_BRANCH,2 ,XT_DROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,110 ,102 ,97 ,105 ,110 
 .p2align 3
XT_NFAIN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_GTR,XT_PARSED,XT_TWOSTORE,XT_RGT,XT_XTOF,XT_MATCHQ,XT_FORWORDSIN,XT_FOUND,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 3 ,110 ,102 ,97 
 .p2align 3
XT_NFA:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_PARSED,XT_TWOSTORE,XT_XTOF,XT_MATCHQ,XT_FORWORDS,XT_FOUND,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,102 ,105 ,109 ,109 ,101 ,100 
 .p2align 3
XT_FIMMED:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_CFETCH,XT_DOLIT,64 ,XT_AND,XT_ZEROEQUALS,XT_TWOSTAR,XT_ONEPLUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,47 ,102 ,99 ,111 ,109 ,112 ,111 
 .p2align 3
XT_SLASHFCOMPO:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_CFETCH,XT_DOLIT,32 ,XT_AND,XT_ZEROEQUALS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,39 ,110 ,102 ,97 
 .p2align 3
XT_TICKNFA:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_PARSEMINUSWORD,XT_NFA,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,-13 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,39 
 .p2align 3
XT_TICK:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TICKNFA,XT_NAMEGTXT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,116 ,121 ,112 ,101 
 .p2align 3
XT_TYPE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_BOUNDS,XT_DOQDO,6 ,XT_I,XT_CFETCH,XT_EMIT,XT_DOLOOP,-4 ,XT_UNLOOP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,114 ,101 ,100 ,101 ,102 ,115 ,116 ,114 
 .p2align 3
XT_REDEFSTR:
 nop
 nop
 nop
 call XT_DOVAR
  .byte 10 ,114 ,101 ,100 ,101 ,102 ,105 ,110 ,101 ,100 ,32 

 .p2align 3
 .quad 1b
1:
  .byte 7 ,40 ,104 ,101 ,97 ,100 ,44 ,41 
 .p2align 3
XT_LPARENHEADCOMMARPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_QDICT,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,-16 ,XT_DUP,XT_DOLIT,31 ,XT_GT,XT_DOQTHROW,-19 ,XT_TWODUP,XT_GETMINUSCURRENT,XT_NFAIN,XT_ZEROBRANCH,11 ,XT_WARNINGS,XT_FETCH,XT_ZEROBRANCH,7 ,XT_REDEFSTR,XT_COUNT,XT_TYPE,XT_TWODUP,XT_TYPE,XT_SPACE,XT_ALIGN,XT_GETMINUSCURRENT,XT_FETCH,XT_COMMA,XT_HERE,XT_DOTO,XT_LASTNAME,XT_SCOMMA,XT_ALIGN,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,104 ,101 ,97 ,100 ,44 
 .p2align 3
XT_HEADCOMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_PARSEMINUSWORD,XT_LPARENHEADCOMMARPAREN,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,104 ,111 ,108 ,100 
 .p2align 3
XT_HOLD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HLD,XT_ONEMINUS,XT_DOTO,XT_HLD,XT_HLD,XT_CSTORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,60 ,35 
 .p2align 3
XT_LTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HLDZERO,XT_DOTO,XT_HLD,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,35 
 .p2align 3
XT_NUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,0 ,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_GTR,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_SWAP,XT_DOLIT,9 ,XT_OVER,XT_LT,XT_DOLIT,7 ,XT_AND,XT_PLUS,XT_DOLIT,48 ,XT_PLUS,XT_HOLD,XT_RGT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,35 ,115 
 .p2align 3
XT_NUMBERS:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_NUMBER,XT_TWODUP,XT_OR,XT_ZEROEQUALS,XT_ZEROBRANCH,-5 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,35 ,62 
 .p2align 3
XT_NUMBERGT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODROP,XT_HLD,XT_HLDZERO,XT_OVER,XT_MINUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,115 ,105 ,103 ,110 
 .p2align 3
XT_SIGN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_DOLIT,45 ,XT_HOLD,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,40 ,100 ,46 ,41 
 .p2align 3
XT_LPARENDDOTRPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_OVER,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DNEGATE,XT_LTNUMBER,XT_NUMBERS,XT_ROT,XT_SIGN,XT_NUMBERGT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,100 ,46 
 .p2align 3
XT_DDOT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_LPARENDDOTRPAREN,XT_TYPE,XT_SPACE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,46 
 .p2align 3
XT_DOT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SGTD,XT_DDOT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 97 ,91 
 .p2align 3
XT_LBRACKET:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_STATE,XT_OFF,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,93 
 .p2align 3
XT_RBRACKET:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_STATE,XT_ON,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 9 ,112 ,114 ,105 ,110 ,116 ,97 ,98 ,108 ,101 
 .p2align 3
XT_PRINTABLE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_SPAN,XT_FETCH,XT_UGTEQUALS,XT_AND,XT_DUP,XT_GTR,XT_ZEROBRANCH,12 ,XT_OVER,XT_SPAN,XT_FETCH,XT_PLUS,XT_RFETCH,XT_SWAP,XT_CSTORE,XT_DOLIT,1 ,XT_SPAN,XT_PLUSSTORE,XT_RGT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,97 ,99 ,99 ,101 ,112 ,116 
 .p2align 3
XT_ACCEPT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TWODUP,XT_BL,XT_FILL,XT_SPAN,XT_OFF,XT_EKEY,XT_KEYHANDLER,XT_DOLIT,10 ,XT_EQUALS,XT_ZEROBRANCH,-6 ,XT_TWODROP,XT_DOLIT,-1 ,XT_SPAN,XT_PLUSSTORE,XT_SPAN,XT_FETCH,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,40 ,114 ,101 ,102 ,105 ,108 ,108 ,41 
 .p2align 3
XT_LPARENREFILLRPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TIB,XT_DUP,XT_DOLIT,512 ,XT_ACCEPT,XT_SOURCEVAR,XT_TWOSTORE,XT_GTIN,XT_OFF,XT_DOLIT,-1 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,99 ,111 ,109 ,112 ,105 ,108 ,101 ,44 
 .p2align 3
XT_COMPILECOMMA:
 nop
 nop
 nop
 call XT_DOCREATE

 .quad  XT_FETCHEXECUTE
 .quad 0 
 .p2align 3
 .quad 1b
1:
  .byte 9 ,40 ,99 ,111 ,109 ,112 ,105 ,108 ,101 ,41 
 .p2align 3
XT_LPARENCOMPILERPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCHRPLUS,XT_COMPILECOMMA,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 36 ,120 ,116 ,111 ,102 
 .p2align 3
XT_XTOF:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCHRPLUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,108 ,111 ,119 ,101 ,114 ,63 
 .p2align 3
XT_LOWERQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,97 ,XT_DOLIT,123 ,XT_WITHIN,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,116 ,111 ,117 ,112 ,112 ,101 ,114 
 .p2align 3
XT_TOUPPER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_LOWERQ,XT_DOLIT,-32 ,XT_AND,XT_PLUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,100 ,105 ,103 ,105 ,116 
 .p2align 3
XT_DIGIT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TOUPPER,XT_DUP,XT_DOLIT,58 ,XT_DOLIT,65 ,XT_WITHIN,XT_DOLIT,128 ,XT_AND,XT_PLUS,XT_DUP,XT_DOLIT,65 ,XT_UGTEQUALS,XT_DOLIT,7 ,XT_AND,XT_MINUS,XT_DOLIT,48 ,XT_MINUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,105 ,103 ,105 ,116 ,63 
 .p2align 3
XT_DIGITQ:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DIGIT,XT_BASE,XT_FETCH,XT_ULT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,97 ,99 ,99 ,117 ,109 
 .p2align 3
XT_ACCUM:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SWAP,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DROP,XT_ROT,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DPLUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,62 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_GTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_BASE,XT_FETCH,XT_GTR,XT_OVER,XT_CFETCH,XT_DOLIT,35 ,XT_EQUALS,XT_ZEROBRANCH,13 ,XT_TWOSWAP,XT_DROP,XT_BASE,XT_STORE,XT_DOLIT,0 ,XT_DOLIT,0 ,XT_TWOSWAP,XT_DOLIT,1 ,XT_SLASHSTRING,XT_OVER,XT_CFETCH,XT_DIGITQ,XT_OVER,XT_AND,XT_ZEROBRANCH,14 ,XT_GTR,XT_GTR,XT_RFETCH,XT_CFETCH,XT_DIGIT,XT_ACCUM,XT_RGT,XT_RGT,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-38 ,XT_RGT,XT_BASE,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 10 ,115 ,62 ,117 ,100 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_SGTUDNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DOLIT,-1 ,XT_DPL,XT_STORE,XT_DOLIT,0 ,XT_DOLIT,0 ,XT_TWOSWAP,XT_GTNUMBER,XT_DUP,XT_ZEROBRANCH,17 ,XT_OVER,XT_CFETCH,XT_DOLIT,46 ,XT_LTGT,XT_DOQTHROW,-13 ,XT_DUP,XT_ONEMINUS,XT_DPL,XT_STORE,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-19 ,XT_TWODROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 9 ,115 ,62 ,100 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_SGTDNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_OVER,XT_CFETCH,XT_DOLIT,45 ,XT_EQUALS,XT_GTR,XT_RFETCH,XT_NEGATE,XT_SLASHSTRING,XT_SGTUDNUMBER,XT_RGT,XT_ZEROBRANCH,2 ,XT_DNEGATE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 9 ,115 ,62 ,117 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_SGTUNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SGTUDNUMBER,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,115 ,62 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_SGTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_SGTDNUMBER,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 103 ,108 ,105 ,116 ,101 ,114 ,97 ,108 
 .p2align 3
XT_LITERAL:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_LPARENCOMPILERPAREN,XT_DOLIT,XT_COMMA,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,111 ,50 ,108 ,105 ,116 
 .p2align 3
XT_DOTWOLIT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCHRPLUS,XT_FETCHRPLUS,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 104 ,50 ,108 ,105 ,116 ,101 ,114 ,97 ,108 
 .p2align 3
XT_TWOLITERAL:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_LPARENCOMPILERPAREN,XT_DOTWOLIT,XT_SWAP,XT_COMMA,XT_COMMA,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,111 ,119 ,111 ,114 ,100 
 .p2align 3
XT_DOWORD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DUP,XT_SLASHFCOMPO,XT_STATE,XT_FETCH,XT_OR,XT_ZEROEQUALS,XT_DOQTHROW,-14 ,XT_DUP,XT_NAMEGTXT,XT_SWAP,XT_FIMMED,XT_ZEROLT,XT_STATE,XT_FETCH,XT_AND,XT_ZEROBRANCH,4 ,XT_COMPILECOMMA,XT_BRANCH,2 ,XT_EXECUTE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 8 ,100 ,111 ,110 ,117 ,109 ,98 ,101 ,114 
 .p2align 3
XT_DONUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_PARSED,XT_TWOFETCH,XT_SGTNUMBER,XT_STATE,XT_FETCH,XT_ZEROBRANCH,10 ,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_LITERAL,XT_BRANCH,2 ,XT_TWOLITERAL,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 11 ,40 ,105 ,110 ,116 ,101 ,114 ,112 ,114 ,101 ,116 ,41 
 .p2align 3
XT_LPARENINTERPRETRPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_DEPTH,XT_ZEROLT,XT_DOQTHROW,-4 ,XT_PARSEMINUSWORD,XT_DUP,XT_ZEROBRANCH,11 ,XT_NFA,XT_QDUP,XT_ZEROBRANCH,4 ,XT_DOWORD,XT_BRANCH,2 ,XT_DONUMBER,XT_BRANCH,-17 ,XT_TWODROP,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 5 ,101 ,120 ,115 ,116 ,114 
 .p2align 3
XT_EXSTR:
 nop
 nop
 nop
 call XT_DOVAR
  .byte 13 ,32 ,101 ,120 ,99 ,101 ,112 ,116 ,105 ,111 ,110 ,32 ,35 ,32 

 .p2align 3
 .quad 1b
1:
  .byte 4 ,46 ,101 ,114 ,114 
 .p2align 3
XT_DOTERR:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_PARSED,XT_TWOFETCH,XT_TYPE,XT_EXSTR,XT_COUNT,XT_TYPE,XT_DOT,XT_CR,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,113 ,117 ,105 ,116 
 .p2align 3
XT_QUIT:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_RPZERO,XT_FETCH,XT_RPSTORE,XT_DOLIT,0 ,XT_DOTO,XT_SOURCEMINUSID,XT_LBRACKET,XT_REFILL,XT_DROP,XT_XTOF,XT_INTERPRET,XT_CATCH,XT_DOTERRORSTORE,XT_QDUP,XT_ZEROEQUALS,XT_ZEROBRANCH,9 ,XT_STATE,XT_FETCH,XT_ZEROEQUALS,XT_ZEROBRANCH,2 ,XT_DOTPROMPT,XT_BRANCH,-17 ,XT_DOTERROR,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_BRANCH,-31 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 7 ,58 ,110 ,111 ,110 ,97 ,109 ,101 
 .p2align 3
XT_COLONNONAME:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HASNAMEQ,XT_OFF,XT_RBRACKET,XT_HERE,XT_DOTO,XT_LASTXT,XT_XTOF,XT_DOLIST,XT_XTCOMMA,XT_DUP,XT_DOLIT,-1 ,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 1 ,58 
 .p2align 3
XT_COLON:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HEADCOMMA,XT_COLONNONAME,XT_ROT,XT_DROP,XT_HASNAMEQ,XT_ON,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,117 ,109 ,109 ,121 ,49 
 .p2align 3
XT_DUMMYONE:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .p2align 3
 .quad 1b
1:
  .byte 8 ,108 ,105 ,110 ,107 ,108 ,97 ,115 ,116 
 .p2align 3
XT_LINKLAST:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_LASTNAME,XT_GETMINUSCURRENT,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,114 ,101 ,118 ,101 ,97 ,108 
 .p2align 3
XT_REVEAL:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HASNAMEQ,XT_FETCH,XT_ZEROBRANCH,2 ,XT_LINKLAST,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 97 ,59 
 .p2align 3
XT_SEMI:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_NIP,XT_ONEPLUS,XT_DOQTHROW,-22 ,XT_REVEAL,XT_LPARENCOMPILERPAREN,XT_EXIT,XT_LBRACKET,XT_EXIT

#if BUILD_MOREPRIMS
 .p2align 3
 .quad 1b
1:
  .byte 36 ,100 ,111 ,116 ,111 
 .p2align 3
_XT_DOTO:
 .quad  -559038737,XT_DOTO
#else
 .p2align 3
 .quad 1b
1:
  .byte 36 ,100 ,111 ,116 ,111 
 .p2align 3
XT_DOTO:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCHRPLUS,XT_DOLIT,8 ,XT_PLUS,XT_STORE,XT_EXIT
#endif

 .p2align 3
 .quad 1b
1:
  .byte 104 ,112 ,111 ,115 ,116 ,112 ,111 ,110 ,101 
 .p2align 3
XT_POSTPONE:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_TICKNFA,XT_DUP,XT_NAMEGTXT,XT_SWAP,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,5 ,XT_LPARENCOMPILERPAREN,XT_LPARENCOMPILERPAREN,XT_COMMA,XT_EXIT,XT_COMPILECOMMA,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 2 ,115 ,44 
 .p2align 3
XT_SCOMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_HERE,XT_OVER,XT_CHARPLUS,XT_ALLOT,XT_PLACE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,40 ,105 ,115 ,41 
 .p2align 3
XT_LPARENISRPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_FETCHRPLUS,XT_DOLIT,16 ,XT_PLUS,XT_STORE,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 4 ,99 ,111 ,108 ,100 
 .p2align 3
XT_COLD:
 nop
 nop
 nop
 call XT_DOLIST
 .quad XT_XTOF,XT_DICTZERO,XT_CELLMINUS,XT_DUP,XT_FETCH,XT_DOLIT,-17974594 ,XT_EQUALS,XT_ZEROBRANCH,-7 ,XT_XTOF,XT_DICTZERO,XT_DOLIT,8 ,XT_PLUS,XT_STORE,XT_XTOF,XT_DUMMYTWO,XT_COLNAME,XT_DOTO,XT_HERE,XT_DICTZERO,XT_DOLIT,524288 ,XT_PLUS,XT_DUP,XT_DOTO,XT_MEMTOP,XT_CELLMINUS,XT_DUP,XT_USERP,XT_STORE,XT_DOLIT,512 ,XT_MINUS,XT_DUP,XT_RPZERO,XT_STORE,XT_DOLIT,2048 ,XT_MINUS,XT_DUP,XT_SPZERO,XT_STORE,XT_DOLIT,2048 ,XT_MINUS,XT_DOLIT,512 ,XT_MINUS,XT_DUP,XT_DOTO,XT_PAD,XT_DOLIT,512 ,XT_MINUS,XT_DUP,XT_DOTO,XT_TIB,XT_DUP,XT_DOTO,XT_HLDZERO,XT_DOLIT,512 ,XT_MINUS,XT_DUP,XT_DOTO,XT_DICTTOP,XT_DROP,XT_DOLIT,10 ,XT_BASE,XT_STORE,XT_XTOF,XT_RXQ,XT_LPARENISRPAREN,XT_EKEYQ,XT_XTOF,XT_RXFETCH,XT_LPARENISRPAREN,XT_EKEY,XT_XTOF,XT_TXQ,XT_LPARENISRPAREN,XT_EMITQ,XT_XTOF,XT_TXSTORE,XT_LPARENISRPAREN,XT_EMIT,XT_XTOF,XT_PRINTABLE,XT_LPARENISRPAREN,XT_KEYHANDLER,XT_XTOF,XT_LPARENINTERPRETRPAREN,XT_LPARENISRPAREN,XT_INTERPRET,XT_XTOF,XT_DOTERR,XT_LPARENISRPAREN,XT_DOTERROR,XT_XTOF,XT_NOOP,XT_LPARENISRPAREN,XT_DOTERRORSTORE,XT_XTOF,XT_COMMA,XT_LPARENISRPAREN,XT_COMPILECOMMA,XT_XTOF,XT_NOOP,XT_LPARENISRPAREN,XT_DOTPROMPT,XT_XTOF,XT_LPARENREFILLRPAREN,XT_LPARENISRPAREN,XT_REFILL,XT_XTOF,XT_FORTHMINUSWORDLIST,XT_COLNAME,XT_DOLIT,3 ,XT_CELLS,XT_MINUS,XT_DOTO,XT_FORTHMINUSWORDLIST,XT_XTOF,XT_COLD,XT_COLNAME,XT_FORTHMINUSWORDLIST,XT_STORE,XT_FORTHMINUSWORDLIST,XT_DOTO,XT_GETMINUSCURRENT,XT_GETMINUSCURRENT,XT_DOLIT,1 ,XT_NUMBERORDER,XT_TWOSTORE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_QUIT,XT_EXIT

 .p2align 3
 .quad 1b
1:
  .byte 6 ,100 ,117 ,109 ,109 ,121 ,50 
 .p2align 3
XT_DUMMYTWO:
 nop
 nop
 nop
 call XT_DOVAR
 .quad -559038737 
 .fill 501704 ,1,0
 .quad  0xcacacaca
#if BUILD_PROFILE
 .globl Forth_Prof
 .globl _Forth_Prof
Forth_Prof:
_Forth_Prof:
 .fill 524288 ,1,0
#endif
_Forth_End:
Forth_End:
