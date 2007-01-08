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
  .byte 0x5,0x64,0x69,0x63,0x74,0x30
 .balign 4
XT_DICTZERO:
 bal XT_DOVALUE
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0xA,0x73,0x69,0x67,0x68,0x61,0x6E,0x64,0x6C,0x65,0x72
 .balign 4
XT_SIGHANDLER:
 bal XT_DOUSER
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0xA,0x74,0x68,0x72,0x6F,0x77,0x66,0x72,0x61,0x6D,0x65
 .balign 4
XT_THROWFRAME:
 bal XT_DOUSER
 nop 
 .long 0xFFFFFFFC

 .balign 4
 .long 1b
1:
  .byte 0x3,0x64,0x70,0x6C
 .balign 4
XT_DPL:
 bal XT_DOUSER
 nop 
 .long 0xFFFFFFF8

 .balign 4
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x30
 .balign 4
XT_SPZERO:
 bal XT_DOUSER
 nop 
 .long 0xFFFFFFF4

 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x30
 .balign 4
XT_RPZERO:
 bal XT_DOUSER
 nop 
 .long 0xFFFFFFF0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x74,0x61,0x73,0x6B,0x6E,0x61,0x6D,0x65
 .balign 4
XT_TASKNAME:
 bal XT_DOUSER
 nop 
 .long 0xFFFFFFEC

 .balign 4
 .long 1b
1:
  .byte 0x6,0x70,0x61,0x72,0x73,0x65,0x64
 .balign 4
XT_PARSED:
 bal XT_DOVAR
 nop 
 .long 0x0,0x0

 .balign 4
 .long 1b
1:
  .byte 0x3,0x62,0x61,0x6C
 .balign 4
XT_BAL:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x9,0x73,0x6F,0x75,0x72,0x63,0x65,0x76,0x61,0x72
 .balign 4
XT_SOURCEVAR:
 bal XT_DOVAR
 nop 
 .long 0x0,0x0

 .balign 4
 .long 1b
1:
  .byte 0x9,0x61,0x62,0x6F,0x72,0x74,0x22,0x6D,0x73,0x67
 .balign 4
XT_ABORTQUOTEMSG:
 bal XT_DOVAR
 nop 
 .long 0x0,0x0

 .balign 4
 .long 1b
1:
  .byte 0x3,0x68,0x6C,0x64
 .balign 4
XT_HLD:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x75,0x73,0x65,0x72,0x70
 .balign 4
XT_USERP:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x77,0x61,0x72,0x6E,0x69,0x6E,0x67,0x73
 .balign 4
XT_WARNINGS:
 bal XT_DOVAR
 nop 
 .long 0xFFFFFFFF

 .balign 4
 .long 1b
1:
  .byte 0x6,0x27,0x65,0x6B,0x65,0x79,0x3F
 .balign 4
XT_TICKEKEYQ:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x27,0x65,0x6B,0x65,0x79
 .balign 4
XT_TICKEKEY:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x6,0x27,0x65,0x6D,0x69,0x74,0x3F
 .balign 4
XT_TICKEMITQ:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x27,0x65,0x6D,0x69,0x74
 .balign 4
XT_TICKEMIT:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x27,0x2E,0x70,0x72,0x6F,0x6D,0x70,0x74
 .balign 4
XT_TICKDOTPROMPT:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x7,0x27,0x2E,0x65,0x72,0x72,0x6F,0x72
 .balign 4
XT_TICKDOTERROR:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0xA,0x27,0x69,0x6E,0x74,0x65,0x72,0x70,0x72,0x65,0x74
 .balign 4
XT_TICKINTERPRET:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x9,0x27,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x2C
 .balign 4
XT_TICKCOMPILECOMMA:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x27,0x6B,0x68,0x61,0x6E
 .balign 4
XT_TICKKHAN:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x4,0x62,0x61,0x73,0x65
 .balign 4
XT_BASE:
 bal XT_DOVAR
 nop 
 .long 0xA

 .balign 4
 .long 1b
1:
  .byte 0x3,0x3E,0x69,0x6E
 .balign 4
XT_GTIN:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x4,0x73,0x70,0x61,0x6E
 .balign 4
XT_SPAN:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x74,0x61,0x74,0x65
 .balign 4
XT_STATE:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x68,0x61,0x73,0x6E,0x61,0x6D,0x65,0x3F
 .balign 4
XT_HASNAMEQ:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0xB,0x67,0x65,0x74,0x2D,0x63,0x75,0x72,0x72,0x65,0x6E,0x74
 .balign 4
XT_GETMINUSCURRENT:
 bal XT_DOVALUE
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x6,0x6D,0x65,0x6D,0x74,0x6F,0x70
 .balign 4
XT_MEMTOP:
 bal XT_DOVALUE
 nop 
 .long 0xABADCAFE

 .balign 4
 .long 1b
1:
  .byte 0x8,0x6C,0x61,0x73,0x74,0x6E,0x61,0x6D,0x65
 .balign 4
XT_LASTNAME:
 bal XT_DOVALUE
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x4,0x68,0x65,0x72,0x65
 .balign 4
XT_HERE:
 bal XT_DOVALUE
 nop 
 .long 0xABADCAFE

 .balign 4
 .long 1b
1:
  .byte 0x9,0x73,0x6F,0x75,0x72,0x63,0x65,0x2D,0x69,0x64
 .balign 4
XT_SOURCEMINUSID:
 bal XT_DOVALUE
 nop 
 .long 0xABADCAFE

 .balign 4
 .long 1b
1:
  .byte 0x3,0x70,0x61,0x64
 .balign 4
XT_PAD:
 bal XT_DOVALUE
 nop 
 .long 0xABADCAFE

 .balign 4
 .long 1b
1:
  .byte 0x3,0x74,0x69,0x62
 .balign 4
XT_TIB:
 bal XT_DOVALUE
 nop 
 .long 0xABADCAFE

 .balign 4
 .long 1b
1:
  .byte 0x5,0x66,0x6F,0x75,0x6E,0x64
 .balign 4
XT_FOUND:
 bal XT_DOVALUE
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x6C,0x61,0x73,0x74,0x75,0x73,0x65,0x72
 .balign 4
XT_LASTUSER:
 bal XT_DOVALUE
 nop 
 .long 0xFFFFFFE8,0x0,0x0

 .balign 4
 .long 1b
1:
  .byte 0xE,0x66,0x6F,0x72,0x74,0x68,0x2D,0x77,0x6F,0x72,0x64,0x6C,0x69,0x73,0x74
 .balign 4
XT_FORTHMINUSWORDLIST:
 bal XT_DOVALUE
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x2,0x62,0x6C
 .balign 4
XT_BL:
 bal XT_DOCONST
 nop 
 .long 0x20

 .balign 4
 .long 1b
1:
  .byte 0x3,0x75,0x6D,0x2B
 .balign 4
_XT_UMPLUS:
 .long 0xdeadbeef,XT_UMPLUS


 .balign 4
 .long 1b
1:
  .byte 0x3,0x61,0x6E,0x64
 .balign 4
_XT_AND:
 .long 0xdeadbeef,XT_AND


 .balign 4
 .long 1b
1:
  .byte 0x2,0x32,0x2A
 .balign 4
_XT_TWOSTAR:
 .long 0xdeadbeef,XT_TWOSTAR


 .balign 4
 .long 1b
1:
  .byte 0x2,0x32,0x2F
 .balign 4
_XT_TWOSLASH:
 .long 0xdeadbeef,XT_TWOSLASH


 .balign 4
 .long 1b
1:
  .byte 0x3,0x78,0x6F,0x72
 .balign 4
_XT_XOR:
 .long 0xdeadbeef,XT_XOR


 .balign 4
 .long 1b
1:
  .byte 0x2,0x6F,0x72
 .balign 4
_XT_OR:
 .long 0xdeadbeef,XT_OR


 .balign 4
 .long 1b
1:
  .byte 0x2,0x30,0x3C
 .balign 4
_XT_ZEROLT:
 .long 0xdeadbeef,XT_ZEROLT


 .balign 4
 .long 1b
1:
  .byte 0x2,0x30,0x3D
 .balign 4
_XT_ZEROEQUALS:
 .long 0xdeadbeef,XT_ZEROEQUALS


 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x78,0x3F
 .balign 4
_XT_RXQ:
 .long 0xdeadbeef,XT_RXQ


 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x78,0x40
 .balign 4
_XT_RXFETCH:
 .long 0xdeadbeef,XT_RXFETCH


 .balign 4
 .long 1b
1:
  .byte 0x3,0x74,0x78,0x3F
 .balign 4
_XT_TXQ:
 .long 0xdeadbeef,XT_TXQ


 .balign 4
 .long 1b
1:
  .byte 0x3,0x74,0x78,0x21
 .balign 4
_XT_TXSTORE:
 .long 0xdeadbeef,XT_TXSTORE


 .balign 4
 .long 1b
1:
  .byte 0x4,0x64,0x72,0x6F,0x70
 .balign 4
_XT_DROP:
 .long 0xdeadbeef,XT_DROP


 .balign 4
 .long 1b
1:
  .byte 0x3,0x64,0x75,0x70
 .balign 4
_XT_DUP:
 .long 0xdeadbeef,XT_DUP


 .balign 4
 .long 1b
1:
  .byte 0x4,0x6F,0x76,0x65,0x72
 .balign 4
_XT_OVER:
 .long 0xdeadbeef,XT_OVER


 .balign 4
 .long 1b
1:
  .byte 0x4,0x73,0x77,0x61,0x70
 .balign 4
_XT_SWAP:
 .long 0xdeadbeef,XT_SWAP


 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x40
 .balign 4
_XT_RPFETCH:
 .long 0xdeadbeef,XT_RPFETCH


 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x21
 .balign 4
_XT_RPSTORE:
 .long 0xdeadbeef,XT_RPSTORE


 .balign 4
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x40
 .balign 4
_XT_SPFETCH:
 .long 0xdeadbeef,XT_SPFETCH


 .balign 4
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x21
 .balign 4
_XT_SPSTORE:
 .long 0xdeadbeef,XT_SPSTORE


 .balign 4
 .long 1b
1:
  .byte 0x1,0x21
 .balign 4
_XT_STORE:
 .long 0xdeadbeef,XT_STORE


 .balign 4
 .long 1b
1:
  .byte 0x1,0x40
 .balign 4
_XT_FETCH:
 .long 0xdeadbeef,XT_FETCH


 .balign 4
 .long 1b
1:
  .byte 0x2,0x63,0x21
 .balign 4
_XT_CSTORE:
 .long 0xdeadbeef,XT_CSTORE


 .balign 4
 .long 1b
1:
  .byte 0x2,0x63,0x40
 .balign 4
_XT_CFETCH:
 .long 0xdeadbeef,XT_CFETCH


 .balign 4
 .long 1b
1:
  .byte 0x4,0x6D,0x6F,0x76,0x65
 .balign 4
_XT_MOVE:
 .long 0xdeadbeef,XT_MOVE


 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x61,0x6D,0x65,0x3F
 .balign 4
_XT_SAMEQ:
 .long 0xdeadbeef,XT_SAMEQ


 .balign 4
 .long 1b
1:
  .byte 0x7,0x65,0x78,0x65,0x63,0x75,0x74,0x65
 .balign 4
_XT_EXECUTE:
 .long 0xdeadbeef,XT_EXECUTE


 .balign 4
 .long 1b
1:
  .byte 0x7,0x65,0x6E,0x64,0x74,0x69,0x63,0x6B
 .balign 4
_XT_ENDTICK:
 .long 0xdeadbeef,XT_ENDTICK


 .balign 4
 .long 1b
1:
  .byte 0x3,0x62,0x79,0x65
 .balign 4
_XT_BYE:
 .long 0xdeadbeef,XT_BYE


 .balign 4
 .long 1b
1:
  .byte 0x9,0x3F,0x64,0x6F,0x64,0x65,0x66,0x69,0x6E,0x65
 .balign 4
_XT_QDODEFINE:
 .long 0xdeadbeef,XT_QDODEFINE


 .balign 4
 .long 1b
1:
  .byte 0x3,0x78,0x74,0x2C
 .balign 4
_XT_XTCOMMA:
 .long 0xdeadbeef,XT_XTCOMMA


 .balign 4
 .long 1b
1:
  .byte 0x2,0x6D,0x73
 .balign 4
_XT_MS:
 .long 0xdeadbeef,XT_MS


 .balign 4
 .long 1b
1:
  .byte 0x9,0x74,0x69,0x6D,0x65,0x26,0x64,0x61,0x74,0x65
 .balign 4
_XT_TIMEANDDATE:
 .long 0xdeadbeef,XT_TIMEANDDATE


 .balign 4
 .long 1b
1:
  .byte 0x28,0x64,0x6F,0x63,0x72,0x65,0x61,0x74,0x65
 .balign 4
_XT_DOCREATE:
 .long 0xdeadbeef,XT_DOCREATE


 .balign 4
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x6C,0x69,0x74
 .balign 4
_XT_DOLIT:
 .long 0xdeadbeef,XT_DOLIT


 .balign 4
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x75,0x73,0x65,0x72
 .balign 4
_XT_DOUSER:
 .long 0xdeadbeef,XT_DOUSER


 .balign 4
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x76,0x61,0x72
 .balign 4
_XT_DOVAR:
 .long 0xdeadbeef,XT_DOVAR


 .balign 4
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x63,0x6F,0x6E,0x73,0x74
 .balign 4
_XT_DOCONST:
 .long 0xdeadbeef,XT_DOCONST


 .balign 4
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x76,0x61,0x6C,0x75,0x65
 .balign 4
_XT_DOVALUE:
 .long 0xdeadbeef,XT_DOVALUE


 .balign 4
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6C,0x69,0x73,0x74
 .balign 4
_XT_DOLIST:
 .long 0xdeadbeef,XT_DOLIST


 .balign 4
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6C,0x6F,0x6F,0x70
 .balign 4
_XT_DOLOOP:
 .long 0xdeadbeef,XT_DOLOOP


 .balign 4
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x2B,0x6C,0x6F,0x6F,0x70
 .balign 4
_XT_DOPLUSLOOP:
 .long 0xdeadbeef,XT_DOPLUSLOOP


 .balign 4
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6E,0x65,0x78,0x74
 .balign 4
_XT_DONEXT:
 .long 0xdeadbeef,XT_DONEXT


 .balign 4
 .long 1b
1:
  .byte 0x27,0x30,0x62,0x72,0x61,0x6E,0x63,0x68
 .balign 4
_XT_ZEROBRANCH:
 .long 0xdeadbeef,XT_ZEROBRANCH


 .balign 4
 .long 1b
1:
  .byte 0x26,0x62,0x72,0x61,0x6E,0x63,0x68
 .balign 4
_XT_BRANCH:
 .long 0xdeadbeef,XT_BRANCH


 .balign 4
 .long 1b
1:
  .byte 0x24,0x65,0x78,0x69,0x74
 .balign 4
_XT_EXIT:
 .long 0xdeadbeef,XT_EXIT


 .balign 4
 .long 1b
1:
  .byte 0x21,0x69
 .balign 4
_XT_I:
 .long 0xdeadbeef,XT_I


 .balign 4
 .long 1b
1:
  .byte 0x22,0x3E,0x72
 .balign 4
_XT_GTR:
 .long 0xdeadbeef,XT_GTR


 .balign 4
 .long 1b
1:
  .byte 0x22,0x72,0x3E
 .balign 4
_XT_RGT:
 .long 0xdeadbeef,XT_RGT


 .balign 4
 .long 1b
1:
  .byte 0x22,0x72,0x40
 .balign 4
_XT_RFETCH:
 .long 0xdeadbeef,XT_RFETCH


 .balign 4
 .long 1b
1:
  .byte 0x8,0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x65
 .balign 4
_XT_ALLOCATE:
 .long 0xdeadbeef,XT_ALLOCATE


 .balign 4
 .long 1b
1:
  .byte 0x4,0x66,0x72,0x65,0x65
 .balign 4
_XT_FREE:
 .long 0xdeadbeef,XT_FREE


 .balign 4
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x73,0x69,0x7A,0x65
 .balign 4
_XT_RESIZE:
 .long 0xdeadbeef,XT_RESIZE


 .balign 4
 .long 1b
1:
  .byte 0x5,0x6F,0x70,0x65,0x6E,0x66
 .balign 4
_XT_OPENF:
 .long 0xdeadbeef,XT_OPENF


 .balign 4
 .long 1b
1:
  .byte 0x6,0x63,0x6C,0x6F,0x73,0x65,0x66
 .balign 4
_XT_CLOSEF:
 .long 0xdeadbeef,XT_CLOSEF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x72,0x65,0x61,0x64,0x66
 .balign 4
_XT_READF:
 .long 0xdeadbeef,XT_READF


 .balign 4
 .long 1b
1:
  .byte 0x6,0x77,0x72,0x69,0x74,0x65,0x66
 .balign 4
_XT_WRITEF:
 .long 0xdeadbeef,XT_WRITEF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x6D,0x6D,0x61,0x70,0x66
 .balign 4
_XT_MMAPF:
 .long 0xdeadbeef,XT_MMAPF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x69,0x7A,0x65,0x66
 .balign 4
_XT_SIZEF:
 .long 0xdeadbeef,XT_SIZEF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x65,0x65,0x6B,0x66
 .balign 4
_XT_SEEKF:
 .long 0xdeadbeef,XT_SEEKF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x74,0x65,0x6C,0x6C,0x66
 .balign 4
_XT_TELLF:
 .long 0xdeadbeef,XT_TELLF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x6C,0x69,0x6E,0x65,0x66
 .balign 4
_XT_LINEF:
 .long 0xdeadbeef,XT_LINEF


 .balign 4
 .long 1b
1:
  .byte 0x7,0x64,0x65,0x6C,0x65,0x74,0x65,0x66
 .balign 4
_XT_DELETEF:
 .long 0xdeadbeef,XT_DELETEF


 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x74,0x61,0x74,0x66
 .balign 4
_XT_STATF:
 .long 0xdeadbeef,XT_STATF


 .balign 4
 .long 1b
1:
  .byte 0x4,0x72,0x65,0x6E,0x66
 .balign 4
_XT_RENF:
 .long 0xdeadbeef,XT_RENF


 .balign 4
 .long 1b
1:
  .byte 0x6,0x74,0x72,0x75,0x6E,0x63,0x66
 .balign 4
_XT_TRUNCF:
 .long 0xdeadbeef,XT_TRUNCF


 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x6C,0x75,0x73,0x68,0x66
 .balign 4
_XT_FLUSHF:
 .long 0xdeadbeef,XT_FLUSHF


 .balign 4
 .long 1b
1:
  .byte 0x8,0x66,0x78,0x3E,0x66,0x6C,0x6F,0x61,0x74
 .balign 4
_XT_FXGTFLOAT:
 .long 0xdeadbeef,XT_FXGTFLOAT


 .balign 4
 .long 1b
1:
  .byte 0x8,0x66,0x6C,0x6F,0x61,0x74,0x3E,0x66,0x78
 .balign 4
_XT_FLOATGTFX:
 .long 0xdeadbeef,XT_FLOATGTFX


 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x70,0x72,0x65,0x70
 .balign 4
_XT_FFPREP:
 .long 0xdeadbeef,XT_FFPREP


 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x63,0x61,0x6C,0x6C
 .balign 4
_XT_FFCALL:
 .long 0xdeadbeef,XT_FFCALL


 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x76,0x6F,0x69,0x64
 .balign 4
_XT_FFVOID:
 .long 0xdeadbeef,XT_FFVOID


 .balign 4
 .long 1b
1:
  .byte 0x5,0x66,0x66,0x69,0x6E,0x74
 .balign 4
_XT_FFINT:
 .long 0xdeadbeef,XT_FFINT


 .balign 4
 .long 1b
1:
  .byte 0x7,0x66,0x66,0x66,0x6C,0x6F,0x61,0x74
 .balign 4
_XT_FFFLOAT:
 .long 0xdeadbeef,XT_FFFLOAT


 .balign 4
 .long 1b
1:
  .byte 0x5,0x66,0x66,0x70,0x74,0x72
 .balign 4
_XT_FFPTR:
 .long 0xdeadbeef,XT_FFPTR


 .balign 4
 .long 1b
1:
  .byte 0x6,0x64,0x6C,0x6F,0x70,0x65,0x6E
 .balign 4
_XT_DLOPEN:
 .long 0xdeadbeef,XT_DLOPEN


 .balign 4
 .long 1b
1:
  .byte 0x5,0x64,0x6C,0x73,0x79,0x6D
 .balign 4
_XT_DLSYM:
 .long 0xdeadbeef,XT_DLSYM


 .balign 4
 .long 1b
1:
  .byte 0x4,0x61,0x72,0x67,0x63
 .balign 4
_XT_ARGC:
 .long 0xdeadbeef,XT_ARGC


 .balign 4
 .long 1b
1:
  .byte 0x4,0x61,0x72,0x67,0x76
 .balign 4
_XT_ARGV:
 .long 0xdeadbeef,XT_ARGV


 .balign 4
 .long 1b
1:
  .byte 0x4,0x6E,0x6F,0x6F,0x70
 .balign 4
_XT_NOOP:
 .long 0xdeadbeef,XT_NOOP


 .balign 4
 .long 1b
1:
  .byte 0x8,0x40,0x65,0x78,0x65,0x63,0x75,0x74,0x65
 .balign 4
XT_FETCHEXECUTE:
 bal XT_DOLIST
 nop 
 .long XT_FETCH,XT_EXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x65,0x6B,0x65,0x79,0x3F
 .balign 4
XT_EKEYQ:
 bal XT_DOLIST
 nop 
 .long XT_TICKEKEYQ,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x65,0x6B,0x65,0x79
 .balign 4
XT_EKEY:
 bal XT_DOLIST
 nop 
 .long XT_TICKEKEY,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x65,0x6D,0x69,0x74,0x3F
 .balign 4
XT_EMITQ:
 bal XT_DOLIST
 nop 
 .long XT_TICKEMITQ,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x65,0x6D,0x69,0x74
 .balign 4
XT_EMIT:
 bal XT_DOLIST
 nop 
 .long XT_TICKEMIT,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x2E,0x70,0x72,0x6F,0x6D,0x70,0x74
 .balign 4
XT_DOTPROMPT:
 bal XT_DOLIST
 nop 
 .long XT_TICKDOTPROMPT,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x63,0x72
 .balign 4
XT_CR:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0xA,XT_EMIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x73,0x70,0x61,0x63,0x65
 .balign 4
XT_SPACE:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x20,XT_EMIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x73,0x70,0x61,0x63,0x65,0x73
 .balign 4
XT_SPACES:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x0,XT_MAX,XT_DOLIT,0x0,XT_DOQDO,0x10,XT_SPACE,XT_DOLOOP,0xFFFFFFF8,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x3F,0x64,0x75,0x70
 .balign 4
_XT_QDUP:
 .long 0xdeadbeef,XT_QDUP


 .balign 4
 .long 1b
1:
  .byte 0x3,0x6E,0x69,0x70
 .balign 4
_XT_NIP:
 .long 0xdeadbeef,XT_NIP


 .balign 4
 .long 1b
1:
  .byte 0x3,0x72,0x6F,0x74
 .balign 4
_XT_ROT:
 .long 0xdeadbeef,XT_ROT


 .balign 4
 .long 1b
1:
  .byte 0x5,0x32,0x64,0x72,0x6F,0x70
 .balign 4
_XT_TWODROP:
 .long 0xdeadbeef,XT_TWODROP


 .balign 4
 .long 1b
1:
  .byte 0x4,0x32,0x64,0x75,0x70
 .balign 4
_XT_TWODUP:
 .long 0xdeadbeef,XT_TWODUP


 .balign 4
 .long 1b
1:
  .byte 0x5,0x32,0x73,0x77,0x61,0x70
 .balign 4
_XT_TWOSWAP:
 .long 0xdeadbeef,XT_TWOSWAP


 .balign 4
 .long 1b
1:
  .byte 0x5,0x32,0x6F,0x76,0x65,0x72
 .balign 4
_XT_TWOOVER:
 .long 0xdeadbeef,XT_TWOOVER


 .balign 4
 .long 1b
1:
  .byte 0x26,0x75,0x6E,0x6C,0x6F,0x6F,0x70
 .balign 4
_XT_UNLOOP:
 .long 0xdeadbeef,XT_UNLOOP


 .balign 4
 .long 1b
1:
  .byte 0x25,0x72,0x64,0x72,0x6F,0x70
 .balign 4
_XT_RDROP:
 .long 0xdeadbeef,XT_RDROP


 .balign 4
 .long 1b
1:
  .byte 0x23,0x40,0x72,0x2B
 .balign 4
XT_FETCHRPLUS:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_RFETCH,XT_FETCH,XT_RGT,XT_CELLPLUS,XT_GTR,XT_SWAP,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x23,0x21,0x72,0x2B
 .balign 4
XT_STORERPLUS:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_SWAP,XT_RFETCH,XT_STORE,XT_RGT,XT_CELLPLUS,XT_GTR,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x64,0x65,0x70,0x74,0x68
 .balign 4
XT_DEPTH:
 bal XT_DOLIST
 nop 
 .long XT_SPFETCH,XT_NEGATE,XT_SPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,0x2,XT_ARSHIFT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x72,0x64,0x65,0x70,0x74,0x68
 .balign 4
XT_RDEPTH:
 bal XT_DOLIST
 nop 
 .long XT_RPFETCH,XT_NEGATE,XT_RPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,0x2,XT_ARSHIFT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x70,0x69,0x63,0x6B
 .balign 4
_XT_PICK:
 .long 0xdeadbeef,XT_PICK


 .balign 4
 .long 1b
1:
  .byte 0x5,0x72,0x70,0x69,0x63,0x6B
 .balign 4
XT_RPICK:
 bal XT_DOLIST
 nop 
 .long XT_RDEPTH,XT_DUP,XT_DOLIT,0x2,XT_LT,XT_DOQTHROW,0xFFFFFFFC,XT_DOLIT,0x2,XT_MINUS,XT_OVER,XT_ULT,XT_DOQTHROW,0xFFFFFFFC,XT_ONEPLUS,XT_CELLS,XT_RPFETCH,XT_PLUS,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x2E,0x73
 .balign 4
XT_DOTS:
 bal XT_DOLIST
 nop 
 .long XT_DEPTH,XT_DOLIT,0x0,XT_LTNUMBER,XT_DOLIT,0x3E,XT_HOLD,XT_NUMBERS,XT_DOLIT,0x3C,XT_HOLD,XT_NUMBERGT,XT_TYPE,XT_SPACE,XT_DEPTH,XT_DUP,XT_DOLIT,0x0,XT_DOQDO,0x1C,XT_DUP,XT_PICK,XT_DOT,XT_ONEMINUS,XT_DOLOOP,0xFFFFFFEC,XT_UNLOOP,XT_DROP,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x2E,0x72,0x73
 .balign 4
XT_DOTRS:
 bal XT_DOLIST
 nop 
 .long XT_RDEPTH,XT_DOT,XT_DOLIT,0x4,XT_SPACES,XT_RDEPTH,XT_DOLIT,0x0,XT_DOQDO,0x18,XT_I,XT_RPICK,XT_DOT,XT_DOLOOP,0xFFFFFFF0,XT_UNLOOP,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x74,0x68,0x72,0x6F,0x77
 .balign 4
XT_THROW:
 bal XT_DOLIST
 nop 
 .long XT_QDUP,XT_ZEROBRANCH,0x34,XT_THROWFRAME,XT_FETCH,XT_RPSTORE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RGT,XT_SWAP,XT_GTR,XT_SPSTORE,XT_DROP,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x28,0x64,0x6F,0x3F,0x74,0x68,0x72,0x6F,0x77
 .balign 4
XT_DOQTHROW:
 bal XT_DOLIST
 nop 
 .long XT_ZEROLTGT,XT_FETCHRPLUS,XT_AND,XT_THROW,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x61,0x74,0x63,0x68
 .balign 4
XT_CATCH:
 bal XT_DOLIST
 nop 
 .long XT_SPFETCH,XT_GTR,XT_THROWFRAME,XT_FETCH,XT_GTR,XT_RPFETCH,XT_THROWFRAME,XT_STORE,XT_EXECUTE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RDROP,XT_DOLIT,0x0,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x2B
 .balign 4
_XT_PLUS:
 .long 0xdeadbeef,XT_PLUS


 .balign 4
 .long 1b
1:
  .byte 0x2,0x31,0x2B
 .balign 4
_XT_ONEPLUS:
 .long 0xdeadbeef,XT_ONEPLUS


 .balign 4
 .long 1b
1:
  .byte 0x2,0x31,0x2D
 .balign 4
_XT_ONEMINUS:
 .long 0xdeadbeef,XT_ONEMINUS


 .balign 4
 .long 1b
1:
  .byte 0x6,0x69,0x6E,0x76,0x65,0x72,0x74
 .balign 4
_XT_INVERT:
 .long 0xdeadbeef,XT_INVERT


 .balign 4
 .long 1b
1:
  .byte 0x6,0x6E,0x65,0x67,0x61,0x74,0x65
 .balign 4
_XT_NEGATE:
 .long 0xdeadbeef,XT_NEGATE


 .balign 4
 .long 1b
1:
  .byte 0x1,0x2D
 .balign 4
_XT_MINUS:
 .long 0xdeadbeef,XT_MINUS


 .balign 4
 .long 1b
1:
  .byte 0x21,0x6A
 .balign 4
_XT_J:
 .long 0xdeadbeef,XT_J


 .balign 4
 .long 1b
1:
  .byte 0x3,0x30,0x3C,0x3E
 .balign 4
_XT_ZEROLTGT:
 .long 0xdeadbeef,XT_ZEROLTGT


 .balign 4
 .long 1b
1:
  .byte 0x1,0x3C
 .balign 4
_XT_LT:
 .long 0xdeadbeef,XT_LT


 .balign 4
 .long 1b
1:
  .byte 0x2,0x75,0x3C
 .balign 4
_XT_ULT:
 .long 0xdeadbeef,XT_ULT


 .balign 4
 .long 1b
1:
  .byte 0x1,0x3E
 .balign 4
_XT_GT:
 .long 0xdeadbeef,XT_GT


 .balign 4
 .long 1b
1:
  .byte 0x2,0x75,0x3E
 .balign 4
XT_UGT:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_ULT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x75,0x3E,0x3D
 .balign 4
XT_UGTEQUALS:
 bal XT_DOLIST
 nop 
 .long XT_ULT,XT_ZEROEQUALS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x3D
 .balign 4
_XT_EQUALS:
 .long 0xdeadbeef,XT_EQUALS


 .balign 4
 .long 1b
1:
  .byte 0x2,0x3C,0x3E
 .balign 4
_XT_LTGT:
 .long 0xdeadbeef,XT_LTGT


 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x2B
 .balign 4
_XT_CELLPLUS:
 .long 0xdeadbeef,XT_CELLPLUS


 .balign 4
 .long 1b
1:
  .byte 0x24,0x64,0x6F,0x64,0x6F
 .balign 4
_XT_DODO:
 .long 0xdeadbeef,XT_DODO


 .balign 4
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x66,0x6F,0x72
 .balign 4
XT_DOFOR:
 bal XT_DOLIST
 nop 
 .long XT_RGT,XT_SWAP,XT_DUP,XT_GTR,XT_GTR,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x3F,0x64,0x6F
 .balign 4
XT_DOQDO:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_EQUALS,XT_ZEROBRANCH,0x24,XT_TWODROP,XT_RGT,XT_DUP,XT_FETCH,XT_PLUS,XT_CELLPLUS,XT_GTR,XT_EXIT,XT_RGT,XT_ROT,XT_GTR,XT_SWAP,XT_GTR,XT_CELLPLUS,XT_GTR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x61,0x62,0x73
 .balign 4
_XT_ABS:
 .long 0xdeadbeef,XT_ABS


 .balign 4
 .long 1b
1:
  .byte 0x6,0x6C,0x73,0x68,0x69,0x66,0x74
 .balign 4
_XT_LSHIFT:
 .long 0xdeadbeef,XT_LSHIFT


 .balign 4
 .long 1b
1:
  .byte 0x7,0x61,0x72,0x73,0x68,0x69,0x66,0x74
 .balign 4
XT_ARSHIFT:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x0,XT_DOQDO,0x10,XT_TWOSLASH,XT_DOLOOP,0xFFFFFFF8,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x72,0x73,0x68,0x69,0x66,0x74
 .balign 4
_XT_RSHIFT:
 .long 0xdeadbeef,XT_RSHIFT


 .balign 4
 .long 1b
1:
  .byte 0x3,0x6D,0x61,0x78
 .balign 4
_XT_MAX:
 .long 0xdeadbeef,XT_MAX


 .balign 4
 .long 1b
1:
  .byte 0x3,0x6D,0x69,0x6E
 .balign 4
_XT_MIN:
 .long 0xdeadbeef,XT_MIN


 .balign 4
 .long 1b
1:
  .byte 0x4,0x75,0x6D,0x69,0x6E
 .balign 4
XT_UMIN:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_UGT,XT_ZEROBRANCH,0x8,XT_SWAP,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x75,0x6D,0x2A
 .balign 4
_XT_UMSTAR:
 .long 0xdeadbeef,XT_UMSTAR


 .balign 4
 .long 1b
1:
  .byte 0x7,0x64,0x6E,0x65,0x67,0x61,0x74,0x65
 .balign 4
_XT_DNEGATE:
 .long 0xdeadbeef,XT_DNEGATE


 .balign 4
 .long 1b
1:
  .byte 0x2,0x6D,0x2A
 .balign 4
_XT_MSTAR:
 .long 0xdeadbeef,XT_MSTAR


 .balign 4
 .long 1b
1:
  .byte 0x1,0x2A
 .balign 4
_XT_STAR:
 .long 0xdeadbeef,XT_STAR


 .balign 4
 .long 1b
1:
  .byte 0x6,0x75,0x6D,0x2F,0x6D,0x6F,0x64
 .balign 4
_XT_UMSLASHMOD:
 .long 0xdeadbeef,XT_UMSLASHMOD


 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x6D,0x2F,0x6D,0x6F,0x64
 .balign 4
XT_FMSLASHMOD:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_RFETCH,XT_TWODUP,XT_XOR,XT_GTR,XT_GTR,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DNEGATE,XT_RFETCH,XT_ABS,XT_UMSLASHMOD,XT_RGT,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_SWAP,XT_NEGATE,XT_SWAP,XT_RGT,XT_ZEROLT,XT_ZEROBRANCH,0x48,XT_NEGATE,XT_OVER,XT_ZEROBRANCH,0x18,XT_RFETCH,XT_ROT,XT_MINUS,XT_SWAP,XT_ONEMINUS,XT_RDROP,XT_DOLIT,0x0,XT_OVER,XT_LT,XT_DOQTHROW,0xFFFFFFF5,XT_EXIT,XT_RDROP,XT_DUP,XT_ZEROLT,XT_DOQTHROW,0xFFFFFFF5,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x73,0x3E,0x64
 .balign 4
_XT_SGTD:
 .long 0xdeadbeef,XT_SGTD


 .balign 4
 .long 1b
1:
  .byte 0x4,0x2F,0x6D,0x6F,0x64
 .balign 4
XT_SLASHMOD:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_SGTD,XT_RGT,XT_FMSLASHMOD,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x2F
 .balign 4
XT_SLASH:
 bal XT_DOLIST
 nop 
 .long XT_SLASHMOD,XT_NIP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x6D,0x6F,0x64
 .balign 4
XT_MOD:
 bal XT_DOLIST
 nop 
 .long XT_SLASHMOD,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x77,0x69,0x74,0x68,0x69,0x6E
 .balign 4
_XT_WITHIN:
 .long 0xdeadbeef,XT_WITHIN


 .balign 4
 .long 1b
1:
  .byte 0x2,0x64,0x2B
 .balign 4
_XT_DPLUS:
 .long 0xdeadbeef,XT_DPLUS


 .balign 4
 .long 1b
1:
  .byte 0x6,0x75,0x6E,0x64,0x65,0x72,0x2B
 .balign 4
XT_UNDERPLUS:
 bal XT_DOLIST
 nop 
 .long XT_ROT,XT_PLUS,XT_SWAP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x68,0x61,0x72,0x2B
 .balign 4
_XT_CHARPLUS:
 .long 0xdeadbeef,XT_CHARPLUS


 .balign 4
 .long 1b
1:
  .byte 0x5,0x3F,0x64,0x69,0x63,0x74
 .balign 4
XT_QDICT:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_PAD,XT_UGTEQUALS,XT_DOQTHROW,0xFFFFFFF8,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x73
 .balign 4
_XT_CELLS:
 .long 0xdeadbeef,XT_CELLS


 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x2D
 .balign 4
_XT_CELLMINUS:
 .long 0xdeadbeef,XT_CELLMINUS


 .balign 4
 .long 1b
1:
  .byte 0x2,0x32,0x21
 .balign 4
_XT_TWOSTORE:
 .long 0xdeadbeef,XT_TWOSTORE


 .balign 4
 .long 1b
1:
  .byte 0x2,0x32,0x40
 .balign 4
_XT_TWOFETCH:
 .long 0xdeadbeef,XT_TWOFETCH


 .balign 4
 .long 1b
1:
  .byte 0x7,0x61,0x6C,0x69,0x67,0x6E,0x65,0x64
 .balign 4
_XT_ALIGNED:
 .long 0xdeadbeef,XT_ALIGNED


 .balign 4
 .long 1b
1:
  .byte 0x5,0x61,0x6C,0x69,0x67,0x6E
 .balign 4
XT_ALIGN:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_ALIGNED,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x2D,0x72,0x6F,0x74
 .balign 4
XT_MINUSROT:
 bal XT_DOLIST
 nop 
 .long XT_ROT,XT_ROT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x66,0x69,0x6C,0x6C
 .balign 4
_XT_FILL:
 .long 0xdeadbeef,XT_FILL


 .balign 4
 .long 1b
1:
  .byte 0x5,0x63,0x6F,0x75,0x6E,0x74
 .balign 4
_XT_COUNT:
 .long 0xdeadbeef,XT_COUNT


 .balign 4
 .long 1b
1:
  .byte 0x9,0x6E,0x61,0x6D,0x65,0x63,0x6F,0x75,0x6E,0x74
 .balign 4
XT_NAMECOUNT:
 bal XT_DOLIST
 nop 
 .long XT_COUNT,XT_DOLIT,0x1F,XT_AND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x70,0x6C,0x61,0x63,0x65
 .balign 4
XT_PLACE:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_DOLIT,0xFF,XT_UGTEQUALS,XT_DOQTHROW,0xFFFFFFEE,XT_GTR,XT_RFETCH,XT_CSTORE,XT_RFETCH,XT_ONEPLUS,XT_RGT,XT_CFETCH,XT_MOVE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x2B,0x21
 .balign 4
_XT_PLUSSTORE:
 .long 0xdeadbeef,XT_PLUSSTORE


 .balign 4
 .long 1b
1:
  .byte 0x5,0x61,0x6C,0x6C,0x6F,0x74
 .balign 4
XT_ALLOT:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_PLUS,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x2C
 .balign 4
XT_COMMA:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_STORE,XT_DOLIT,0x4,XT_ALLOT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x6F,0x66,0x66
 .balign 4
XT_OFF:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x0,XT_SWAP,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x6F,0x6E
 .balign 4
XT_ON:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0xFFFFFFFF,XT_SWAP,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x73,0x6F,0x75,0x72,0x63,0x65
 .balign 4
XT_SOURCE:
 bal XT_DOLIST
 nop 
 .long XT_SOURCEVAR,XT_TWOFETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x2F,0x73,0x74,0x72,0x69,0x6E,0x67
 .balign 4
XT_SLASHSTRING:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_RFETCH,XT_UNDERPLUS,XT_RGT,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x8,0x75,0x6E,0x70,0x61,0x72,0x73,0x65,0x64
 .balign 4
XT_UNPARSED:
 bal XT_DOLIST
 nop 
 .long XT_SOURCE,XT_GTIN,XT_FETCH,XT_SLASHSTRING,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x75,0x6E,0x70,0x61,0x72,0x73,0x65,0x64,0x21
 .balign 4
XT_UNPARSEDSTORE:
 bal XT_DOLIST
 nop 
 .long XT_SOURCE,XT_MINUSROT,XT_MINUS,XT_UMIN,XT_GTIN,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x73,0x63,0x61,0x6E
 .balign 4
XT_SCAN:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,0x30,XT_OVER,XT_CFETCH,XT_RFETCH,XT_XOR,XT_ZEROBRANCH,0x18,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFCC,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x73,0x6B,0x69,0x70
 .balign 4
XT_SKIP:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,0x30,XT_OVER,XT_CFETCH,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,0x18,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFCC,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x70,0x61,0x72,0x73,0x65
 .balign 4
XT_PARSE:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_UNPARSED,XT_OVER,XT_SWAP,XT_RGT,XT_SCAN,XT_DROP,XT_OVER,XT_MINUS,XT_TWODUP,XT_PLUS,XT_ONEPLUS,XT_UNPARSEDSTORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x73,0x6B,0x69,0x70,0x70,0x61,0x72,0x73,0x65
 .balign 4
XT_SKIPPARSE:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_UNPARSED,XT_RFETCH,XT_SKIP,XT_DROP,XT_UNPARSEDSTORE,XT_RGT,XT_PARSE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0xA,0x70,0x61,0x72,0x73,0x65,0x2D,0x77,0x6F,0x72,0x64
 .balign 4
XT_PARSEMINUSWORD:
 bal XT_DOLIST
 nop 
 .long XT_BL,XT_SKIPPARSE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x23,0x6F,0x72,0x64,0x65,0x72
 .balign 4
XT_NUMBERORDER:
 bal XT_DOCREATE
 nop 

 .long XT_NOOP
 .long 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0

 .balign 4
 .long 1b
1:
  .byte 0x5,0x64,0x69,0x63,0x74,0x3F
 .balign 4
XT_DICTQ:
 bal XT_DOLIST
 nop 
 .long XT_DICTZERO,XT_MEMTOP,XT_WITHIN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x6E,0x61,0x6D,0x65,0x3E,0x78,0x74
 .balign 4
XT_NAMEGTXT:
 bal XT_DOLIST
 nop 
 .long XT_NAMECOUNT,XT_PLUS,XT_ALIGNED,XT_DUP,XT_FETCH,XT_DOLIT,0xDEADBEEF,XT_EQUALS,XT_ZEROBRANCH,0xC,XT_CELLPLUS,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x70,0x72,0x69,0x6D,0x78,0x74,0x3F
 .balign 4
XT_PRIMXTQ:
 bal XT_DOLIST
 nop 
 .long XT_XTOF,XT_NOOP,XT_XTOF,XT_ARGV,XT_CELLPLUS,XT_WITHIN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x6C,0x69,0x6E,0x6B,0x3F
 .balign 4
XT_LINKQ:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_ZEROEQUALS,XT_SWAP,XT_DICTQ,XT_OR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x78,0x74,0x3E,0x6E,0x61,0x6D,0x65
 .balign 4
XT_XTGTNAME:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_XTOF,XT_DICTZERO,XT_EQUALS,XT_ZEROBRANCH,0x14,XT_DOLIT,0x8,XT_MINUS,XT_EXIT,XT_GTR,XT_RFETCH,XT_PRIMXTQ,XT_ZEROBRANCH,0x38,XT_XTOF,XT_COLD,XT_XTGTNAME,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,0xFFFFFFE4,XT_BRANCH,0x60,XT_RFETCH,XT_QDODEFINE,XT_NIP,XT_ZEROEQUALS,XT_ZEROBRANCH,0x14,XT_RDROP,XT_DOLIT,0x0,XT_EXIT,XT_RFETCH,XT_CELLMINUS,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_OVER,XT_CELLMINUS,XT_FETCH,XT_LINKQ,XT_AND,XT_ZEROBRANCH,0xFFFFFFD4,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x62,0x6F,0x75,0x6E,0x64,0x73
 .balign 4
XT_BOUNDS:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_PLUS,XT_SWAP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0xA,0x66,0x6F,0x72,0x77,0x6F,0x72,0x64,0x73,0x69,0x6E
 .balign 4
XT_FORWORDSIN:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x0,XT_DOTO,XT_FOUND,XT_GTR,XT_CELLPLUS,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_FOUND,XT_ZEROEQUALS,XT_AND,XT_ZEROBRANCH,0x14,XT_RFETCH,XT_EXECUTE,XT_BRANCH,0xFFFFFFD4,XT_DROP,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x8,0x66,0x6F,0x72,0x77,0x6F,0x72,0x64,0x73
 .balign 4
XT_FORWORDS:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_NUMBERORDER,XT_CELLPLUS,XT_NUMBERORDER,XT_FETCH,XT_CELLS,XT_BOUNDS,XT_DOQDO,0x3C,XT_I,XT_FETCH,XT_J,XT_FORWORDSIN,XT_FOUND,XT_ZEROBRANCH,0xC,XT_BRANCH,0x18,XT_DOLIT,0x1,XT_CELLS,XT_DOPLUSLOOP,0xFFFFFFCC,XT_UNLOOP,XT_RDROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x6D,0x61,0x74,0x63,0x68,0x3F
 .balign 4
XT_MATCHQ:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_NAMECOUNT,XT_PARSED,XT_FETCH,XT_EQUALS,XT_ZEROBRANCH,0x30,XT_PARSED,XT_TWOFETCH,XT_SAMEQ,XT_ZEROEQUALS,XT_ZEROBRANCH,0x10,XT_DUP,XT_DOTO,XT_FOUND,XT_BRANCH,0x8,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x6E,0x66,0x61,0x69,0x6E
 .balign 4
XT_NFAIN:
 bal XT_DOLIST
 nop 
 .long XT_GTR,XT_PARSED,XT_TWOSTORE,XT_RGT,XT_XTOF,XT_MATCHQ,XT_FORWORDSIN,XT_FOUND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x6E,0x66,0x61
 .balign 4
XT_NFA:
 bal XT_DOLIST
 nop 
 .long XT_PARSED,XT_TWOSTORE,XT_XTOF,XT_MATCHQ,XT_FORWORDS,XT_FOUND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x3,0x66,0x78,0x74
 .balign 4
XT_FXT:
 bal XT_DOLIST
 nop 
 .long XT_FOUND,XT_NAMEGTXT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x66,0x69,0x6D,0x6D,0x65,0x64
 .balign 4
XT_FIMMED:
 bal XT_DOLIST
 nop 
 .long XT_FOUND,XT_CFETCH,XT_DOLIT,0x40,XT_AND,XT_ZEROEQUALS,XT_TWOSTAR,XT_ONEPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x2F,0x66,0x63,0x6F,0x6D,0x70,0x6F
 .balign 4
XT_SLASHFCOMPO:
 bal XT_DOLIST
 nop 
 .long XT_FOUND,XT_CFETCH,XT_DOLIT,0x20,XT_AND,XT_ZEROEQUALS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x27
 .balign 4
XT_TICK:
 bal XT_DOLIST
 nop 
 .long XT_PARSEMINUSWORD,XT_NFA,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF3,XT_FXT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x74,0x79,0x70,0x65
 .balign 4
XT_TYPE:
 bal XT_DOLIST
 nop 
 .long XT_BOUNDS,XT_DOQDO,0x18,XT_I,XT_CFETCH,XT_EMIT,XT_DOLOOP,0xFFFFFFF0,XT_UNLOOP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x8,0x72,0x65,0x64,0x65,0x66,0x73,0x74,0x72
 .balign 4
XT_REDEFSTR:
 bal XT_DOVAR
 nop 
  .byte 0xA,0x72,0x65,0x64,0x65,0x66,0x69,0x6E,0x65,0x64,0x20


 .balign 4
 .long 1b
1:
  .byte 0x7,0x28,0x68,0x65,0x61,0x64,0x2C,0x29
 .balign 4
XT_LPARENHEADCOMMARPAREN:
 bal XT_DOLIST
 nop 
 .long XT_QDICT,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF0,XT_DUP,XT_DOLIT,0x1F,XT_GT,XT_DOQTHROW,0xFFFFFFED,XT_TWODUP,XT_GETMINUSCURRENT,XT_NFAIN,XT_ZEROBRANCH,0x2C,XT_WARNINGS,XT_FETCH,XT_ZEROBRANCH,0x1C,XT_REDEFSTR,XT_COUNT,XT_TYPE,XT_TWODUP,XT_TYPE,XT_SPACE,XT_ALIGN,XT_GETMINUSCURRENT,XT_FETCH,XT_COMMA,XT_HERE,XT_DOTO,XT_LASTNAME,XT_SCOMMA,XT_ALIGN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x68,0x65,0x61,0x64,0x2C
 .balign 4
XT_HEADCOMMA:
 bal XT_DOLIST
 nop 
 .long XT_PARSEMINUSWORD,XT_LPARENHEADCOMMARPAREN,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x68,0x6F,0x6C,0x64
 .balign 4
XT_HOLD:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0xFFFFFFFF,XT_HLD,XT_PLUSSTORE,XT_HLD,XT_FETCH,XT_CSTORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x3C,0x23
 .balign 4
XT_LTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_DOLIT,0x100,XT_PLUS,XT_HLD,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x23
 .balign 4
XT_NUMBER:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0x0,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_GTR,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_SWAP,XT_DOLIT,0x9,XT_OVER,XT_LT,XT_DOLIT,0x7,XT_AND,XT_PLUS,XT_DOLIT,0x30,XT_PLUS,XT_HOLD,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x23,0x73
 .balign 4
XT_NUMBERS:
 bal XT_DOLIST
 nop 
 .long XT_NUMBER,XT_TWODUP,XT_OR,XT_ZEROEQUALS,XT_ZEROBRANCH,0xFFFFFFEC,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x23,0x3E
 .balign 4
XT_NUMBERGT:
 bal XT_DOLIST
 nop 
 .long XT_TWODROP,XT_HLD,XT_FETCH,XT_HERE,XT_DOLIT,0x100,XT_PLUS,XT_OVER,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x73,0x69,0x67,0x6E
 .balign 4
XT_SIGN:
 bal XT_DOLIST
 nop 
 .long XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_DOLIT,0x2D,XT_HOLD,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x28,0x64,0x2E,0x29
 .balign 4
XT_LPARENDDOTRPAREN:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_OVER,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DNEGATE,XT_LTNUMBER,XT_NUMBERS,XT_ROT,XT_SIGN,XT_NUMBERGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x64,0x2E
 .balign 4
XT_DDOT:
 bal XT_DOLIST
 nop 
 .long XT_LPARENDDOTRPAREN,XT_TYPE,XT_SPACE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x2E
 .balign 4
XT_DOT:
 bal XT_DOLIST
 nop 
 .long XT_SGTD,XT_DDOT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x61,0x5B
 .balign 4
XT_LBRACKET:
 bal XT_DOLIST
 nop 
 .long XT_STATE,XT_OFF,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x5D
 .balign 4
XT_RBRACKET:
 bal XT_DOLIST
 nop 
 .long XT_STATE,XT_ON,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x70,0x72,0x69,0x6E,0x74,0x61,0x62,0x6C,0x65
 .balign 4
XT_PRINTABLE:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_SPAN,XT_FETCH,XT_UGTEQUALS,XT_AND,XT_DUP,XT_GTR,XT_ZEROBRANCH,0x30,XT_OVER,XT_SPAN,XT_FETCH,XT_PLUS,XT_RFETCH,XT_SWAP,XT_CSTORE,XT_DOLIT,0x1,XT_SPAN,XT_PLUSSTORE,XT_RGT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x61,0x63,0x63,0x65,0x70,0x74
 .balign 4
XT_ACCEPT:
 bal XT_DOLIST
 nop 
 .long XT_TWODUP,XT_BL,XT_FILL,XT_SPAN,XT_OFF,XT_EKEY,XT_TICKKHAN,XT_FETCHEXECUTE,XT_DOLIT,0xA,XT_EQUALS,XT_ZEROBRANCH,0xFFFFFFE4,XT_TWODROP,XT_DOLIT,0xFFFFFFFF,XT_SPAN,XT_PLUSSTORE,XT_SPAN,XT_FETCH,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x66,0x69,0x6C,0x6C
 .balign 4
XT_REFILL:
 bal XT_DOLIST
 nop 
 .long XT_SOURCEMINUSID,XT_ZEROBRANCH,0x10,XT_DOLIT,0x0,XT_EXIT,XT_TIB,XT_DUP,XT_DOLIT,0x100,XT_ACCEPT,XT_SOURCEVAR,XT_TWOSTORE,XT_GTIN,XT_OFF,XT_DOLIT,0xFFFFFFFF,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x8,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x2C
 .balign 4
XT_COMPILECOMMA:
 bal XT_DOLIST
 nop 
 .long XT_TICKCOMPILECOMMA,XT_FETCHEXECUTE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x28,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x29
 .balign 4
XT_LPARENCOMPILERPAREN:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_COMPILECOMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x24,0x78,0x74,0x6F,0x66
 .balign 4
XT_XTOF:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x74,0x6F,0x75,0x70,0x70,0x65,0x72
 .balign 4
XT_TOUPPER:
 bal XT_DOLIST
 nop 
 .long XT_DUP,XT_DOLIT,0x61,XT_DOLIT,0x7B,XT_WITHIN,XT_DOLIT,0x20,XT_AND,XT_INVERT,XT_AND,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x64,0x69,0x67,0x69,0x74
 .balign 4
XT_DIGIT:
 bal XT_DOLIST
 nop 
 .long XT_TOUPPER,XT_DUP,XT_DOLIT,0x3A,XT_DOLIT,0x41,XT_WITHIN,XT_DOLIT,0x80,XT_AND,XT_PLUS,XT_DUP,XT_DOLIT,0x41,XT_UGTEQUALS,XT_DOLIT,0x7,XT_AND,XT_MINUS,XT_DOLIT,0x30,XT_MINUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x64,0x69,0x67,0x69,0x74,0x3F
 .balign 4
XT_DIGITQ:
 bal XT_DOLIST
 nop 
 .long XT_DIGIT,XT_BASE,XT_FETCH,XT_ULT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x61,0x63,0x63,0x75,0x6D
 .balign 4
XT_ACCUM:
 bal XT_DOLIST
 nop 
 .long XT_SWAP,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DROP,XT_ROT,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x3E,0x6E,0x75,0x6D,0x62,0x65,0x72
 .balign 4
XT_GTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_BASE,XT_FETCH,XT_GTR,XT_OVER,XT_CFETCH,XT_DOLIT,0x23,XT_EQUALS,XT_ZEROBRANCH,0x34,XT_TWOSWAP,XT_DROP,XT_BASE,XT_STORE,XT_DOLIT,0x0,XT_DOLIT,0x0,XT_TWOSWAP,XT_DOLIT,0x1,XT_SLASHSTRING,XT_OVER,XT_CFETCH,XT_DIGITQ,XT_OVER,XT_AND,XT_ZEROBRANCH,0x38,XT_GTR,XT_GTR,XT_RFETCH,XT_CFETCH,XT_DIGIT,XT_ACCUM,XT_RGT,XT_RGT,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFF68,XT_RGT,XT_BASE,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x73,0x3E,0x75,0x6E,0x75,0x6D,0x62,0x65,0x72
 .balign 4
XT_SGTUNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_DOLIT,0xFFFFFFFF,XT_DPL,XT_STORE,XT_DOLIT,0x0,XT_DOLIT,0x0,XT_TWOSWAP,XT_GTNUMBER,XT_DUP,XT_ZEROBRANCH,0x44,XT_OVER,XT_CFETCH,XT_DOLIT,0x2E,XT_LTGT,XT_DOQTHROW,0xFFFFFFF3,XT_DUP,XT_ONEMINUS,XT_DPL,XT_STORE,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFB4,XT_TWODROP,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x8,0x73,0x3E,0x6E,0x75,0x6D,0x62,0x65,0x72
 .balign 4
XT_SGTNUMBER:
 bal XT_DOLIST
 nop 
 .long XT_OVER,XT_CFETCH,XT_DOLIT,0x2D,XT_EQUALS,XT_GTR,XT_RFETCH,XT_NEGATE,XT_SLASHSTRING,XT_SGTUNUMBER,XT_RGT,XT_ZEROBRANCH,0x28,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_NEGATE,XT_BRANCH,0x8,XT_DNEGATE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x67,0x6C,0x69,0x74,0x65,0x72,0x61,0x6C
 .balign 4
XT_LITERAL:
 bal XT_DOLIST
 nop 
 .long XT_LPARENCOMPILERPAREN,XT_DOLIT,XT_COMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x64,0x6F,0x32,0x6C,0x69,0x74
 .balign 4
XT_DOTWOLIT:
 bal XT_DOLIST
 nop 
 .long XT_FETCHRPLUS,XT_FETCHRPLUS,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x68,0x32,0x6C,0x69,0x74,0x65,0x72,0x61,0x6C
 .balign 4
XT_TWOLITERAL:
 bal XT_DOLIST
 nop 
 .long XT_LPARENCOMPILERPAREN,XT_DOTWOLIT,XT_SWAP,XT_COMMA,XT_COMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x9,0x69,0x6E,0x74,0x65,0x72,0x70,0x72,0x65,0x74
 .balign 4
XT_INTERPRET:
 bal XT_DOLIST
 nop 
 .long XT_DEPTH,XT_ZEROLT,XT_DOQTHROW,0xFFFFFFFC,XT_PARSEMINUSWORD,XT_DUP,XT_ZEROBRANCH,0xBC,XT_NFA,XT_ZEROBRANCH,0x68,XT_STATE,XT_FETCH,XT_SLASHFCOMPO,XT_OR,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF2,XT_FXT,XT_STATE,XT_FETCH,XT_ZEROBRANCH,0x2C,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_COMPILECOMMA,XT_BRANCH,0x8,XT_EXECUTE,XT_BRANCH,0x8,XT_EXECUTE,XT_BRANCH,0x44,XT_PARSED,XT_TWOFETCH,XT_SGTNUMBER,XT_STATE,XT_FETCH,XT_ZEROBRANCH,0x28,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_LITERAL,XT_BRANCH,0x8,XT_TWOLITERAL,XT_BRANCH,0xFFFFFF2C,XT_TWODROP,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x5,0x65,0x78,0x73,0x74,0x72
 .balign 4
XT_EXSTR:
 bal XT_DOVAR
 nop 
  .byte 0xD,0x20,0x65,0x78,0x63,0x65,0x70,0x74,0x69,0x6F,0x6E,0x20,0x23,0x20


 .balign 4
 .long 1b
1:
  .byte 0x4,0x2E,0x65,0x72,0x72
 .balign 4
XT_DOTERR:
 bal XT_DOLIST
 nop 
 .long XT_PARSED,XT_TWOFETCH,XT_TYPE,XT_EXSTR,XT_COUNT,XT_TYPE,XT_DOT,XT_CR,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x71,0x75,0x69,0x74
 .balign 4
XT_QUIT:
 bal XT_DOLIST
 nop 
 .long XT_RPZERO,XT_FETCH,XT_RPSTORE,XT_DOLIT,0x0,XT_DOTO,XT_SOURCEMINUSID,XT_BAL,XT_OFF,XT_LBRACKET,XT_REFILL,XT_DROP,XT_TICKINTERPRET,XT_FETCH,XT_CATCH,XT_QDUP,XT_ZEROEQUALS,XT_ZEROBRANCH,0x24,XT_STATE,XT_FETCH,XT_ZEROEQUALS,XT_ZEROBRANCH,0x8,XT_DOTPROMPT,XT_BRANCH,0xFFFFFFC0,XT_TICKDOTERROR,XT_FETCHEXECUTE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_BRANCH,0xFFFFFF7C,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x7,0x3A,0x6E,0x6F,0x6E,0x61,0x6D,0x65
 .balign 4
XT_COLONNONAME:
 bal XT_DOLIST
 nop 
 .long XT_BAL,XT_FETCH,XT_DOQTHROW,0xFFFFFFE3,XT_HASNAMEQ,XT_OFF,XT_DOLIT,0x1,XT_BAL,XT_STORE,XT_RBRACKET,XT_XTOF,XT_DOLIST,XT_XTCOMMA,XT_DUP,XT_DOLIT,0xFFFFFFFF,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x1,0x3A
 .balign 4
XT_COLON:
 bal XT_DOLIST
 nop 
 .long XT_HEADCOMMA,XT_COLONNONAME,XT_ROT,XT_DROP,XT_HASNAMEQ,XT_ON,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x64,0x75,0x6D,0x6D,0x79,0x31
 .balign 4
XT_DUMMYONE:
 bal XT_DOVAR
 nop 
 .long 0x0

 .balign 4
 .long 1b
1:
  .byte 0x8,0x6C,0x69,0x6E,0x6B,0x6C,0x61,0x73,0x74
 .balign 4
XT_LINKLAST:
 bal XT_DOLIST
 nop 
 .long XT_LASTNAME,XT_GETMINUSCURRENT,XT_STORE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x76,0x65,0x61,0x6C
 .balign 4
XT_REVEAL:
 bal XT_DOLIST
 nop 
 .long XT_HASNAMEQ,XT_FETCH,XT_ZEROBRANCH,0x8,XT_LINKLAST,XT_HASNAMEQ,XT_OFF,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x61,0x3B
 .balign 4
XT_SEMI:
 bal XT_DOLIST
 nop 
 .long XT_BAL,XT_FETCH,XT_ONEMINUS,XT_DOQTHROW,0xFFFFFFEA,XT_NIP,XT_ONEPLUS,XT_DOQTHROW,0xFFFFFFEA,XT_REVEAL,XT_BAL,XT_OFF,XT_LPARENCOMPILERPAREN,XT_EXIT,XT_LBRACKET,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x24,0x64,0x6F,0x74,0x6F
 .balign 4
_XT_DOTO:
 .long 0xdeadbeef,XT_DOTO


 .balign 4
 .long 1b
1:
  .byte 0x68,0x70,0x6F,0x73,0x74,0x70,0x6F,0x6E,0x65
 .balign 4
XT_POSTPONE:
 bal XT_DOLIST
 nop 
 .long XT_TICK,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,0x14,XT_LPARENCOMPILERPAREN,XT_LPARENCOMPILERPAREN,XT_COMMA,XT_EXIT,XT_COMPILECOMMA,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x2,0x73,0x2C
 .balign 4
XT_SCOMMA:
 bal XT_DOLIST
 nop 
 .long XT_HERE,XT_OVER,XT_CHARPLUS,XT_ALLOT,XT_PLACE,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x4,0x63,0x6F,0x6C,0x64
 .balign 4
XT_COLD:
 bal XT_DOLIST
 nop 
 .long XT_XTOF,XT_DICTZERO,XT_XTGTNAME,XT_DOLIT,0x18,XT_MINUS,XT_XTOF,XT_DICTZERO,XT_DOLIT,0x8,XT_PLUS,XT_STORE,XT_XTOF,XT_DUMMYTWO,XT_XTGTNAME,XT_DOTO,XT_HERE,XT_DICTZERO,XT_DOLIT,0x10000,XT_PLUS,XT_DUP,XT_DOTO,XT_MEMTOP,XT_CELLMINUS,XT_DUP,XT_USERP,XT_STORE,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_RPZERO,XT_STORE,XT_DOLIT,0x400,XT_MINUS,XT_DUP,XT_SPZERO,XT_STORE,XT_DOLIT,0x400,XT_MINUS,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_DOTO,XT_PAD,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_DOTO,XT_TIB,XT_DROP,XT_XTOF,XT_RXQ,XT_TICKEKEYQ,XT_STORE,XT_XTOF,XT_RXFETCH,XT_TICKEKEY,XT_STORE,XT_XTOF,XT_TXQ,XT_TICKEMITQ,XT_STORE,XT_XTOF,XT_TXSTORE,XT_TICKEMIT,XT_STORE,XT_XTOF,XT_PRINTABLE,XT_TICKKHAN,XT_STORE,XT_XTOF,XT_INTERPRET,XT_TICKINTERPRET,XT_STORE,XT_XTOF,XT_DOTERR,XT_TICKDOTERROR,XT_STORE,XT_XTOF,XT_COMMA,XT_TICKCOMPILECOMMA,XT_STORE,XT_XTOF,XT_NOOP,XT_TICKDOTPROMPT,XT_STORE,XT_XTOF,XT_FORTHMINUSWORDLIST,XT_XTGTNAME,XT_DOLIT,0x3,XT_CELLS,XT_MINUS,XT_DOTO,XT_FORTHMINUSWORDLIST,XT_XTOF,XT_COLD,XT_XTGTNAME,XT_FORTHMINUSWORDLIST,XT_STORE,XT_FORTHMINUSWORDLIST,XT_DOTO,XT_GETMINUSCURRENT,XT_GETMINUSCURRENT,XT_DOLIT,0x1,XT_NUMBERORDER,XT_TWOSTORE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_QUIT,XT_EXIT

 .balign 4
 .long 1b
1:
  .byte 0x6,0x64,0x75,0x6D,0x6D,0x79,0x32
 .balign 4
XT_DUMMYTWO:
 bal XT_DOVAR
 nop 
 .long 0x0

 .fill 54767 ,1,0
 .long 0xcacacaca
.set reorder
.set at
.set macro
