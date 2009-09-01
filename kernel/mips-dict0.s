.set noreorder
.set noat
.set nomacro
 .globl Forth_Entry 
 .globl Forth_UserP
 .globl Forth_Here
 .data
 .balign 4
 .long 0xfeedbabe, 0xdeadbeef
Forth_Entry: .long XT_COLD
Forth_UserP: .long XT_USERP
Forth_Here: .long XT_HERE


 .balign 4
 .long 0
1:
  .byte 5 ,100 ,105 ,99 ,116 ,48 
 .balign 4
XT_DICTZERO:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 7 ,100 ,105 ,99 ,116 ,116 ,111 ,112 
 .balign 4
XT_DICTTOP:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 10 ,115 ,105 ,103 ,104 ,97 ,110 ,100 ,108 ,101 ,114 
 .balign 4
XT_SIGHANDLER:
 bal XT_DOUSER
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 10 ,116 ,104 ,114 ,111 ,119 ,102 ,114 ,97 ,109 ,101 
 .balign 4
XT_THROWFRAME:
 bal XT_DOUSER
 nop 
 .long -4 

 .balign 4
 .long 1b
1:
  .byte 3 ,100 ,112 ,108 
 .balign 4
XT_DPL:
 bal XT_DOUSER
 nop 
 .long -8 

 .balign 4
 .long 1b
1:
  .byte 3 ,115 ,112 ,48 
 .balign 4
XT_SPZERO:
 bal XT_DOUSER
 nop 
 .long -12 

 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,112 ,48 
 .balign 4
XT_RPZERO:
 bal XT_DOUSER
 nop 
 .long -16 

 .balign 4
 .long 1b
1:
  .byte 8 ,116 ,97 ,115 ,107 ,110 ,97 ,109 ,101 
 .balign 4
XT_TASKNAME:
 bal XT_DOUSER
 nop 
 .long -20 

 .balign 4
 .long 1b
1:
  .byte 6 ,112 ,97 ,114 ,115 ,101 ,100 
 .balign 4
XT_PARSED:
 bal XT_DOVAR
 nop 
 .long -559038737 ,0 

 .balign 4
 .long 1b
1:
  .byte 9 ,115 ,111 ,117 ,114 ,99 ,101 ,118 ,97 ,114 
 .balign 4
XT_SOURCEVAR:
 bal XT_DOVAR
 nop 
 .long -559038737 ,0 

 .balign 4
 .long 1b
1:
  .byte 3 ,104 ,108 ,100 
 .balign 4
XT_HLD:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 5 ,117 ,115 ,101 ,114 ,112 
 .balign 4
XT_USERP:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 8 ,119 ,97 ,114 ,110 ,105 ,110 ,103 ,115 
 .balign 4
XT_WARNINGS:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 4 ,98 ,97 ,115 ,101 
 .balign 4
XT_BASE:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 3 ,62 ,105 ,110 
 .balign 4
XT_GTIN:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 4 ,115 ,112 ,97 ,110 
 .balign 4
XT_SPAN:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,116 ,97 ,116 ,101 
 .balign 4
XT_STATE:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 8 ,104 ,97 ,115 ,110 ,97 ,109 ,101 ,63 
 .balign 4
XT_HASNAMEQ:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 11 ,103 ,101 ,116 ,45 ,99 ,117 ,114 ,114 ,101 ,110 ,116 
 .balign 4
XT_GETMINUSCURRENT:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 6 ,109 ,101 ,109 ,116 ,111 ,112 
 .balign 4
XT_MEMTOP:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 8 ,108 ,97 ,115 ,116 ,110 ,97 ,109 ,101 
 .balign 4
XT_LASTNAME:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 6 ,108 ,97 ,115 ,116 ,120 ,116 
 .balign 4
XT_LASTXT:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 4 ,104 ,101 ,114 ,101 
 .balign 4
XT_HERE:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 9 ,115 ,111 ,117 ,114 ,99 ,101 ,45 ,105 ,100 
 .balign 4
XT_SOURCEMINUSID:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 3 ,112 ,97 ,100 
 .balign 4
XT_PAD:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 3 ,116 ,105 ,98 
 .balign 4
XT_TIB:
 bal XT_DOVALUE
 nop 
 .long -1414673666 

 .balign 4
 .long 1b
1:
  .byte 5 ,102 ,111 ,117 ,110 ,100 
 .balign 4
XT_FOUND:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 8 ,108 ,97 ,115 ,116 ,117 ,115 ,101 ,114 
 .balign 4
XT_LASTUSER:
 bal XT_DOVALUE
 nop 
 .long -24 ,0 ,0 

 .balign 4
 .long 1b
1:
  .byte 14 ,102 ,111 ,114 ,116 ,104 ,45 ,119 ,111 ,114 ,100 ,108 ,105 ,115 ,116 
 .balign 4
XT_FORTHMINUSWORDLIST:
 bal XT_DOVALUE
 nop 
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 2 ,98 ,108 
 .balign 4
XT_BL:
 bal XT_DOCONST
 nop 
 .long 32 

 .balign 4
 .long 1b
1:
  .byte 3 ,117 ,109 ,43 
 .balign 4
_XT_UMPLUS:
 .long  -559038737,XT_UMPLUS


 .balign 4
 .long 1b
1:
  .byte 3 ,97 ,110 ,100 
 .balign 4
_XT_AND:
 .long  -559038737,XT_AND


 .balign 4
 .long 1b
1:
  .byte 2 ,50 ,42 
 .balign 4
_XT_TWOSTAR:
 .long  -559038737,XT_TWOSTAR


 .balign 4
 .long 1b
1:
  .byte 2 ,50 ,47 
 .balign 4
_XT_TWOSLASH:
 .long  -559038737,XT_TWOSLASH


 .balign 4
 .long 1b
1:
  .byte 3 ,120 ,111 ,114 
 .balign 4
_XT_XOR:
 .long  -559038737,XT_XOR


 .balign 4
 .long 1b
1:
  .byte 2 ,111 ,114 
 .balign 4
_XT_OR:
 .long  -559038737,XT_OR


 .balign 4
 .long 1b
1:
  .byte 2 ,48 ,60 
 .balign 4
_XT_ZEROLT:
 .long  -559038737,XT_ZEROLT


 .balign 4
 .long 1b
1:
  .byte 2 ,48 ,61 
 .balign 4
_XT_ZEROEQUALS:
 .long  -559038737,XT_ZEROEQUALS


 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,120 ,63 
 .balign 4
_XT_RXQ:
 .long  -559038737,XT_RXQ


 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,120 ,64 
 .balign 4
_XT_RXFETCH:
 .long  -559038737,XT_RXFETCH


 .balign 4
 .long 1b
1:
  .byte 3 ,116 ,120 ,63 
 .balign 4
_XT_TXQ:
 .long  -559038737,XT_TXQ


 .balign 4
 .long 1b
1:
  .byte 3 ,116 ,120 ,33 
 .balign 4
_XT_TXSTORE:
 .long  -559038737,XT_TXSTORE


 .balign 4
 .long 1b
1:
  .byte 4 ,100 ,114 ,111 ,112 
 .balign 4
_XT_DROP:
 .long  -559038737,XT_DROP


 .balign 4
 .long 1b
1:
  .byte 3 ,100 ,117 ,112 
 .balign 4
_XT_DUP:
 .long  -559038737,XT_DUP


 .balign 4
 .long 1b
1:
  .byte 4 ,111 ,118 ,101 ,114 
 .balign 4
_XT_OVER:
 .long  -559038737,XT_OVER


 .balign 4
 .long 1b
1:
  .byte 4 ,115 ,119 ,97 ,112 
 .balign 4
_XT_SWAP:
 .long  -559038737,XT_SWAP


 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,112 ,64 
 .balign 4
_XT_RPFETCH:
 .long  -559038737,XT_RPFETCH


 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,112 ,33 
 .balign 4
_XT_RPSTORE:
 .long  -559038737,XT_RPSTORE


 .balign 4
 .long 1b
1:
  .byte 3 ,115 ,112 ,64 
 .balign 4
_XT_SPFETCH:
 .long  -559038737,XT_SPFETCH


 .balign 4
 .long 1b
1:
  .byte 3 ,115 ,112 ,33 
 .balign 4
_XT_SPSTORE:
 .long  -559038737,XT_SPSTORE


 .balign 4
 .long 1b
1:
  .byte 1 ,33 
 .balign 4
_XT_STORE:
 .long  -559038737,XT_STORE


 .balign 4
 .long 1b
1:
  .byte 1 ,64 
 .balign 4
_XT_FETCH:
 .long  -559038737,XT_FETCH


 .balign 4
 .long 1b
1:
  .byte 2 ,99 ,33 
 .balign 4
_XT_CSTORE:
 .long  -559038737,XT_CSTORE


 .balign 4
 .long 1b
1:
  .byte 2 ,99 ,64 
 .balign 4
_XT_CFETCH:
 .long  -559038737,XT_CFETCH


 .balign 4
 .long 1b
1:
  .byte 4 ,109 ,111 ,118 ,101 
 .balign 4
_XT_MOVE:
 .long  -559038737,XT_MOVE


 .balign 4
 .long 1b
1:
  .byte 6 ,105 ,115 ,97 ,109 ,101 ,63 
 .balign 4
_XT_ISAMEQ:
 .long  -559038737,XT_ISAMEQ


 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,97 ,109 ,101 ,63 
 .balign 4
_XT_SAMEQ:
 .long  -559038737,XT_SAMEQ


 .balign 4
 .long 1b
1:
  .byte 7 ,101 ,120 ,101 ,99 ,117 ,116 ,101 
 .balign 4
_XT_EXECUTE:
 .long  -559038737,XT_EXECUTE


 .balign 4
 .long 1b
1:
  .byte 7 ,101 ,110 ,100 ,116 ,105 ,99 ,107 
 .balign 4
_XT_ENDTICK:
 .long  -559038737,XT_ENDTICK


 .balign 4
 .long 1b
1:
  .byte 3 ,98 ,121 ,101 
 .balign 4
_XT_BYE:
 .long  -559038737,XT_BYE


 .balign 4
 .long 1b
1:
  .byte 9 ,63 ,100 ,111 ,100 ,101 ,102 ,105 ,110 ,101 
 .balign 4
_XT_QDODEFINE:
 .long  -559038737,XT_QDODEFINE


 .balign 4
 .long 1b
1:
  .byte 3 ,120 ,116 ,44 
 .balign 4
_XT_XTCOMMA:
 .long  -559038737,XT_XTCOMMA


 .balign 4
 .long 1b
1:
  .byte 2 ,109 ,115 
 .balign 4
_XT_MS:
 .long  -559038737,XT_MS


 .balign 4
 .long 1b
1:
  .byte 9 ,116 ,105 ,109 ,101 ,38 ,100 ,97 ,116 ,101 
 .balign 4
_XT_TIMEANDDATE:
 .long  -559038737,XT_TIMEANDDATE


 .balign 4
 .long 1b
1:
  .byte 40 ,100 ,111 ,99 ,114 ,101 ,97 ,116 ,101 
 .balign 4
_XT_DOCREATE:
 .long  -559038737,XT_DOCREATE


 .balign 4
 .long 1b
1:
  .byte 37 ,100 ,111 ,108 ,105 ,116 
 .balign 4
_XT_DOLIT:
 .long  -559038737,XT_DOLIT


 .balign 4
 .long 1b
1:
  .byte 38 ,100 ,111 ,117 ,115 ,101 ,114 
 .balign 4
_XT_DOUSER:
 .long  -559038737,XT_DOUSER


 .balign 4
 .long 1b
1:
  .byte 37 ,100 ,111 ,118 ,97 ,114 
 .balign 4
_XT_DOVAR:
 .long  -559038737,XT_DOVAR


 .balign 4
 .long 1b
1:
  .byte 39 ,100 ,111 ,99 ,111 ,110 ,115 ,116 
 .balign 4
_XT_DOCONST:
 .long  -559038737,XT_DOCONST


 .balign 4
 .long 1b
1:
  .byte 39 ,100 ,111 ,118 ,97 ,108 ,117 ,101 
 .balign 4
_XT_DOVALUE:
 .long  -559038737,XT_DOVALUE


 .balign 4
 .long 1b
1:
  .byte 38 ,100 ,111 ,108 ,105 ,115 ,116 
 .balign 4
_XT_DOLIST:
 .long  -559038737,XT_DOLIST


 .balign 4
 .long 1b
1:
  .byte 38 ,100 ,111 ,108 ,111 ,111 ,112 
 .balign 4
_XT_DOLOOP:
 .long  -559038737,XT_DOLOOP


 .balign 4
 .long 1b
1:
  .byte 39 ,100 ,111 ,43 ,108 ,111 ,111 ,112 
 .balign 4
_XT_DOPLUSLOOP:
 .long  -559038737,XT_DOPLUSLOOP


 .balign 4
 .long 1b
1:
  .byte 38 ,100 ,111 ,110 ,101 ,120 ,116 
 .balign 4
_XT_DONEXT:
 .long  -559038737,XT_DONEXT


 .balign 4
 .long 1b
1:
  .byte 39 ,48 ,98 ,114 ,97 ,110 ,99 ,104 
 .balign 4
_XT_ZEROBRANCH:
 .long  -559038737,XT_ZEROBRANCH


 .balign 4
 .long 1b
1:
  .byte 38 ,98 ,114 ,97 ,110 ,99 ,104 
 .balign 4
_XT_BRANCH:
 .long  -559038737,XT_BRANCH


 .balign 4
 .long 1b
1:
  .byte 36 ,101 ,120 ,105 ,116 
 .balign 4
_XT_EXIT:
 .long  -559038737,XT_EXIT


 .balign 4
 .long 1b
1:
  .byte 33 ,105 
 .balign 4
_XT_I:
 .long  -559038737,XT_I


 .balign 4
 .long 1b
1:
  .byte 34 ,62 ,114 
 .balign 4
_XT_GTR:
 .long  -559038737,XT_GTR


 .balign 4
 .long 1b
1:
  .byte 34 ,114 ,62 
 .balign 4
_XT_RGT:
 .long  -559038737,XT_RGT


 .balign 4
 .long 1b
1:
  .byte 34 ,114 ,64 
 .balign 4
_XT_RFETCH:
 .long  -559038737,XT_RFETCH


 .balign 4
 .long 1b
1:
  .byte 8 ,97 ,108 ,108 ,111 ,99 ,97 ,116 ,101 
 .balign 4
_XT_ALLOCATE:
 .long  -559038737,XT_ALLOCATE


 .balign 4
 .long 1b
1:
  .byte 4 ,102 ,114 ,101 ,101 
 .balign 4
_XT_FREE:
 .long  -559038737,XT_FREE


 .balign 4
 .long 1b
1:
  .byte 6 ,114 ,101 ,115 ,105 ,122 ,101 
 .balign 4
_XT_RESIZE:
 .long  -559038737,XT_RESIZE


 .balign 4
 .long 1b
1:
  .byte 5 ,111 ,112 ,101 ,110 ,102 
 .balign 4
_XT_OPENF:
 .long  -559038737,XT_OPENF


 .balign 4
 .long 1b
1:
  .byte 6 ,99 ,108 ,111 ,115 ,101 ,102 
 .balign 4
_XT_CLOSEF:
 .long  -559038737,XT_CLOSEF


 .balign 4
 .long 1b
1:
  .byte 5 ,114 ,101 ,97 ,100 ,102 
 .balign 4
_XT_READF:
 .long  -559038737,XT_READF


 .balign 4
 .long 1b
1:
  .byte 6 ,119 ,114 ,105 ,116 ,101 ,102 
 .balign 4
_XT_WRITEF:
 .long  -559038737,XT_WRITEF


 .balign 4
 .long 1b
1:
  .byte 5 ,109 ,109 ,97 ,112 ,102 
 .balign 4
_XT_MMAPF:
 .long  -559038737,XT_MMAPF


 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,105 ,122 ,101 ,102 
 .balign 4
_XT_SIZEF:
 .long  -559038737,XT_SIZEF


 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,101 ,101 ,107 ,102 
 .balign 4
_XT_SEEKF:
 .long  -559038737,XT_SEEKF


 .balign 4
 .long 1b
1:
  .byte 5 ,116 ,101 ,108 ,108 ,102 
 .balign 4
_XT_TELLF:
 .long  -559038737,XT_TELLF


 .balign 4
 .long 1b
1:
  .byte 5 ,108 ,105 ,110 ,101 ,102 
 .balign 4
_XT_LINEF:
 .long  -559038737,XT_LINEF


 .balign 4
 .long 1b
1:
  .byte 7 ,100 ,101 ,108 ,101 ,116 ,101 ,102 
 .balign 4
_XT_DELETEF:
 .long  -559038737,XT_DELETEF


 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,116 ,97 ,116 ,102 
 .balign 4
_XT_STATF:
 .long  -559038737,XT_STATF


 .balign 4
 .long 1b
1:
  .byte 4 ,114 ,101 ,110 ,102 
 .balign 4
_XT_RENF:
 .long  -559038737,XT_RENF


 .balign 4
 .long 1b
1:
  .byte 6 ,116 ,114 ,117 ,110 ,99 ,102 
 .balign 4
_XT_TRUNCF:
 .long  -559038737,XT_TRUNCF


 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,108 ,117 ,115 ,104 ,102 
 .balign 4
_XT_FLUSHF:
 .long  -559038737,XT_FLUSHF


 .balign 4
 .long 1b
1:
  .byte 8 ,102 ,120 ,62 ,102 ,108 ,111 ,97 ,116 
 .balign 4
_XT_FXGTFLOAT:
 .long  -559038737,XT_FXGTFLOAT


 .balign 4
 .long 1b
1:
  .byte 8 ,102 ,108 ,111 ,97 ,116 ,62 ,102 ,120 
 .balign 4
_XT_FLOATGTFX:
 .long  -559038737,XT_FLOATGTFX


 .balign 4
 .long 1b
1:
  .byte 9 ,102 ,120 ,62 ,100 ,111 ,117 ,98 ,108 ,101 
 .balign 4
_XT_FXGTDOUBLE:
 .long  -559038737,XT_FXGTDOUBLE


 .balign 4
 .long 1b
1:
  .byte 9 ,100 ,111 ,117 ,98 ,108 ,101 ,62 ,102 ,120 
 .balign 4
_XT_DOUBLEGTFX:
 .long  -559038737,XT_DOUBLEGTFX


 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,102 ,112 ,114 ,101 ,112 
 .balign 4
_XT_FFPREP:
 .long  -559038737,XT_FFPREP


 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,102 ,99 ,97 ,108 ,108 
 .balign 4
_XT_FFCALL:
 .long  -559038737,XT_FFCALL


 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,102 ,99 ,108 ,111 ,115 
 .balign 4
_XT_FFCLOS:
 .long  -559038737,XT_FFCLOS


 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,102 ,118 ,111 ,105 ,100 
 .balign 4
_XT_FFVOID:
 .long  -559038737,XT_FFVOID


 .balign 4
 .long 1b
1:
  .byte 5 ,102 ,102 ,105 ,110 ,116 
 .balign 4
_XT_FFINT:
 .long  -559038737,XT_FFINT


 .balign 4
 .long 1b
1:
  .byte 7 ,102 ,102 ,102 ,108 ,111 ,97 ,116 
 .balign 4
_XT_FFFLOAT:
 .long  -559038737,XT_FFFLOAT


 .balign 4
 .long 1b
1:
  .byte 8 ,102 ,102 ,100 ,111 ,117 ,98 ,108 ,101 
 .balign 4
_XT_FFDOUBLE:
 .long  -559038737,XT_FFDOUBLE


 .balign 4
 .long 1b
1:
  .byte 5 ,102 ,102 ,112 ,116 ,114 
 .balign 4
_XT_FFPTR:
 .long  -559038737,XT_FFPTR


 .balign 4
 .long 1b
1:
  .byte 7 ,102 ,102 ,105 ,110 ,116 ,54 ,52 
 .balign 4
_XT_FFINTSIXFOUR:
 .long  -559038737,XT_FFINTSIXFOUR


 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,108 ,111 ,112 ,101 ,110 
 .balign 4
_XT_DLOPEN:
 .long  -559038737,XT_DLOPEN


 .balign 4
 .long 1b
1:
  .byte 5 ,100 ,108 ,115 ,121 ,109 
 .balign 4
_XT_DLSYM:
 .long  -559038737,XT_DLSYM


 .balign 4
 .long 1b
1:
  .byte 4 ,97 ,114 ,103 ,99 
 .balign 4
_XT_ARGC:
 .long  -559038737,XT_ARGC


 .balign 4
 .long 1b
1:
  .byte 4 ,97 ,114 ,103 ,118 
 .balign 4
_XT_ARGV:
 .long  -559038737,XT_ARGV


 .balign 4
 .long 1b
1:
  .byte 5 ,120 ,116 ,101 ,110 ,100 
 .balign 4
_XT_XTEND:
 .long  -559038737,XT_XTEND


 .balign 4
 .long 1b
1:
  .byte 4 ,110 ,111 ,111 ,112 
 .balign 4
_XT_NOOP:
 .long  -559038737,XT_NOOP


 .balign 4
 .long 1b
1:
  .byte 6 ,46 ,101 ,114 ,114 ,111 ,114 
 .balign 4
XT_DOTERROR:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 7 ,46 ,101 ,114 ,114 ,111 ,114 ,33 
 .balign 4
XT_DOTERRORSTORE:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 9 ,105 ,110 ,116 ,101 ,114 ,112 ,114 ,101 ,116 
 .balign 4
XT_INTERPRET:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 10 ,107 ,101 ,121 ,104 ,97 ,110 ,100 ,108 ,101 ,114 
 .balign 4
XT_KEYHANDLER:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 6 ,114 ,101 ,102 ,105 ,108 ,108 
 .balign 4
XT_REFILL:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 8 ,64 ,101 ,120 ,101 ,99 ,117 ,116 ,101 
 .balign 4
XT_FETCHEXECUTE:
 bal XT_DOLIST
 nop 
 .long XT_FETCH,XT_EXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,101 ,107 ,101 ,121 ,63 
 .balign 4
XT_EKEYQ:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 4 ,101 ,107 ,101 ,121 
 .balign 4
XT_EKEY:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 5 ,101 ,109 ,105 ,116 ,63 
 .balign 4
XT_EMITQ:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 4 ,101 ,109 ,105 ,116 
 .balign 4
XT_EMIT:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 7 ,46 ,112 ,114 ,111 ,109 ,112 ,116 
 .balign 4
XT_DOTPROMPT:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 2 ,99 ,114 
 .balign 4
XT_CR:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,10 ,XT_EMIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,115 ,112 ,97 ,99 ,101 
 .balign 4
XT_SPACE:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,32 ,XT_EMIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,115 ,112 ,97 ,99 ,101 ,115 
 .balign 4
XT_SPACES:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0 ,XT_MAX,XT_DOLIT,0 ,XT_DOQDO,4 ,XT_SPACE,XT_DOLOOP,-2 ,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,63 ,100 ,117 ,112 
 .balign 4
_XT_QDUP:
 .long  -559038737,XT_QDUP


 .balign 4
 .long 1b
1:
  .byte 3 ,110 ,105 ,112 
 .balign 4
_XT_NIP:
 .long  -559038737,XT_NIP


 .balign 4
 .long 1b
1:
  .byte 3 ,114 ,111 ,116 
 .balign 4
_XT_ROT:
 .long  -559038737,XT_ROT


 .balign 4
 .long 1b
1:
  .byte 5 ,50 ,100 ,114 ,111 ,112 
 .balign 4
_XT_TWODROP:
 .long  -559038737,XT_TWODROP


 .balign 4
 .long 1b
1:
  .byte 4 ,50 ,100 ,117 ,112 
 .balign 4
_XT_TWODUP:
 .long  -559038737,XT_TWODUP


 .balign 4
 .long 1b
1:
  .byte 5 ,50 ,115 ,119 ,97 ,112 
 .balign 4
_XT_TWOSWAP:
 .long  -559038737,XT_TWOSWAP


 .balign 4
 .long 1b
1:
  .byte 5 ,50 ,111 ,118 ,101 ,114 
 .balign 4
_XT_TWOOVER:
 .long  -559038737,XT_TWOOVER


 .balign 4
 .long 1b
1:
  .byte 38 ,117 ,110 ,108 ,111 ,111 ,112 
 .balign 4
_XT_UNLOOP:
 .long  -559038737,XT_UNLOOP


 .balign 4
 .long 1b
1:
  .byte 37 ,114 ,100 ,114 ,111 ,112 
 .balign 4
_XT_RDROP:
 .long  -559038737,XT_RDROP


 .balign 4
 .long 1b
1:
  .byte 35 ,64 ,114 ,43 
 .balign 4
XT_FETCHRPLUS:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_RFETCH,XT_FETCH,XT_RGT,XT_CELLPLUS,XT_GTR,XT_SWAP,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 35 ,33 ,114 ,43 
 .balign 4
XT_STORERPLUS:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_SWAP,XT_RFETCH,XT_STORE,XT_RGT,XT_CELLPLUS,XT_GTR,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,100 ,101 ,112 ,116 ,104 
 .balign 4
XT_DEPTH:
 bal XT_DOLIST
 nop 
 .long XT_SPFETCH,XT_NEGATE,XT_SPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,2 ,XT_ARSHIFT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,114 ,100 ,101 ,112 ,116 ,104 
 .balign 4
XT_RDEPTH:
 bal XT_DOLIST
 nop 
 .long XT_RPFETCH,XT_NEGATE,XT_RPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,2 ,XT_ARSHIFT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,112 ,105 ,99 ,107 
 .balign 4
_XT_PICK:
 .long  -559038737,XT_PICK


 .balign 4
 .long 1b
1:
  .byte 5 ,114 ,112 ,105 ,99 ,107 
 .balign 4
XT_RPICK:
 bal XT_DOLIST
 nop 
 .long XT_RDEPTH,XT_DUP,XT_DOLIT,2 ,XT_LT,XT_DOQTHROW,-4 ,XT_DOLIT,2 ,XT_MINUS,XT_OVER,XT_ULT,XT_DOQTHROW,-4 ,XT_ONEPLUS,XT_CELLS,XT_RPFETCH,XT_PLUS,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,46 ,115 
 .balign 4
XT_DOTS:
 bal XT_DOLIST
 nop 
 .long XT_DEPTH,XT_DOLIT,0 ,XT_LTNUMBER,XT_DOLIT,62 ,XT_HOLD,XT_NUMBERS,XT_DOLIT,60 ,XT_HOLD,XT_NUMBERGT,XT_TYPE,XT_SPACE,XT_DEPTH,XT_DUP,XT_DOLIT,0 ,XT_DOQDO,7 ,XT_DUP,XT_PICK,XT_DOT,XT_ONEMINUS,XT_DOLOOP,-5 ,XT_UNLOOP,XT_DROP,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,46 ,114 ,115 
 .balign 4
XT_DOTRS:
 bal XT_DOLIST
 nop 
 .long XT_RDEPTH,XT_DOT,XT_DOLIT,4 ,XT_SPACES,XT_RDEPTH,XT_DOLIT,0 ,XT_DOQDO,6 ,XT_I,XT_RPICK,XT_DOT,XT_DOLOOP,-4 ,XT_UNLOOP,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,116 ,104 ,114 ,111 ,119 
 .balign 4
XT_THROW:
 bal XT_DOLIST
 nop 
 .long XT_QDUP,XT_ZEROBRANCH,13 ,XT_THROWFRAME,XT_FETCH,XT_RPSTORE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RGT,XT_SWAP,XT_GTR,XT_SPSTORE,XT_DROP,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 40 ,100 ,111 ,63 ,116 ,104 ,114 ,111 ,119 
 .balign 4
XT_DOQTHROW:
 bal XT_DOLIST
 nop 
 .long XT_ZEROLTGT,XT_FETCHRPLUS,XT_AND,XT_THROW,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,97 ,116 ,99 ,104 
 .balign 4
XT_CATCH:
 bal XT_DOLIST
 nop 
 .long XT_SPFETCH,XT_GTR,XT_THROWFRAME,XT_FETCH,XT_GTR,XT_RPFETCH,XT_THROWFRAME,XT_STORE,XT_EXECUTE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RDROP,XT_DOLIT,0 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,43 
 .balign 4
_XT_PLUS:
 .long  -559038737,XT_PLUS


 .balign 4
 .long 1b
1:
  .byte 2 ,49 ,43 
 .balign 4
_XT_ONEPLUS:
 .long  -559038737,XT_ONEPLUS


 .balign 4
 .long 1b
1:
  .byte 2 ,49 ,45 
 .balign 4
_XT_ONEMINUS:
 .long  -559038737,XT_ONEMINUS


 .balign 4
 .long 1b
1:
  .byte 6 ,105 ,110 ,118 ,101 ,114 ,116 
 .balign 4
_XT_INVERT:
 .long  -559038737,XT_INVERT


 .balign 4
 .long 1b
1:
  .byte 6 ,110 ,101 ,103 ,97 ,116 ,101 
 .balign 4
_XT_NEGATE:
 .long  -559038737,XT_NEGATE


 .balign 4
 .long 1b
1:
  .byte 1 ,45 
 .balign 4
_XT_MINUS:
 .long  -559038737,XT_MINUS


 .balign 4
 .long 1b
1:
  .byte 33 ,106 
 .balign 4
_XT_J:
 .long  -559038737,XT_J


 .balign 4
 .long 1b
1:
  .byte 3 ,48 ,60 ,62 
 .balign 4
_XT_ZEROLTGT:
 .long  -559038737,XT_ZEROLTGT


 .balign 4
 .long 1b
1:
  .byte 1 ,60 
 .balign 4
_XT_LT:
 .long  -559038737,XT_LT


 .balign 4
 .long 1b
1:
  .byte 2 ,117 ,60 
 .balign 4
_XT_ULT:
 .long  -559038737,XT_ULT


 .balign 4
 .long 1b
1:
  .byte 1 ,62 
 .balign 4
_XT_GT:
 .long  -559038737,XT_GT


 .balign 4
 .long 1b
1:
  .byte 2 ,117 ,62 
 .balign 4
XT_UGT:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_ULT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,117 ,62 ,61 
 .balign 4
XT_UGTEQUALS:
 bal XT_DOLIST
 nop 
 .long XT_ULT,XT_ZEROEQUALS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,61 
 .balign 4
_XT_EQUALS:
 .long  -559038737,XT_EQUALS


 .balign 4
 .long 1b
1:
  .byte 2 ,60 ,62 
 .balign 4
_XT_LTGT:
 .long  -559038737,XT_LTGT


 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,43 
 .balign 4
_XT_CELLPLUS:
 .long  -559038737,XT_CELLPLUS


 .balign 4
 .long 1b
1:
  .byte 36 ,100 ,111 ,100 ,111 
 .balign 4
_XT_DODO:
 .long  -559038737,XT_DODO


 .balign 4
 .long 1b
1:
  .byte 37 ,100 ,111 ,102 ,111 ,114 
 .balign 4
XT_DOFOR:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_SWAP,XT_DUP,XT_GTR,XT_GTR,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 37 ,100 ,111 ,63 ,100 ,111 
 .balign 4
XT_DOQDO:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_EQUALS,XT_ZEROBRANCH,10 ,XT_TWODROP,XT_RGT,XT_DUP,XT_FETCH,XT_CELLS,XT_PLUS,XT_CELLPLUS,XT_GTR,XT_EXIT,XT_RGT,XT_ROT,XT_GTR,XT_SWAP,XT_GTR,XT_CELLPLUS,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,97 ,98 ,115 
 .balign 4
_XT_ABS:
 .long  -559038737,XT_ABS


 .balign 4
 .long 1b
1:
  .byte 6 ,108 ,115 ,104 ,105 ,102 ,116 
 .balign 4
_XT_LSHIFT:
 .long  -559038737,XT_LSHIFT


 .balign 4
 .long 1b
1:
  .byte 7 ,97 ,114 ,115 ,104 ,105 ,102 ,116 
 .balign 4
XT_ARSHIFT:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0 ,XT_DOQDO,4 ,XT_TWOSLASH,XT_DOLOOP,-2 ,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,114 ,115 ,104 ,105 ,102 ,116 
 .balign 4
_XT_RSHIFT:
 .long  -559038737,XT_RSHIFT


 .balign 4
 .long 1b
1:
  .byte 3 ,109 ,97 ,120 
 .balign 4
_XT_MAX:
 .long  -559038737,XT_MAX


 .balign 4
 .long 1b
1:
  .byte 3 ,109 ,105 ,110 
 .balign 4
_XT_MIN:
 .long  -559038737,XT_MIN


 .balign 4
 .long 1b
1:
  .byte 4 ,117 ,109 ,105 ,110 
 .balign 4
XT_UMIN:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_UGT,XT_ZEROBRANCH,2 ,XT_SWAP,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,117 ,109 ,42 
 .balign 4
_XT_UMSTAR:
 .long  -559038737,XT_UMSTAR


 .balign 4
 .long 1b
1:
  .byte 7 ,100 ,110 ,101 ,103 ,97 ,116 ,101 
 .balign 4
_XT_DNEGATE:
 .long  -559038737,XT_DNEGATE


 .balign 4
 .long 1b
1:
  .byte 2 ,109 ,42 
 .balign 4
_XT_MSTAR:
 .long  -559038737,XT_MSTAR


 .balign 4
 .long 1b
1:
  .byte 1 ,42 
 .balign 4
_XT_STAR:
 .long  -559038737,XT_STAR


 .balign 4
 .long 1b
1:
  .byte 6 ,117 ,109 ,47 ,109 ,111 ,100 
 .balign 4
_XT_UMSLASHMOD:
 .long  -559038737,XT_UMSLASHMOD


 .balign 4
 .long 1b
1:
  .byte 3 ,115 ,62 ,100 
 .balign 4
_XT_SGTD:
 .long  -559038737,XT_SGTD


 .balign 4
 .long 1b
1:
  .byte 6 ,119 ,105 ,116 ,104 ,105 ,110 
 .balign 4
_XT_WITHIN:
 .long  -559038737,XT_WITHIN


 .balign 4
 .long 1b
1:
  .byte 2 ,100 ,43 
 .balign 4
_XT_DPLUS:
 .long  -559038737,XT_DPLUS


 .balign 4
 .long 1b
1:
  .byte 6 ,117 ,110 ,100 ,101 ,114 ,43 
 .balign 4
XT_UNDERPLUS:
 bal XT_DOLIST
 nop 
 .long XT_ROT,XT_PLUS,XT_SWAP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,104 ,97 ,114 ,43 
 .balign 4
_XT_CHARPLUS:
 .long  -559038737,XT_CHARPLUS


 .balign 4
 .long 1b
1:
  .byte 5 ,100 ,105 ,99 ,116 ,63 
 .balign 4
XT_DICTQ:
 bal XT_DOLIST
 nop 
 .long XT_DICTZERO,XT_DICTTOP,XT_WITHIN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,63 ,100 ,105 ,99 ,116 
 .balign 4
XT_QDICT:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_DICTQ,XT_ZEROEQUALS,XT_DOQTHROW,-8 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,115 
 .balign 4
_XT_CELLS:
 .long  -559038737,XT_CELLS


 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,101 ,108 ,108 ,45 
 .balign 4
_XT_CELLMINUS:
 .long  -559038737,XT_CELLMINUS


 .balign 4
 .long 1b
1:
  .byte 2 ,50 ,33 
 .balign 4
_XT_TWOSTORE:
 .long  -559038737,XT_TWOSTORE


 .balign 4
 .long 1b
1:
  .byte 2 ,50 ,64 
 .balign 4
_XT_TWOFETCH:
 .long  -559038737,XT_TWOFETCH


 .balign 4
 .long 1b
1:
  .byte 7 ,97 ,108 ,105 ,103 ,110 ,101 ,100 
 .balign 4
_XT_ALIGNED:
 .long  -559038737,XT_ALIGNED


 .balign 4
 .long 1b
1:
  .byte 5 ,97 ,108 ,105 ,103 ,110 
 .balign 4
XT_ALIGN:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_ALIGNED,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,45 ,114 ,111 ,116 
 .balign 4
XT_MINUSROT:
 bal XT_DOLIST
 nop 
 .long XT_ROT,XT_ROT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,102 ,105 ,108 ,108 
 .balign 4
_XT_FILL:
 .long  -559038737,XT_FILL


 .balign 4
 .long 1b
1:
  .byte 5 ,99 ,111 ,117 ,110 ,116 
 .balign 4
_XT_COUNT:
 .long  -559038737,XT_COUNT


 .balign 4
 .long 1b
1:
  .byte 9 ,110 ,97 ,109 ,101 ,99 ,111 ,117 ,110 ,116 
 .balign 4
XT_NAMECOUNT:
 bal XT_DOLIST
 nop 
 .long XT_COUNT,XT_DOLIT,31 ,XT_AND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,112 ,108 ,97 ,99 ,101 
 .balign 4
XT_PLACE:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_DOLIT,255 ,XT_UGTEQUALS,XT_DOQTHROW,-18 ,XT_OVER,XT_GTR,XT_ROT,XT_OVER,XT_ONEPLUS,XT_RGT,XT_MOVE,XT_CSTORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,43 ,33 
 .balign 4
_XT_PLUSSTORE:
 .long  -559038737,XT_PLUSSTORE


 .balign 4
 .long 1b
1:
  .byte 5 ,97 ,108 ,108 ,111 ,116 
 .balign 4
XT_ALLOT:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_PLUS,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,44 
 .balign 4
XT_COMMA:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_STORE,XT_DOLIT,4 ,XT_ALLOT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,111 ,102 ,102 
 .balign 4
XT_OFF:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0 ,XT_SWAP,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,111 ,110 
 .balign 4
XT_ON:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,-1 ,XT_SWAP,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,115 ,111 ,117 ,114 ,99 ,101 
 .balign 4
XT_SOURCE:
 bal XT_DOLIST
 nop 
 .long XT_SOURCEVAR,XT_TWOFETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,47 ,115 ,116 ,114 ,105 ,110 ,103 
 .balign 4
XT_SLASHSTRING:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_RFETCH,XT_UNDERPLUS,XT_RGT,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,117 ,110 ,112 ,97 ,114 ,115 ,101 ,100 
 .balign 4
XT_UNPARSED:
 bal XT_DOLIST
 nop 
 .long XT_SOURCE,XT_GTIN,XT_FETCH,XT_SLASHSTRING,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 9 ,117 ,110 ,112 ,97 ,114 ,115 ,101 ,100 ,33 
 .balign 4
XT_UNPARSEDSTORE:
 bal XT_DOLIST
 nop 
 .long XT_SOURCE,XT_MINUSROT,XT_MINUS,XT_UMIN,XT_GTIN,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,115 ,99 ,97 ,110 
 .balign 4
XT_SCAN:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,12 ,XT_OVER,XT_CFETCH,XT_RFETCH,XT_XOR,XT_ZEROBRANCH,6 ,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-13 ,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,115 ,107 ,105 ,112 
 .balign 4
XT_SKIP:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,12 ,XT_OVER,XT_CFETCH,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,6 ,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-13 ,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,112 ,97 ,114 ,115 ,101 
 .balign 4
XT_PARSE:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_UNPARSED,XT_OVER,XT_SWAP,XT_RGT,XT_SCAN,XT_DROP,XT_OVER,XT_MINUS,XT_TWODUP,XT_PLUS,XT_ONEPLUS,XT_UNPARSEDSTORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 9 ,115 ,107 ,105 ,112 ,112 ,97 ,114 ,115 ,101 
 .balign 4
XT_SKIPPARSE:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_UNPARSED,XT_RFETCH,XT_SKIP,XT_DROP,XT_UNPARSEDSTORE,XT_RGT,XT_PARSE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 10 ,112 ,97 ,114 ,115 ,101 ,45 ,119 ,111 ,114 ,100 
 .balign 4
XT_PARSEMINUSWORD:
 bal XT_DOLIST
 nop 
 .long XT_BL,XT_SKIPPARSE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,35 ,111 ,114 ,100 ,101 ,114 
 .balign 4
XT_NUMBERORDER:
 bal XT_DOCREATE
 nop 

 .long XT_NOOP
 .long 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 

 .balign 4
 .long 1b
1:
  .byte 7 ,110 ,97 ,109 ,101 ,62 ,120 ,116 
 .balign 4
XT_NAMEGTXT:
 bal XT_DOLIST
 nop 
 .long XT_NAMECOUNT,XT_PLUS,XT_ALIGNED,XT_DUP,XT_FETCH,XT_DOLIT,-559038737 ,XT_EQUALS,XT_ZEROBRANCH,3 ,XT_CELLPLUS,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,108 ,105 ,110 ,107 ,63 
 .balign 4
XT_LINKQ:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_ZEROEQUALS,XT_SWAP,XT_DICTQ,XT_OR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,99 ,111 ,108 ,110 ,97 ,109 ,101 
 .balign 4
XT_COLNAME:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_QDODEFINE,XT_NIP,XT_ZEROEQUALS,XT_ZEROBRANCH,5 ,XT_DROP,XT_DOLIT,0 ,XT_EXIT,XT_GTR,XT_RFETCH,XT_CELLMINUS,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_OVER,XT_CELLMINUS,XT_FETCH,XT_LINKQ,XT_AND,XT_ZEROBRANCH,-11 ,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,112 ,114 ,105 ,109 ,110 ,97 ,109 ,101 
 .balign 4
XT_PRIMNAME:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_XTOF,XT_COLD,XT_COLNAME,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,-7 ,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,98 ,111 ,117 ,110 ,100 ,115 
 .balign 4
XT_BOUNDS:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_PLUS,XT_SWAP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 10 ,102 ,111 ,114 ,119 ,111 ,114 ,100 ,115 ,105 ,110 
 .balign 4
XT_FORWORDSIN:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0 ,XT_DOTO,XT_FOUND,XT_GTR,XT_CELLPLUS,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_FOUND,XT_ZEROEQUALS,XT_AND,XT_ZEROBRANCH,5 ,XT_RFETCH,XT_EXECUTE,XT_BRANCH,-11 ,XT_DROP,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,102 ,111 ,114 ,119 ,111 ,114 ,100 ,115 
 .balign 4
XT_FORWORDS:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_NUMBERORDER,XT_CELLPLUS,XT_NUMBERORDER,XT_FETCH,XT_CELLS,XT_BOUNDS,XT_DOQDO,15 ,XT_I,XT_FETCH,XT_J,XT_FORWORDSIN,XT_FOUND,XT_ZEROBRANCH,3 ,XT_BRANCH,6 ,XT_DOLIT,1 ,XT_CELLS,XT_DOPLUSLOOP,-13 ,XT_UNLOOP,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,109 ,97 ,116 ,99 ,104 ,63 
 .balign 4
XT_MATCHQ:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_NAMECOUNT,XT_PARSED,XT_FETCH,XT_EQUALS,XT_ZEROBRANCH,12 ,XT_PARSED,XT_TWOFETCH,XT_ISAMEQ,XT_ZEROEQUALS,XT_ZEROBRANCH,4 ,XT_DUP,XT_DOTO,XT_FOUND,XT_BRANCH,2 ,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,110 ,102 ,97 ,105 ,110 
 .balign 4
XT_NFAIN:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_PARSED,XT_TWOSTORE,XT_RGT,XT_XTOF,XT_MATCHQ,XT_FORWORDSIN,XT_FOUND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 3 ,110 ,102 ,97 
 .balign 4
XT_NFA:
 bal XT_DOLIST
 nop 
 .long XT_PARSED,XT_TWOSTORE,XT_XTOF,XT_MATCHQ,XT_FORWORDS,XT_FOUND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,102 ,105 ,109 ,109 ,101 ,100 
 .balign 4
XT_FIMMED:
 bal XT_DOLIST
 nop 
 .long XT_CFETCH,XT_DOLIT,64 ,XT_AND,XT_ZEROEQUALS,XT_TWOSTAR,XT_ONEPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,47 ,102 ,99 ,111 ,109 ,112 ,111 
 .balign 4
XT_SLASHFCOMPO:
 bal XT_DOLIST
 nop 
 .long XT_CFETCH,XT_DOLIT,32 ,XT_AND,XT_ZEROEQUALS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,39 ,110 ,102 ,97 
 .balign 4
XT_TICKNFA:
 bal XT_DOLIST
 nop 
 .long XT_PARSEMINUSWORD,XT_NFA,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,-13 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,39 
 .balign 4
XT_TICK:
 bal XT_DOLIST
 nop 
 .long XT_TICKNFA,XT_NAMEGTXT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,116 ,121 ,112 ,101 
 .balign 4
XT_TYPE:
 bal XT_DOLIST
 nop 
 .long XT_BOUNDS,XT_DOQDO,6 ,XT_I,XT_CFETCH,XT_EMIT,XT_DOLOOP,-4 ,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,114 ,101 ,100 ,101 ,102 ,115 ,116 ,114 
 .balign 4
XT_REDEFSTR:
 bal XT_DOVAR
 nop 
  .byte 10 ,114 ,101 ,100 ,101 ,102 ,105 ,110 ,101 ,100 ,32 


 .balign 4
 .long 1b
1:
  .byte 7 ,40 ,104 ,101 ,97 ,100 ,44 ,41 
 .balign 4
XT_LPARENHEADCOMMARPAREN:
 bal XT_DOLIST
 nop 
 .long XT_QDICT,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,-16 ,XT_DUP,XT_DOLIT,31 ,XT_GT,XT_DOQTHROW,-19 ,XT_TWODUP,XT_GETMINUSCURRENT,XT_NFAIN,XT_ZEROBRANCH,11 ,XT_WARNINGS,XT_FETCH,XT_ZEROBRANCH,7 ,XT_REDEFSTR,XT_COUNT,XT_TYPE,XT_TWODUP,XT_TYPE,XT_SPACE,XT_ALIGN,XT_GETMINUSCURRENT,XT_FETCH,XT_COMMA,XT_HERE,XT_DOTO,XT_LASTNAME,XT_SCOMMA,XT_ALIGN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,104 ,101 ,97 ,100 ,44 
 .balign 4
XT_HEADCOMMA:
 bal XT_DOLIST
 nop 
 .long XT_PARSEMINUSWORD,XT_LPARENHEADCOMMARPAREN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,104 ,111 ,108 ,100 
 .balign 4
XT_HOLD:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,-1 ,XT_HLD,XT_PLUSSTORE,XT_HLD,XT_FETCH,XT_CSTORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,60 ,35 
 .balign 4
XT_LTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_DOLIT,256 ,XT_PLUS,XT_HLD,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,35 
 .balign 4
XT_NUMBER:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0 ,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_GTR,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_SWAP,XT_DOLIT,9 ,XT_OVER,XT_LT,XT_DOLIT,7 ,XT_AND,XT_PLUS,XT_DOLIT,48 ,XT_PLUS,XT_HOLD,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,35 ,115 
 .balign 4
XT_NUMBERS:
 bal XT_DOLIST
 nop 
 .long XT_NUMBER,XT_TWODUP,XT_OR,XT_ZEROEQUALS,XT_ZEROBRANCH,-5 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,35 ,62 
 .balign 4
XT_NUMBERGT:
 bal XT_DOLIST
 nop 
 .long XT_TWODROP,XT_HLD,XT_FETCH,XT_HERE,XT_DOLIT,256 ,XT_PLUS,XT_OVER,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,115 ,105 ,103 ,110 
 .balign 4
XT_SIGN:
 bal XT_DOLIST
 nop 
 .long XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_DOLIT,45 ,XT_HOLD,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,40 ,100 ,46 ,41 
 .balign 4
XT_LPARENDDOTRPAREN:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_OVER,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DNEGATE,XT_LTNUMBER,XT_NUMBERS,XT_ROT,XT_SIGN,XT_NUMBERGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,100 ,46 
 .balign 4
XT_DDOT:
 bal XT_DOLIST
 nop 
 .long XT_LPARENDDOTRPAREN,XT_TYPE,XT_SPACE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,46 
 .balign 4
XT_DOT:
 bal XT_DOLIST
 nop 
 .long XT_SGTD,XT_DDOT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 97 ,91 
 .balign 4
XT_LBRACKET:
 bal XT_DOLIST
 nop 
 .long XT_STATE,XT_OFF,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,93 
 .balign 4
XT_RBRACKET:
 bal XT_DOLIST
 nop 
 .long XT_STATE,XT_ON,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 9 ,112 ,114 ,105 ,110 ,116 ,97 ,98 ,108 ,101 
 .balign 4
XT_PRINTABLE:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_SPAN,XT_FETCH,XT_UGTEQUALS,XT_AND,XT_DUP,XT_GTR,XT_ZEROBRANCH,12 ,XT_OVER,XT_SPAN,XT_FETCH,XT_PLUS,XT_RFETCH,XT_SWAP,XT_CSTORE,XT_DOLIT,1 ,XT_SPAN,XT_PLUSSTORE,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,97 ,99 ,99 ,101 ,112 ,116 
 .balign 4
XT_ACCEPT:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_BL,XT_FILL,XT_SPAN,XT_OFF,XT_EKEY,XT_KEYHANDLER,XT_DOLIT,10 ,XT_EQUALS,XT_ZEROBRANCH,-6 ,XT_TWODROP,XT_DOLIT,-1 ,XT_SPAN,XT_PLUSSTORE,XT_SPAN,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,40 ,114 ,101 ,102 ,105 ,108 ,108 ,41 
 .balign 4
XT_LPARENREFILLRPAREN:
 bal XT_DOLIST
 nop 
 .long XT_TIB,XT_DUP,XT_DOLIT,256 ,XT_ACCEPT,XT_SOURCEVAR,XT_TWOSTORE,XT_GTIN,XT_OFF,XT_DOLIT,-1 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,99 ,111 ,109 ,112 ,105 ,108 ,101 ,44 
 .balign 4
XT_COMPILECOMMA:
 bal XT_DOCREATE
 nop 

 .long  XT_FETCHEXECUTE
 .long 0 

 .balign 4
 .long 1b
1:
  .byte 9 ,40 ,99 ,111 ,109 ,112 ,105 ,108 ,101 ,41 
 .balign 4
XT_LPARENCOMPILERPAREN:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_COMPILECOMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 36 ,120 ,116 ,111 ,102 
 .balign 4
XT_XTOF:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,108 ,111 ,119 ,101 ,114 ,63 
 .balign 4
XT_LOWERQ:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,97 ,XT_DOLIT,123 ,XT_WITHIN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,116 ,111 ,117 ,112 ,112 ,101 ,114 
 .balign 4
XT_TOUPPER:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_LOWERQ,XT_DOLIT,-32 ,XT_AND,XT_PLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,100 ,105 ,103 ,105 ,116 
 .balign 4
XT_DIGIT:
 bal XT_DOLIST
 nop 
 .long XT_TOUPPER,XT_DUP,XT_DOLIT,58 ,XT_DOLIT,65 ,XT_WITHIN,XT_DOLIT,128 ,XT_AND,XT_PLUS,XT_DUP,XT_DOLIT,65 ,XT_UGTEQUALS,XT_DOLIT,7 ,XT_AND,XT_MINUS,XT_DOLIT,48 ,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,105 ,103 ,105 ,116 ,63 
 .balign 4
XT_DIGITQ:
 bal XT_DOLIST
 nop 
 .long XT_DIGIT,XT_BASE,XT_FETCH,XT_ULT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,97 ,99 ,99 ,117 ,109 
 .balign 4
XT_ACCUM:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DROP,XT_ROT,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,62 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_GTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_BASE,XT_FETCH,XT_GTR,XT_OVER,XT_CFETCH,XT_DOLIT,35 ,XT_EQUALS,XT_ZEROBRANCH,13 ,XT_TWOSWAP,XT_DROP,XT_BASE,XT_STORE,XT_DOLIT,0 ,XT_DOLIT,0 ,XT_TWOSWAP,XT_DOLIT,1 ,XT_SLASHSTRING,XT_OVER,XT_CFETCH,XT_DIGITQ,XT_OVER,XT_AND,XT_ZEROBRANCH,14 ,XT_GTR,XT_GTR,XT_RFETCH,XT_CFETCH,XT_DIGIT,XT_ACCUM,XT_RGT,XT_RGT,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-38 ,XT_RGT,XT_BASE,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 10 ,115 ,62 ,117 ,100 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_SGTUDNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,-1 ,XT_DPL,XT_STORE,XT_DOLIT,0 ,XT_DOLIT,0 ,XT_TWOSWAP,XT_GTNUMBER,XT_DUP,XT_ZEROBRANCH,17 ,XT_OVER,XT_CFETCH,XT_DOLIT,46 ,XT_LTGT,XT_DOQTHROW,-13 ,XT_DUP,XT_ONEMINUS,XT_DPL,XT_STORE,XT_DOLIT,1 ,XT_SLASHSTRING,XT_BRANCH,-19 ,XT_TWODROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 9 ,115 ,62 ,100 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_SGTDNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_CFETCH,XT_DOLIT,45 ,XT_EQUALS,XT_GTR,XT_RFETCH,XT_NEGATE,XT_SLASHSTRING,XT_SGTUDNUMBER,XT_RGT,XT_ZEROBRANCH,2 ,XT_DNEGATE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 9 ,115 ,62 ,117 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_SGTUNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_SGTUDNUMBER,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,115 ,62 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_SGTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_SGTDNUMBER,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,2 ,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 103 ,108 ,105 ,116 ,101 ,114 ,97 ,108 
 .balign 4
XT_LITERAL:
 bal XT_DOLIST
 nop 
 .long XT_LPARENCOMPILERPAREN,XT_DOLIT,XT_COMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,111 ,50 ,108 ,105 ,116 
 .balign 4
XT_DOTWOLIT:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_FETCHRPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 104 ,50 ,108 ,105 ,116 ,101 ,114 ,97 ,108 
 .balign 4
XT_TWOLITERAL:
 bal XT_DOLIST
 nop 
 .long XT_LPARENCOMPILERPAREN,XT_DOTWOLIT,XT_SWAP,XT_COMMA,XT_COMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,111 ,119 ,111 ,114 ,100 
 .balign 4
XT_DOWORD:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_SLASHFCOMPO,XT_STATE,XT_FETCH,XT_OR,XT_ZEROEQUALS,XT_DOQTHROW,-14 ,XT_DUP,XT_NAMEGTXT,XT_SWAP,XT_FIMMED,XT_ZEROLT,XT_STATE,XT_FETCH,XT_AND,XT_ZEROBRANCH,4 ,XT_COMPILECOMMA,XT_BRANCH,2 ,XT_EXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 8 ,100 ,111 ,110 ,117 ,109 ,98 ,101 ,114 
 .balign 4
XT_DONUMBER:
 bal XT_DOLIST
 nop 
 .long XT_PARSED,XT_TWOFETCH,XT_SGTNUMBER,XT_STATE,XT_FETCH,XT_ZEROBRANCH,10 ,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,4 ,XT_LITERAL,XT_BRANCH,2 ,XT_TWOLITERAL,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 11 ,40 ,105 ,110 ,116 ,101 ,114 ,112 ,114 ,101 ,116 ,41 
 .balign 4
XT_LPARENINTERPRETRPAREN:
 bal XT_DOLIST
 nop 
 .long XT_DEPTH,XT_ZEROLT,XT_DOQTHROW,-4 ,XT_PARSEMINUSWORD,XT_DUP,XT_ZEROBRANCH,11 ,XT_NFA,XT_QDUP,XT_ZEROBRANCH,4 ,XT_DOWORD,XT_BRANCH,2 ,XT_DONUMBER,XT_BRANCH,-17 ,XT_TWODROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 5 ,101 ,120 ,115 ,116 ,114 
 .balign 4
XT_EXSTR:
 bal XT_DOVAR
 nop 
  .byte 13 ,32 ,101 ,120 ,99 ,101 ,112 ,116 ,105 ,111 ,110 ,32 ,35 ,32 


 .balign 4
 .long 1b
1:
  .byte 4 ,46 ,101 ,114 ,114 
 .balign 4
XT_DOTERR:
 bal XT_DOLIST
 nop 
 .long XT_PARSED,XT_TWOFETCH,XT_TYPE,XT_EXSTR,XT_COUNT,XT_TYPE,XT_DOT,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,113 ,117 ,105 ,116 
 .balign 4
XT_QUIT:
 bal XT_DOLIST
 nop 
 .long XT_RPZERO,XT_FETCH,XT_RPSTORE,XT_DOLIT,0 ,XT_DOTO,XT_SOURCEMINUSID,XT_LBRACKET,XT_REFILL,XT_DROP,XT_XTOF,XT_INTERPRET,XT_CATCH,XT_DOTERRORSTORE,XT_QDUP,XT_ZEROEQUALS,XT_ZEROBRANCH,9 ,XT_STATE,XT_FETCH,XT_ZEROEQUALS,XT_ZEROBRANCH,2 ,XT_DOTPROMPT,XT_BRANCH,-17 ,XT_DOTERROR,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_BRANCH,-31 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 7 ,58 ,110 ,111 ,110 ,97 ,109 ,101 
 .balign 4
XT_COLONNONAME:
 bal XT_DOLIST
 nop 
 .long XT_HASNAMEQ,XT_OFF,XT_RBRACKET,XT_HERE,XT_DOTO,XT_LASTXT,XT_XTOF,XT_DOLIST,XT_XTCOMMA,XT_DUP,XT_DOLIT,-1 ,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 1 ,58 
 .balign 4
XT_COLON:
 bal XT_DOLIST
 nop 
 .long XT_HEADCOMMA,XT_COLONNONAME,XT_ROT,XT_DROP,XT_HASNAMEQ,XT_ON,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,117 ,109 ,109 ,121 ,49 
 .balign 4
XT_DUMMYONE:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .balign 4
 .long 1b
1:
  .byte 8 ,108 ,105 ,110 ,107 ,108 ,97 ,115 ,116 
 .balign 4
XT_LINKLAST:
 bal XT_DOLIST
 nop 
 .long XT_LASTNAME,XT_GETMINUSCURRENT,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,114 ,101 ,118 ,101 ,97 ,108 
 .balign 4
XT_REVEAL:
 bal XT_DOLIST
 nop 
 .long XT_HASNAMEQ,XT_FETCH,XT_ZEROBRANCH,2 ,XT_LINKLAST,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 97 ,59 
 .balign 4
XT_SEMI:
 bal XT_DOLIST
 nop 
 .long XT_NIP,XT_ONEPLUS,XT_DOQTHROW,-22 ,XT_REVEAL,XT_LPARENCOMPILERPAREN,XT_EXIT,XT_LBRACKET,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 36 ,100 ,111 ,116 ,111 
 .balign 4
_XT_DOTO:
 .long  -559038737,XT_DOTO


 .balign 4
 .long 1b
1:
  .byte 104 ,112 ,111 ,115 ,116 ,112 ,111 ,110 ,101 
 .balign 4
XT_POSTPONE:
 bal XT_DOLIST
 nop 
 .long XT_TICKNFA,XT_DUP,XT_NAMEGTXT,XT_SWAP,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,5 ,XT_LPARENCOMPILERPAREN,XT_LPARENCOMPILERPAREN,XT_COMMA,XT_EXIT,XT_COMPILECOMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 2 ,115 ,44 
 .balign 4
XT_SCOMMA:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_OVER,XT_CHARPLUS,XT_ALLOT,XT_PLACE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,40 ,105 ,115 ,41 
 .balign 4
XT_LPARENISRPAREN:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_DOLIT,12 ,XT_PLUS,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 4 ,99 ,111 ,108 ,100 
 .balign 4
XT_COLD:
 bal XT_DOLIST
 nop 
 .long XT_XTOF,XT_DICTZERO,XT_COLNAME,XT_DOLIT,24 ,XT_MINUS,XT_XTOF,XT_DICTZERO,XT_DOLIT,8 ,XT_PLUS,XT_STORE,XT_XTOF,XT_DUMMYTWO,XT_COLNAME,XT_DOTO,XT_HERE,XT_DICTZERO,XT_DOLIT,262144 ,XT_PLUS,XT_DUP,XT_DOTO,XT_MEMTOP,XT_CELLMINUS,XT_DUP,XT_USERP,XT_STORE,XT_DOLIT,256 ,XT_MINUS,XT_DUP,XT_RPZERO,XT_STORE,XT_DOLIT,1024 ,XT_MINUS,XT_DUP,XT_SPZERO,XT_STORE,XT_DOLIT,1024 ,XT_MINUS,XT_DOLIT,256 ,XT_MINUS,XT_DUP,XT_DOTO,XT_PAD,XT_DOLIT,256 ,XT_MINUS,XT_DUP,XT_DOTO,XT_TIB,XT_DUP,XT_DOTO,XT_DICTTOP,XT_DROP,XT_DOLIT,10 ,XT_BASE,XT_STORE,XT_XTOF,XT_RXQ,XT_LPARENISRPAREN,XT_EKEYQ,XT_XTOF,XT_RXFETCH,XT_LPARENISRPAREN,XT_EKEY,XT_XTOF,XT_TXQ,XT_LPARENISRPAREN,XT_EMITQ,XT_XTOF,XT_TXSTORE,XT_LPARENISRPAREN,XT_EMIT,XT_XTOF,XT_PRINTABLE,XT_LPARENISRPAREN,XT_KEYHANDLER,XT_XTOF,XT_LPARENINTERPRETRPAREN,XT_LPARENISRPAREN,XT_INTERPRET,XT_XTOF,XT_DOTERR,XT_LPARENISRPAREN,XT_DOTERROR,XT_XTOF,XT_NOOP,XT_LPARENISRPAREN,XT_DOTERRORSTORE,XT_XTOF,XT_COMMA,XT_LPARENISRPAREN,XT_COMPILECOMMA,XT_XTOF,XT_NOOP,XT_LPARENISRPAREN,XT_DOTPROMPT,XT_XTOF,XT_LPARENREFILLRPAREN,XT_LPARENISRPAREN,XT_REFILL,XT_XTOF,XT_FORTHMINUSWORDLIST,XT_COLNAME,XT_DOLIT,3 ,XT_CELLS,XT_MINUS,XT_DOTO,XT_FORTHMINUSWORDLIST,XT_XTOF,XT_COLD,XT_COLNAME,XT_FORTHMINUSWORDLIST,XT_STORE,XT_FORTHMINUSWORDLIST,XT_DOTO,XT_GETMINUSCURRENT,XT_GETMINUSCURRENT,XT_DOLIT,1 ,XT_NUMBERORDER,XT_TWOSTORE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_QUIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 6 ,100 ,117 ,109 ,109 ,121 ,50 
 .balign 4
XT_DUMMYTWO:
 bal XT_DOVAR
 nop 
 .long -559038737 

 .fill 251547 ,1,0
 .long  0xcacacaca
.set reorder
.set at
.set macro
