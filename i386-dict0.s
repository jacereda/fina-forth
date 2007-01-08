 .globl Forth_Entry 
 .globl Forth_UserP
 .globl Forth_Here
 .globl _Forth_Entry 
 .globl _Forth_UserP
 .globl _Forth_Here
 .data
 .p2align 2
 .long 0xfeedbabe, 0xdeadbeef
_Forth_Entry:
Forth_Entry:
 .long XT_COLD
_Forth_UserP:
Forth_UserP:
 .long XT_USERP
_Forth_Here:
Forth_Here:
 .long XT_HERE


 .p2align 2
 .long 0
1:
  .byte 0x5,0x64,0x69,0x63,0x74,0x30
 .p2align 2
XT_DICTZERO:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0xA,0x73,0x69,0x67,0x68,0x61,0x6E,0x64,0x6C,0x65,0x72
 .p2align 2
XT_SIGHANDLER:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0xA,0x74,0x68,0x72,0x6F,0x77,0x66,0x72,0x61,0x6D,0x65
 .p2align 2
XT_THROWFRAME:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0xFFFFFFFC

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x64,0x70,0x6C
 .p2align 2
XT_DPL:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0xFFFFFFF8

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x30
 .p2align 2
XT_SPZERO:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0xFFFFFFF4

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x30
 .p2align 2
XT_RPZERO:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0xFFFFFFF0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x74,0x61,0x73,0x6B,0x6E,0x61,0x6D,0x65
 .p2align 2
XT_TASKNAME:
 nop
 nop
 nop
 call XT_DOUSER
 .long 0xFFFFFFEC

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x70,0x61,0x72,0x73,0x65,0x64
 .p2align 2
XT_PARSED:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0,0x0

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x62,0x61,0x6C
 .p2align 2
XT_BAL:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x73,0x6F,0x75,0x72,0x63,0x65,0x76,0x61,0x72
 .p2align 2
XT_SOURCEVAR:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0,0x0

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x61,0x62,0x6F,0x72,0x74,0x22,0x6D,0x73,0x67
 .p2align 2
XT_ABORTQUOTEMSG:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0,0x0

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x68,0x6C,0x64
 .p2align 2
XT_HLD:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x75,0x73,0x65,0x72,0x70
 .p2align 2
XT_USERP:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x77,0x61,0x72,0x6E,0x69,0x6E,0x67,0x73
 .p2align 2
XT_WARNINGS:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0xFFFFFFFF

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x27,0x65,0x6B,0x65,0x79,0x3F
 .p2align 2
XT_TICKEKEYQ:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x27,0x65,0x6B,0x65,0x79
 .p2align 2
XT_TICKEKEY:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x27,0x65,0x6D,0x69,0x74,0x3F
 .p2align 2
XT_TICKEMITQ:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x27,0x65,0x6D,0x69,0x74
 .p2align 2
XT_TICKEMIT:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x27,0x2E,0x70,0x72,0x6F,0x6D,0x70,0x74
 .p2align 2
XT_TICKDOTPROMPT:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x27,0x2E,0x65,0x72,0x72,0x6F,0x72
 .p2align 2
XT_TICKDOTERROR:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0xA,0x27,0x69,0x6E,0x74,0x65,0x72,0x70,0x72,0x65,0x74
 .p2align 2
XT_TICKINTERPRET:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x27,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x2C
 .p2align 2
XT_TICKCOMPILECOMMA:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x27,0x6B,0x68,0x61,0x6E
 .p2align 2
XT_TICKKHAN:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x62,0x61,0x73,0x65
 .p2align 2
XT_BASE:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0xA

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x3E,0x69,0x6E
 .p2align 2
XT_GTIN:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x73,0x70,0x61,0x6E
 .p2align 2
XT_SPAN:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x74,0x61,0x74,0x65
 .p2align 2
XT_STATE:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x68,0x61,0x73,0x6E,0x61,0x6D,0x65,0x3F
 .p2align 2
XT_HASNAMEQ:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0xB,0x67,0x65,0x74,0x2D,0x63,0x75,0x72,0x72,0x65,0x6E,0x74
 .p2align 2
XT_GETMINUSCURRENT:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x6D,0x65,0x6D,0x74,0x6F,0x70
 .p2align 2
XT_MEMTOP:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xABADCAFE

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x6C,0x61,0x73,0x74,0x6E,0x61,0x6D,0x65
 .p2align 2
XT_LASTNAME:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x68,0x65,0x72,0x65
 .p2align 2
XT_HERE:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xABADCAFE

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x73,0x6F,0x75,0x72,0x63,0x65,0x2D,0x69,0x64
 .p2align 2
XT_SOURCEMINUSID:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xABADCAFE

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x70,0x61,0x64
 .p2align 2
XT_PAD:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xABADCAFE

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x74,0x69,0x62
 .p2align 2
XT_TIB:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xABADCAFE

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x66,0x6F,0x75,0x6E,0x64
 .p2align 2
XT_FOUND:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x6C,0x61,0x73,0x74,0x75,0x73,0x65,0x72
 .p2align 2
XT_LASTUSER:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0xFFFFFFE8,0x0,0x0

 .p2align 2
 .long 1b
1:
  .byte 0xE,0x66,0x6F,0x72,0x74,0x68,0x2D,0x77,0x6F,0x72,0x64,0x6C,0x69,0x73,0x74
 .p2align 2
XT_FORTHMINUSWORDLIST:
 nop
 nop
 nop
 call XT_DOVALUE
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x62,0x6C
 .p2align 2
XT_BL:
 nop
 nop
 nop
 call XT_DOCONST
 .long 0x20

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x75,0x6D,0x2B
 .p2align 2
_XT_UMPLUS:
 .long 0xdeadbeef,XT_UMPLUS


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x61,0x6E,0x64
 .p2align 2
_XT_AND:
 .long 0xdeadbeef,XT_AND


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x32,0x2A
 .p2align 2
_XT_TWOSTAR:
 .long 0xdeadbeef,XT_TWOSTAR


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x32,0x2F
 .p2align 2
_XT_TWOSLASH:
 .long 0xdeadbeef,XT_TWOSLASH


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x78,0x6F,0x72
 .p2align 2
_XT_XOR:
 .long 0xdeadbeef,XT_XOR


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x6F,0x72
 .p2align 2
_XT_OR:
 .long 0xdeadbeef,XT_OR


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x30,0x3C
 .p2align 2
_XT_ZEROLT:
 .long 0xdeadbeef,XT_ZEROLT


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x30,0x3D
 .p2align 2
_XT_ZEROEQUALS:
 .long 0xdeadbeef,XT_ZEROEQUALS


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x78,0x3F
 .p2align 2
_XT_RXQ:
 .long 0xdeadbeef,XT_RXQ


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x78,0x40
 .p2align 2
_XT_RXFETCH:
 .long 0xdeadbeef,XT_RXFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x74,0x78,0x3F
 .p2align 2
_XT_TXQ:
 .long 0xdeadbeef,XT_TXQ


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x74,0x78,0x21
 .p2align 2
_XT_TXSTORE:
 .long 0xdeadbeef,XT_TXSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x64,0x72,0x6F,0x70
 .p2align 2
_XT_DROP:
 .long 0xdeadbeef,XT_DROP


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x64,0x75,0x70
 .p2align 2
_XT_DUP:
 .long 0xdeadbeef,XT_DUP


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x6F,0x76,0x65,0x72
 .p2align 2
_XT_OVER:
 .long 0xdeadbeef,XT_OVER


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x73,0x77,0x61,0x70
 .p2align 2
_XT_SWAP:
 .long 0xdeadbeef,XT_SWAP


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x40
 .p2align 2
_XT_RPFETCH:
 .long 0xdeadbeef,XT_RPFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x70,0x21
 .p2align 2
_XT_RPSTORE:
 .long 0xdeadbeef,XT_RPSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x40
 .p2align 2
_XT_SPFETCH:
 .long 0xdeadbeef,XT_SPFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x73,0x70,0x21
 .p2align 2
_XT_SPSTORE:
 .long 0xdeadbeef,XT_SPSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x21
 .p2align 2
_XT_STORE:
 .long 0xdeadbeef,XT_STORE


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x40
 .p2align 2
_XT_FETCH:
 .long 0xdeadbeef,XT_FETCH


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x63,0x21
 .p2align 2
_XT_CSTORE:
 .long 0xdeadbeef,XT_CSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x63,0x40
 .p2align 2
_XT_CFETCH:
 .long 0xdeadbeef,XT_CFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x6D,0x6F,0x76,0x65
 .p2align 2
_XT_MOVE:
 .long 0xdeadbeef,XT_MOVE


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x61,0x6D,0x65,0x3F
 .p2align 2
_XT_SAMEQ:
 .long 0xdeadbeef,XT_SAMEQ


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x65,0x78,0x65,0x63,0x75,0x74,0x65
 .p2align 2
_XT_EXECUTE:
 .long 0xdeadbeef,XT_EXECUTE


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x65,0x6E,0x64,0x74,0x69,0x63,0x6B
 .p2align 2
_XT_ENDTICK:
 .long 0xdeadbeef,XT_ENDTICK


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x62,0x79,0x65
 .p2align 2
_XT_BYE:
 .long 0xdeadbeef,XT_BYE


 .p2align 2
 .long 1b
1:
  .byte 0x9,0x3F,0x64,0x6F,0x64,0x65,0x66,0x69,0x6E,0x65
 .p2align 2
_XT_QDODEFINE:
 .long 0xdeadbeef,XT_QDODEFINE


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x78,0x74,0x2C
 .p2align 2
_XT_XTCOMMA:
 .long 0xdeadbeef,XT_XTCOMMA


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x6D,0x73
 .p2align 2
_XT_MS:
 .long 0xdeadbeef,XT_MS


 .p2align 2
 .long 1b
1:
  .byte 0x9,0x74,0x69,0x6D,0x65,0x26,0x64,0x61,0x74,0x65
 .p2align 2
_XT_TIMEANDDATE:
 .long 0xdeadbeef,XT_TIMEANDDATE


 .p2align 2
 .long 1b
1:
  .byte 0x28,0x64,0x6F,0x63,0x72,0x65,0x61,0x74,0x65
 .p2align 2
_XT_DOCREATE:
 .long 0xdeadbeef,XT_DOCREATE


 .p2align 2
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x6C,0x69,0x74
 .p2align 2
_XT_DOLIT:
 .long 0xdeadbeef,XT_DOLIT


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x75,0x73,0x65,0x72
 .p2align 2
_XT_DOUSER:
 .long 0xdeadbeef,XT_DOUSER


 .p2align 2
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x76,0x61,0x72
 .p2align 2
_XT_DOVAR:
 .long 0xdeadbeef,XT_DOVAR


 .p2align 2
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x63,0x6F,0x6E,0x73,0x74
 .p2align 2
_XT_DOCONST:
 .long 0xdeadbeef,XT_DOCONST


 .p2align 2
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x76,0x61,0x6C,0x75,0x65
 .p2align 2
_XT_DOVALUE:
 .long 0xdeadbeef,XT_DOVALUE


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6C,0x69,0x73,0x74
 .p2align 2
_XT_DOLIST:
 .long 0xdeadbeef,XT_DOLIST


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6C,0x6F,0x6F,0x70
 .p2align 2
_XT_DOLOOP:
 .long 0xdeadbeef,XT_DOLOOP


 .p2align 2
 .long 1b
1:
  .byte 0x27,0x64,0x6F,0x2B,0x6C,0x6F,0x6F,0x70
 .p2align 2
_XT_DOPLUSLOOP:
 .long 0xdeadbeef,XT_DOPLUSLOOP


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x64,0x6F,0x6E,0x65,0x78,0x74
 .p2align 2
_XT_DONEXT:
 .long 0xdeadbeef,XT_DONEXT


 .p2align 2
 .long 1b
1:
  .byte 0x27,0x30,0x62,0x72,0x61,0x6E,0x63,0x68
 .p2align 2
_XT_ZEROBRANCH:
 .long 0xdeadbeef,XT_ZEROBRANCH


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x62,0x72,0x61,0x6E,0x63,0x68
 .p2align 2
_XT_BRANCH:
 .long 0xdeadbeef,XT_BRANCH


 .p2align 2
 .long 1b
1:
  .byte 0x24,0x65,0x78,0x69,0x74
 .p2align 2
_XT_EXIT:
 .long 0xdeadbeef,XT_EXIT


 .p2align 2
 .long 1b
1:
  .byte 0x21,0x69
 .p2align 2
_XT_I:
 .long 0xdeadbeef,XT_I


 .p2align 2
 .long 1b
1:
  .byte 0x22,0x3E,0x72
 .p2align 2
_XT_GTR:
 .long 0xdeadbeef,XT_GTR


 .p2align 2
 .long 1b
1:
  .byte 0x22,0x72,0x3E
 .p2align 2
_XT_RGT:
 .long 0xdeadbeef,XT_RGT


 .p2align 2
 .long 1b
1:
  .byte 0x22,0x72,0x40
 .p2align 2
_XT_RFETCH:
 .long 0xdeadbeef,XT_RFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x8,0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x65
 .p2align 2
_XT_ALLOCATE:
 .long 0xdeadbeef,XT_ALLOCATE


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x66,0x72,0x65,0x65
 .p2align 2
_XT_FREE:
 .long 0xdeadbeef,XT_FREE


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x73,0x69,0x7A,0x65
 .p2align 2
_XT_RESIZE:
 .long 0xdeadbeef,XT_RESIZE


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x6F,0x70,0x65,0x6E,0x66
 .p2align 2
_XT_OPENF:
 .long 0xdeadbeef,XT_OPENF


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x63,0x6C,0x6F,0x73,0x65,0x66
 .p2align 2
_XT_CLOSEF:
 .long 0xdeadbeef,XT_CLOSEF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x72,0x65,0x61,0x64,0x66
 .p2align 2
_XT_READF:
 .long 0xdeadbeef,XT_READF


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x77,0x72,0x69,0x74,0x65,0x66
 .p2align 2
_XT_WRITEF:
 .long 0xdeadbeef,XT_WRITEF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x6D,0x6D,0x61,0x70,0x66
 .p2align 2
_XT_MMAPF:
 .long 0xdeadbeef,XT_MMAPF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x69,0x7A,0x65,0x66
 .p2align 2
_XT_SIZEF:
 .long 0xdeadbeef,XT_SIZEF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x65,0x65,0x6B,0x66
 .p2align 2
_XT_SEEKF:
 .long 0xdeadbeef,XT_SEEKF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x74,0x65,0x6C,0x6C,0x66
 .p2align 2
_XT_TELLF:
 .long 0xdeadbeef,XT_TELLF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x6C,0x69,0x6E,0x65,0x66
 .p2align 2
_XT_LINEF:
 .long 0xdeadbeef,XT_LINEF


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x64,0x65,0x6C,0x65,0x74,0x65,0x66
 .p2align 2
_XT_DELETEF:
 .long 0xdeadbeef,XT_DELETEF


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x74,0x61,0x74,0x66
 .p2align 2
_XT_STATF:
 .long 0xdeadbeef,XT_STATF


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x72,0x65,0x6E,0x66
 .p2align 2
_XT_RENF:
 .long 0xdeadbeef,XT_RENF


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x74,0x72,0x75,0x6E,0x63,0x66
 .p2align 2
_XT_TRUNCF:
 .long 0xdeadbeef,XT_TRUNCF


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x6C,0x75,0x73,0x68,0x66
 .p2align 2
_XT_FLUSHF:
 .long 0xdeadbeef,XT_FLUSHF


 .p2align 2
 .long 1b
1:
  .byte 0x8,0x66,0x78,0x3E,0x66,0x6C,0x6F,0x61,0x74
 .p2align 2
_XT_FXGTFLOAT:
 .long 0xdeadbeef,XT_FXGTFLOAT


 .p2align 2
 .long 1b
1:
  .byte 0x8,0x66,0x6C,0x6F,0x61,0x74,0x3E,0x66,0x78
 .p2align 2
_XT_FLOATGTFX:
 .long 0xdeadbeef,XT_FLOATGTFX


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x70,0x72,0x65,0x70
 .p2align 2
_XT_FFPREP:
 .long 0xdeadbeef,XT_FFPREP


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x63,0x61,0x6C,0x6C
 .p2align 2
_XT_FFCALL:
 .long 0xdeadbeef,XT_FFCALL


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x66,0x76,0x6F,0x69,0x64
 .p2align 2
_XT_FFVOID:
 .long 0xdeadbeef,XT_FFVOID


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x66,0x66,0x69,0x6E,0x74
 .p2align 2
_XT_FFINT:
 .long 0xdeadbeef,XT_FFINT


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x66,0x66,0x66,0x6C,0x6F,0x61,0x74
 .p2align 2
_XT_FFFLOAT:
 .long 0xdeadbeef,XT_FFFLOAT


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x66,0x66,0x70,0x74,0x72
 .p2align 2
_XT_FFPTR:
 .long 0xdeadbeef,XT_FFPTR


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x64,0x6C,0x6F,0x70,0x65,0x6E
 .p2align 2
_XT_DLOPEN:
 .long 0xdeadbeef,XT_DLOPEN


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x64,0x6C,0x73,0x79,0x6D
 .p2align 2
_XT_DLSYM:
 .long 0xdeadbeef,XT_DLSYM


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x61,0x72,0x67,0x63
 .p2align 2
_XT_ARGC:
 .long 0xdeadbeef,XT_ARGC


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x61,0x72,0x67,0x76
 .p2align 2
_XT_ARGV:
 .long 0xdeadbeef,XT_ARGV


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x6E,0x6F,0x6F,0x70
 .p2align 2
_XT_NOOP:
 .long 0xdeadbeef,XT_NOOP


 .p2align 2
 .long 1b
1:
  .byte 0x8,0x40,0x65,0x78,0x65,0x63,0x75,0x74,0x65
 .p2align 2
XT_FETCHEXECUTE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FETCH,XT_EXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x65,0x6B,0x65,0x79,0x3F
 .p2align 2
XT_EKEYQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKEKEYQ,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x65,0x6B,0x65,0x79
 .p2align 2
XT_EKEY:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKEKEY,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x65,0x6D,0x69,0x74,0x3F
 .p2align 2
XT_EMITQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKEMITQ,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x65,0x6D,0x69,0x74
 .p2align 2
XT_EMIT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKEMIT,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x2E,0x70,0x72,0x6F,0x6D,0x70,0x74
 .p2align 2
XT_DOTPROMPT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKDOTPROMPT,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x63,0x72
 .p2align 2
XT_CR:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0xA,XT_EMIT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x73,0x70,0x61,0x63,0x65
 .p2align 2
XT_SPACE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x20,XT_EMIT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x73,0x70,0x61,0x63,0x65,0x73
 .p2align 2
XT_SPACES:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x0,XT_MAX,XT_DOLIT,0x0,XT_DOQDO,0x10,XT_SPACE,XT_DOLOOP,0xFFFFFFF8,XT_UNLOOP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x3F,0x64,0x75,0x70
 .p2align 2
_XT_QDUP:
 .long 0xdeadbeef,XT_QDUP


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6E,0x69,0x70
 .p2align 2
_XT_NIP:
 .long 0xdeadbeef,XT_NIP


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x72,0x6F,0x74
 .p2align 2
_XT_ROT:
 .long 0xdeadbeef,XT_ROT


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x32,0x64,0x72,0x6F,0x70
 .p2align 2
_XT_TWODROP:
 .long 0xdeadbeef,XT_TWODROP


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x32,0x64,0x75,0x70
 .p2align 2
_XT_TWODUP:
 .long 0xdeadbeef,XT_TWODUP


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x32,0x73,0x77,0x61,0x70
 .p2align 2
_XT_TWOSWAP:
 .long 0xdeadbeef,XT_TWOSWAP


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x32,0x6F,0x76,0x65,0x72
 .p2align 2
_XT_TWOOVER:
 .long 0xdeadbeef,XT_TWOOVER


 .p2align 2
 .long 1b
1:
  .byte 0x26,0x75,0x6E,0x6C,0x6F,0x6F,0x70
 .p2align 2
_XT_UNLOOP:
 .long 0xdeadbeef,XT_UNLOOP


 .p2align 2
 .long 1b
1:
  .byte 0x25,0x72,0x64,0x72,0x6F,0x70
 .p2align 2
_XT_RDROP:
 .long 0xdeadbeef,XT_RDROP


 .p2align 2
 .long 1b
1:
  .byte 0x23,0x40,0x72,0x2B
 .p2align 2
XT_FETCHRPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RGT,XT_RFETCH,XT_FETCH,XT_RGT,XT_CELLPLUS,XT_GTR,XT_SWAP,XT_GTR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x23,0x21,0x72,0x2B
 .p2align 2
XT_STORERPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RGT,XT_SWAP,XT_RFETCH,XT_STORE,XT_RGT,XT_CELLPLUS,XT_GTR,XT_GTR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x64,0x65,0x70,0x74,0x68
 .p2align 2
XT_DEPTH:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SPFETCH,XT_NEGATE,XT_SPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,0x2,XT_ARSHIFT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x72,0x64,0x65,0x70,0x74,0x68
 .p2align 2
XT_RDEPTH:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RPFETCH,XT_NEGATE,XT_RPZERO,XT_FETCH,XT_PLUS,XT_DOLIT,0x2,XT_ARSHIFT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x70,0x69,0x63,0x6B
 .p2align 2
_XT_PICK:
 .long 0xdeadbeef,XT_PICK


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x72,0x70,0x69,0x63,0x6B
 .p2align 2
XT_RPICK:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RDEPTH,XT_DUP,XT_DOLIT,0x2,XT_LT,XT_DOQTHROW,0xFFFFFFFC,XT_DOLIT,0x2,XT_MINUS,XT_OVER,XT_ULT,XT_DOQTHROW,0xFFFFFFFC,XT_ONEPLUS,XT_CELLS,XT_RPFETCH,XT_PLUS,XT_FETCH,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x2E,0x73
 .p2align 2
XT_DOTS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DEPTH,XT_DOLIT,0x0,XT_LTNUMBER,XT_DOLIT,0x3E,XT_HOLD,XT_NUMBERS,XT_DOLIT,0x3C,XT_HOLD,XT_NUMBERGT,XT_TYPE,XT_SPACE,XT_DEPTH,XT_DUP,XT_DOLIT,0x0,XT_DOQDO,0x1C,XT_DUP,XT_PICK,XT_DOT,XT_ONEMINUS,XT_DOLOOP,0xFFFFFFEC,XT_UNLOOP,XT_DROP,XT_CR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x2E,0x72,0x73
 .p2align 2
XT_DOTRS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RDEPTH,XT_DOT,XT_DOLIT,0x4,XT_SPACES,XT_RDEPTH,XT_DOLIT,0x0,XT_DOQDO,0x18,XT_I,XT_RPICK,XT_DOT,XT_DOLOOP,0xFFFFFFF0,XT_UNLOOP,XT_CR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x74,0x68,0x72,0x6F,0x77
 .p2align 2
XT_THROW:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_QDUP,XT_ZEROBRANCH,0x34,XT_THROWFRAME,XT_FETCH,XT_RPSTORE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RGT,XT_SWAP,XT_GTR,XT_SPSTORE,XT_DROP,XT_RGT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x28,0x64,0x6F,0x3F,0x74,0x68,0x72,0x6F,0x77
 .p2align 2
XT_DOQTHROW:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_ZEROLTGT,XT_FETCHRPLUS,XT_AND,XT_THROW,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x61,0x74,0x63,0x68
 .p2align 2
XT_CATCH:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SPFETCH,XT_GTR,XT_THROWFRAME,XT_FETCH,XT_GTR,XT_RPFETCH,XT_THROWFRAME,XT_STORE,XT_EXECUTE,XT_RGT,XT_THROWFRAME,XT_STORE,XT_RDROP,XT_DOLIT,0x0,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2B
 .p2align 2
_XT_PLUS:
 .long 0xdeadbeef,XT_PLUS


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x31,0x2B
 .p2align 2
_XT_ONEPLUS:
 .long 0xdeadbeef,XT_ONEPLUS


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x31,0x2D
 .p2align 2
_XT_ONEMINUS:
 .long 0xdeadbeef,XT_ONEMINUS


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x69,0x6E,0x76,0x65,0x72,0x74
 .p2align 2
_XT_INVERT:
 .long 0xdeadbeef,XT_INVERT


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x6E,0x65,0x67,0x61,0x74,0x65
 .p2align 2
_XT_NEGATE:
 .long 0xdeadbeef,XT_NEGATE


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2D
 .p2align 2
_XT_MINUS:
 .long 0xdeadbeef,XT_MINUS


 .p2align 2
 .long 1b
1:
  .byte 0x21,0x6A
 .p2align 2
_XT_J:
 .long 0xdeadbeef,XT_J


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x30,0x3C,0x3E
 .p2align 2
_XT_ZEROLTGT:
 .long 0xdeadbeef,XT_ZEROLTGT


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x3C
 .p2align 2
_XT_LT:
 .long 0xdeadbeef,XT_LT


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x75,0x3C
 .p2align 2
_XT_ULT:
 .long 0xdeadbeef,XT_ULT


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x3E
 .p2align 2
_XT_GT:
 .long 0xdeadbeef,XT_GT


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x75,0x3E
 .p2align 2
XT_UGT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SWAP,XT_ULT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x75,0x3E,0x3D
 .p2align 2
XT_UGTEQUALS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_ULT,XT_ZEROEQUALS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x3D
 .p2align 2
_XT_EQUALS:
 .long 0xdeadbeef,XT_EQUALS


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x3C,0x3E
 .p2align 2
_XT_LTGT:
 .long 0xdeadbeef,XT_LTGT


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x2B
 .p2align 2
_XT_CELLPLUS:
 .long 0xdeadbeef,XT_CELLPLUS


 .p2align 2
 .long 1b
1:
  .byte 0x24,0x64,0x6F,0x64,0x6F
 .p2align 2
_XT_DODO:
 .long 0xdeadbeef,XT_DODO


 .p2align 2
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x66,0x6F,0x72
 .p2align 2
XT_DOFOR:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RGT,XT_SWAP,XT_DUP,XT_GTR,XT_GTR,XT_GTR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x25,0x64,0x6F,0x3F,0x64,0x6F
 .p2align 2
XT_DOQDO:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TWODUP,XT_EQUALS,XT_ZEROBRANCH,0x24,XT_TWODROP,XT_RGT,XT_DUP,XT_FETCH,XT_PLUS,XT_CELLPLUS,XT_GTR,XT_EXIT,XT_RGT,XT_ROT,XT_GTR,XT_SWAP,XT_GTR,XT_CELLPLUS,XT_GTR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x61,0x62,0x73
 .p2align 2
_XT_ABS:
 .long 0xdeadbeef,XT_ABS


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x6C,0x73,0x68,0x69,0x66,0x74
 .p2align 2
_XT_LSHIFT:
 .long 0xdeadbeef,XT_LSHIFT


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x61,0x72,0x73,0x68,0x69,0x66,0x74
 .p2align 2
XT_ARSHIFT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x0,XT_DOQDO,0x10,XT_TWOSLASH,XT_DOLOOP,0xFFFFFFF8,XT_UNLOOP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x72,0x73,0x68,0x69,0x66,0x74
 .p2align 2
_XT_RSHIFT:
 .long 0xdeadbeef,XT_RSHIFT


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6D,0x61,0x78
 .p2align 2
_XT_MAX:
 .long 0xdeadbeef,XT_MAX


 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6D,0x69,0x6E
 .p2align 2
_XT_MIN:
 .long 0xdeadbeef,XT_MIN


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x75,0x6D,0x69,0x6E
 .p2align 2
XT_UMIN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TWODUP,XT_UGT,XT_ZEROBRANCH,0x8,XT_SWAP,XT_DROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x75,0x6D,0x2A
 .p2align 2
_XT_UMSTAR:
 .long 0xdeadbeef,XT_UMSTAR


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x64,0x6E,0x65,0x67,0x61,0x74,0x65
 .p2align 2
_XT_DNEGATE:
 .long 0xdeadbeef,XT_DNEGATE


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x6D,0x2A
 .p2align 2
_XT_MSTAR:
 .long 0xdeadbeef,XT_MSTAR


 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2A
 .p2align 2
_XT_STAR:
 .long 0xdeadbeef,XT_STAR


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x75,0x6D,0x2F,0x6D,0x6F,0x64
 .p2align 2
_XT_UMSLASHMOD:
 .long 0xdeadbeef,XT_UMSLASHMOD


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x6D,0x2F,0x6D,0x6F,0x64
 .p2align 2
XT_FMSLASHMOD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_RFETCH,XT_TWODUP,XT_XOR,XT_GTR,XT_GTR,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DNEGATE,XT_RFETCH,XT_ABS,XT_UMSLASHMOD,XT_RGT,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_SWAP,XT_NEGATE,XT_SWAP,XT_RGT,XT_ZEROLT,XT_ZEROBRANCH,0x48,XT_NEGATE,XT_OVER,XT_ZEROBRANCH,0x18,XT_RFETCH,XT_ROT,XT_MINUS,XT_SWAP,XT_ONEMINUS,XT_RDROP,XT_DOLIT,0x0,XT_OVER,XT_LT,XT_DOQTHROW,0xFFFFFFF5,XT_EXIT,XT_RDROP,XT_DUP,XT_ZEROLT,XT_DOQTHROW,0xFFFFFFF5,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x73,0x3E,0x64
 .p2align 2
_XT_SGTD:
 .long 0xdeadbeef,XT_SGTD


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x2F,0x6D,0x6F,0x64
 .p2align 2
XT_SLASHMOD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_SGTD,XT_RGT,XT_FMSLASHMOD,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2F
 .p2align 2
XT_SLASH:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SLASHMOD,XT_NIP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6D,0x6F,0x64
 .p2align 2
XT_MOD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SLASHMOD,XT_DROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x77,0x69,0x74,0x68,0x69,0x6E
 .p2align 2
_XT_WITHIN:
 .long 0xdeadbeef,XT_WITHIN


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x64,0x2B
 .p2align 2
_XT_DPLUS:
 .long 0xdeadbeef,XT_DPLUS


 .p2align 2
 .long 1b
1:
  .byte 0x6,0x75,0x6E,0x64,0x65,0x72,0x2B
 .p2align 2
XT_UNDERPLUS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_ROT,XT_PLUS,XT_SWAP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x68,0x61,0x72,0x2B
 .p2align 2
_XT_CHARPLUS:
 .long 0xdeadbeef,XT_CHARPLUS


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x3F,0x64,0x69,0x63,0x74
 .p2align 2
XT_QDICT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_PAD,XT_UGTEQUALS,XT_DOQTHROW,0xFFFFFFF8,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x73
 .p2align 2
_XT_CELLS:
 .long 0xdeadbeef,XT_CELLS


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x65,0x6C,0x6C,0x2D
 .p2align 2
_XT_CELLMINUS:
 .long 0xdeadbeef,XT_CELLMINUS


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x32,0x21
 .p2align 2
_XT_TWOSTORE:
 .long 0xdeadbeef,XT_TWOSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x2,0x32,0x40
 .p2align 2
_XT_TWOFETCH:
 .long 0xdeadbeef,XT_TWOFETCH


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x61,0x6C,0x69,0x67,0x6E,0x65,0x64
 .p2align 2
_XT_ALIGNED:
 .long 0xdeadbeef,XT_ALIGNED


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x61,0x6C,0x69,0x67,0x6E
 .p2align 2
XT_ALIGN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_ALIGNED,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x2D,0x72,0x6F,0x74
 .p2align 2
XT_MINUSROT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_ROT,XT_ROT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x66,0x69,0x6C,0x6C
 .p2align 2
_XT_FILL:
 .long 0xdeadbeef,XT_FILL


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x63,0x6F,0x75,0x6E,0x74
 .p2align 2
_XT_COUNT:
 .long 0xdeadbeef,XT_COUNT


 .p2align 2
 .long 1b
1:
  .byte 0x9,0x6E,0x61,0x6D,0x65,0x63,0x6F,0x75,0x6E,0x74
 .p2align 2
XT_NAMECOUNT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_COUNT,XT_DOLIT,0x1F,XT_AND,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x70,0x6C,0x61,0x63,0x65
 .p2align 2
XT_PLACE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_OVER,XT_DOLIT,0xFF,XT_UGTEQUALS,XT_DOQTHROW,0xFFFFFFEE,XT_GTR,XT_RFETCH,XT_CSTORE,XT_RFETCH,XT_ONEPLUS,XT_RGT,XT_CFETCH,XT_MOVE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x2B,0x21
 .p2align 2
_XT_PLUSSTORE:
 .long 0xdeadbeef,XT_PLUSSTORE


 .p2align 2
 .long 1b
1:
  .byte 0x5,0x61,0x6C,0x6C,0x6F,0x74
 .p2align 2
XT_ALLOT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_PLUS,XT_DOTO,XT_HERE,XT_QDICT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2C
 .p2align 2
XT_COMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_STORE,XT_DOLIT,0x4,XT_ALLOT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6F,0x66,0x66
 .p2align 2
XT_OFF:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x0,XT_SWAP,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x6F,0x6E
 .p2align 2
XT_ON:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0xFFFFFFFF,XT_SWAP,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x73,0x6F,0x75,0x72,0x63,0x65
 .p2align 2
XT_SOURCE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SOURCEVAR,XT_TWOFETCH,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x2F,0x73,0x74,0x72,0x69,0x6E,0x67
 .p2align 2
XT_SLASHSTRING:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_RFETCH,XT_UNDERPLUS,XT_RGT,XT_MINUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x75,0x6E,0x70,0x61,0x72,0x73,0x65,0x64
 .p2align 2
XT_UNPARSED:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SOURCE,XT_GTIN,XT_FETCH,XT_SLASHSTRING,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x75,0x6E,0x70,0x61,0x72,0x73,0x65,0x64,0x21
 .p2align 2
XT_UNPARSEDSTORE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SOURCE,XT_MINUSROT,XT_MINUS,XT_UMIN,XT_GTIN,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x73,0x63,0x61,0x6E
 .p2align 2
XT_SCAN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,0x30,XT_OVER,XT_CFETCH,XT_RFETCH,XT_XOR,XT_ZEROBRANCH,0x18,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFCC,XT_RDROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x73,0x6B,0x69,0x70
 .p2align 2
XT_SKIP:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_DUP,XT_ZEROBRANCH,0x30,XT_OVER,XT_CFETCH,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,0x18,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFCC,XT_RDROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x70,0x61,0x72,0x73,0x65
 .p2align 2
XT_PARSE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_UNPARSED,XT_OVER,XT_SWAP,XT_RGT,XT_SCAN,XT_DROP,XT_OVER,XT_MINUS,XT_TWODUP,XT_PLUS,XT_ONEPLUS,XT_UNPARSEDSTORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x73,0x6B,0x69,0x70,0x70,0x61,0x72,0x73,0x65
 .p2align 2
XT_SKIPPARSE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_UNPARSED,XT_RFETCH,XT_SKIP,XT_DROP,XT_UNPARSEDSTORE,XT_RGT,XT_PARSE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0xA,0x70,0x61,0x72,0x73,0x65,0x2D,0x77,0x6F,0x72,0x64
 .p2align 2
XT_PARSEMINUSWORD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_BL,XT_SKIPPARSE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x23,0x6F,0x72,0x64,0x65,0x72
 .p2align 2
XT_NUMBERORDER:
 nop
 nop
 nop
 call XT_DOCREATE

 .long XT_NOOP
 .long 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x64,0x69,0x63,0x74,0x3F
 .p2align 2
XT_DICTQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DICTZERO,XT_MEMTOP,XT_WITHIN,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x6E,0x61,0x6D,0x65,0x3E,0x78,0x74
 .p2align 2
XT_NAMEGTXT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_NAMECOUNT,XT_PLUS,XT_ALIGNED,XT_DUP,XT_FETCH,XT_DOLIT,0xDEADBEEF,XT_EQUALS,XT_ZEROBRANCH,0xC,XT_CELLPLUS,XT_FETCH,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x70,0x72,0x69,0x6D,0x78,0x74,0x3F
 .p2align 2
XT_PRIMXTQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_XTOF,XT_NOOP,XT_XTOF,XT_ARGV,XT_CELLPLUS,XT_WITHIN,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x6C,0x69,0x6E,0x6B,0x3F
 .p2align 2
XT_LINKQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DUP,XT_ZEROEQUALS,XT_SWAP,XT_DICTQ,XT_OR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x78,0x74,0x3E,0x6E,0x61,0x6D,0x65
 .p2align 2
XT_XTGTNAME:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DUP,XT_XTOF,XT_DICTZERO,XT_EQUALS,XT_ZEROBRANCH,0x14,XT_DOLIT,0x8,XT_MINUS,XT_EXIT,XT_GTR,XT_RFETCH,XT_PRIMXTQ,XT_ZEROBRANCH,0x38,XT_XTOF,XT_COLD,XT_XTGTNAME,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_ZEROBRANCH,0xFFFFFFE4,XT_BRANCH,0x60,XT_RFETCH,XT_QDODEFINE,XT_NIP,XT_ZEROEQUALS,XT_ZEROBRANCH,0x14,XT_RDROP,XT_DOLIT,0x0,XT_EXIT,XT_RFETCH,XT_CELLMINUS,XT_DUP,XT_NAMEGTXT,XT_RFETCH,XT_EQUALS,XT_OVER,XT_CELLMINUS,XT_FETCH,XT_LINKQ,XT_AND,XT_ZEROBRANCH,0xFFFFFFD4,XT_RDROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x62,0x6F,0x75,0x6E,0x64,0x73
 .p2align 2
XT_BOUNDS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_OVER,XT_PLUS,XT_SWAP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0xA,0x66,0x6F,0x72,0x77,0x6F,0x72,0x64,0x73,0x69,0x6E
 .p2align 2
XT_FORWORDSIN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x0,XT_DOTO,XT_FOUND,XT_GTR,XT_CELLPLUS,XT_CELLMINUS,XT_FETCH,XT_DUP,XT_FOUND,XT_ZEROEQUALS,XT_AND,XT_ZEROBRANCH,0x14,XT_RFETCH,XT_EXECUTE,XT_BRANCH,0xFFFFFFD4,XT_DROP,XT_RDROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x66,0x6F,0x72,0x77,0x6F,0x72,0x64,0x73
 .p2align 2
XT_FORWORDS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_NUMBERORDER,XT_CELLPLUS,XT_NUMBERORDER,XT_FETCH,XT_CELLS,XT_BOUNDS,XT_DOQDO,0x3C,XT_I,XT_FETCH,XT_J,XT_FORWORDSIN,XT_FOUND,XT_ZEROBRANCH,0xC,XT_BRANCH,0x18,XT_DOLIT,0x1,XT_CELLS,XT_DOPLUSLOOP,0xFFFFFFCC,XT_UNLOOP,XT_RDROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x6D,0x61,0x74,0x63,0x68,0x3F
 .p2align 2
XT_MATCHQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DUP,XT_NAMECOUNT,XT_PARSED,XT_FETCH,XT_EQUALS,XT_ZEROBRANCH,0x30,XT_PARSED,XT_TWOFETCH,XT_SAMEQ,XT_ZEROEQUALS,XT_ZEROBRANCH,0x10,XT_DUP,XT_DOTO,XT_FOUND,XT_BRANCH,0x8,XT_DROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x6E,0x66,0x61,0x69,0x6E
 .p2align 2
XT_NFAIN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_GTR,XT_PARSED,XT_TWOSTORE,XT_RGT,XT_XTOF,XT_MATCHQ,XT_FORWORDSIN,XT_FOUND,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x6E,0x66,0x61
 .p2align 2
XT_NFA:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_PARSED,XT_TWOSTORE,XT_XTOF,XT_MATCHQ,XT_FORWORDS,XT_FOUND,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x3,0x66,0x78,0x74
 .p2align 2
XT_FXT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FOUND,XT_NAMEGTXT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x66,0x69,0x6D,0x6D,0x65,0x64
 .p2align 2
XT_FIMMED:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FOUND,XT_CFETCH,XT_DOLIT,0x40,XT_AND,XT_ZEROEQUALS,XT_TWOSTAR,XT_ONEPLUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x2F,0x66,0x63,0x6F,0x6D,0x70,0x6F
 .p2align 2
XT_SLASHFCOMPO:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FOUND,XT_CFETCH,XT_DOLIT,0x20,XT_AND,XT_ZEROEQUALS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x27
 .p2align 2
XT_TICK:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_PARSEMINUSWORD,XT_NFA,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF3,XT_FXT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x74,0x79,0x70,0x65
 .p2align 2
XT_TYPE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_BOUNDS,XT_DOQDO,0x18,XT_I,XT_CFETCH,XT_EMIT,XT_DOLOOP,0xFFFFFFF0,XT_UNLOOP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x72,0x65,0x64,0x65,0x66,0x73,0x74,0x72
 .p2align 2
XT_REDEFSTR:
 nop
 nop
 nop
 call XT_DOVAR
  .byte 0xA,0x72,0x65,0x64,0x65,0x66,0x69,0x6E,0x65,0x64,0x20


 .p2align 2
 .long 1b
1:
  .byte 0x7,0x28,0x68,0x65,0x61,0x64,0x2C,0x29
 .p2align 2
XT_LPARENHEADCOMMARPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_QDICT,XT_DUP,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF0,XT_DUP,XT_DOLIT,0x1F,XT_GT,XT_DOQTHROW,0xFFFFFFED,XT_TWODUP,XT_GETMINUSCURRENT,XT_NFAIN,XT_ZEROBRANCH,0x2C,XT_WARNINGS,XT_FETCH,XT_ZEROBRANCH,0x1C,XT_REDEFSTR,XT_COUNT,XT_TYPE,XT_TWODUP,XT_TYPE,XT_SPACE,XT_ALIGN,XT_GETMINUSCURRENT,XT_FETCH,XT_COMMA,XT_HERE,XT_DOTO,XT_LASTNAME,XT_SCOMMA,XT_ALIGN,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x68,0x65,0x61,0x64,0x2C
 .p2align 2
XT_HEADCOMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_PARSEMINUSWORD,XT_LPARENHEADCOMMARPAREN,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x68,0x6F,0x6C,0x64
 .p2align 2
XT_HOLD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0xFFFFFFFF,XT_HLD,XT_PLUSSTORE,XT_HLD,XT_FETCH,XT_CSTORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x3C,0x23
 .p2align 2
XT_LTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_DOLIT,0x100,XT_PLUS,XT_HLD,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x23
 .p2align 2
XT_NUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0x0,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_GTR,XT_BASE,XT_FETCH,XT_UMSLASHMOD,XT_SWAP,XT_DOLIT,0x9,XT_OVER,XT_LT,XT_DOLIT,0x7,XT_AND,XT_PLUS,XT_DOLIT,0x30,XT_PLUS,XT_HOLD,XT_RGT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x23,0x73
 .p2align 2
XT_NUMBERS:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_NUMBER,XT_TWODUP,XT_OR,XT_ZEROEQUALS,XT_ZEROBRANCH,0xFFFFFFEC,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x23,0x3E
 .p2align 2
XT_NUMBERGT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TWODROP,XT_HLD,XT_FETCH,XT_HERE,XT_DOLIT,0x100,XT_PLUS,XT_OVER,XT_MINUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x73,0x69,0x67,0x6E
 .p2align 2
XT_SIGN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_DOLIT,0x2D,XT_HOLD,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x28,0x64,0x2E,0x29
 .p2align 2
XT_LPARENDDOTRPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SWAP,XT_OVER,XT_DUP,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DNEGATE,XT_LTNUMBER,XT_NUMBERS,XT_ROT,XT_SIGN,XT_NUMBERGT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x64,0x2E
 .p2align 2
XT_DDOT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_LPARENDDOTRPAREN,XT_TYPE,XT_SPACE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x2E
 .p2align 2
XT_DOT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SGTD,XT_DDOT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x61,0x5B
 .p2align 2
XT_LBRACKET:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_STATE,XT_OFF,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x5D
 .p2align 2
XT_RBRACKET:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_STATE,XT_ON,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x70,0x72,0x69,0x6E,0x74,0x61,0x62,0x6C,0x65
 .p2align 2
XT_PRINTABLE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_OVER,XT_SPAN,XT_FETCH,XT_UGTEQUALS,XT_AND,XT_DUP,XT_GTR,XT_ZEROBRANCH,0x30,XT_OVER,XT_SPAN,XT_FETCH,XT_PLUS,XT_RFETCH,XT_SWAP,XT_CSTORE,XT_DOLIT,0x1,XT_SPAN,XT_PLUSSTORE,XT_RGT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x61,0x63,0x63,0x65,0x70,0x74
 .p2align 2
XT_ACCEPT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TWODUP,XT_BL,XT_FILL,XT_SPAN,XT_OFF,XT_EKEY,XT_TICKKHAN,XT_FETCHEXECUTE,XT_DOLIT,0xA,XT_EQUALS,XT_ZEROBRANCH,0xFFFFFFE4,XT_TWODROP,XT_DOLIT,0xFFFFFFFF,XT_SPAN,XT_PLUSSTORE,XT_SPAN,XT_FETCH,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x66,0x69,0x6C,0x6C
 .p2align 2
XT_REFILL:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SOURCEMINUSID,XT_ZEROBRANCH,0x10,XT_DOLIT,0x0,XT_EXIT,XT_TIB,XT_DUP,XT_DOLIT,0x100,XT_ACCEPT,XT_SOURCEVAR,XT_TWOSTORE,XT_GTIN,XT_OFF,XT_DOLIT,0xFFFFFFFF,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x2C
 .p2align 2
XT_COMPILECOMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICKCOMPILECOMMA,XT_FETCHEXECUTE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x28,0x63,0x6F,0x6D,0x70,0x69,0x6C,0x65,0x29
 .p2align 2
XT_LPARENCOMPILERPAREN:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FETCHRPLUS,XT_COMPILECOMMA,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x24,0x78,0x74,0x6F,0x66
 .p2align 2
XT_XTOF:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FETCHRPLUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x74,0x6F,0x75,0x70,0x70,0x65,0x72
 .p2align 2
XT_TOUPPER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DUP,XT_DOLIT,0x61,XT_DOLIT,0x7B,XT_WITHIN,XT_DOLIT,0x20,XT_AND,XT_INVERT,XT_AND,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x64,0x69,0x67,0x69,0x74
 .p2align 2
XT_DIGIT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TOUPPER,XT_DUP,XT_DOLIT,0x3A,XT_DOLIT,0x41,XT_WITHIN,XT_DOLIT,0x80,XT_AND,XT_PLUS,XT_DUP,XT_DOLIT,0x41,XT_UGTEQUALS,XT_DOLIT,0x7,XT_AND,XT_MINUS,XT_DOLIT,0x30,XT_MINUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x64,0x69,0x67,0x69,0x74,0x3F
 .p2align 2
XT_DIGITQ:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DIGIT,XT_BASE,XT_FETCH,XT_ULT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x61,0x63,0x63,0x75,0x6D
 .p2align 2
XT_ACCUM:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_SWAP,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DROP,XT_ROT,XT_BASE,XT_FETCH,XT_UMSTAR,XT_DPLUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x3E,0x6E,0x75,0x6D,0x62,0x65,0x72
 .p2align 2
XT_GTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_BASE,XT_FETCH,XT_GTR,XT_OVER,XT_CFETCH,XT_DOLIT,0x23,XT_EQUALS,XT_ZEROBRANCH,0x34,XT_TWOSWAP,XT_DROP,XT_BASE,XT_STORE,XT_DOLIT,0x0,XT_DOLIT,0x0,XT_TWOSWAP,XT_DOLIT,0x1,XT_SLASHSTRING,XT_OVER,XT_CFETCH,XT_DIGITQ,XT_OVER,XT_AND,XT_ZEROBRANCH,0x38,XT_GTR,XT_GTR,XT_RFETCH,XT_CFETCH,XT_DIGIT,XT_ACCUM,XT_RGT,XT_RGT,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFF68,XT_RGT,XT_BASE,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x73,0x3E,0x75,0x6E,0x75,0x6D,0x62,0x65,0x72
 .p2align 2
XT_SGTUNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DOLIT,0xFFFFFFFF,XT_DPL,XT_STORE,XT_DOLIT,0x0,XT_DOLIT,0x0,XT_TWOSWAP,XT_GTNUMBER,XT_DUP,XT_ZEROBRANCH,0x44,XT_OVER,XT_CFETCH,XT_DOLIT,0x2E,XT_LTGT,XT_DOQTHROW,0xFFFFFFF3,XT_DUP,XT_ONEMINUS,XT_DPL,XT_STORE,XT_DOLIT,0x1,XT_SLASHSTRING,XT_BRANCH,0xFFFFFFB4,XT_TWODROP,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x8,XT_DROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x73,0x3E,0x6E,0x75,0x6D,0x62,0x65,0x72
 .p2align 2
XT_SGTNUMBER:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_OVER,XT_CFETCH,XT_DOLIT,0x2D,XT_EQUALS,XT_GTR,XT_RFETCH,XT_NEGATE,XT_SLASHSTRING,XT_SGTUNUMBER,XT_RGT,XT_ZEROBRANCH,0x28,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_NEGATE,XT_BRANCH,0x8,XT_DNEGATE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x67,0x6C,0x69,0x74,0x65,0x72,0x61,0x6C
 .p2align 2
XT_LITERAL:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_LPARENCOMPILERPAREN,XT_DOLIT,XT_COMMA,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x64,0x6F,0x32,0x6C,0x69,0x74
 .p2align 2
XT_DOTWOLIT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_FETCHRPLUS,XT_FETCHRPLUS,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x68,0x32,0x6C,0x69,0x74,0x65,0x72,0x61,0x6C
 .p2align 2
XT_TWOLITERAL:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_LPARENCOMPILERPAREN,XT_DOTWOLIT,XT_SWAP,XT_COMMA,XT_COMMA,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x9,0x69,0x6E,0x74,0x65,0x72,0x70,0x72,0x65,0x74
 .p2align 2
XT_INTERPRET:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_DEPTH,XT_ZEROLT,XT_DOQTHROW,0xFFFFFFFC,XT_PARSEMINUSWORD,XT_DUP,XT_ZEROBRANCH,0xBC,XT_NFA,XT_ZEROBRANCH,0x68,XT_STATE,XT_FETCH,XT_SLASHFCOMPO,XT_OR,XT_ZEROEQUALS,XT_DOQTHROW,0xFFFFFFF2,XT_FXT,XT_STATE,XT_FETCH,XT_ZEROBRANCH,0x2C,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_COMPILECOMMA,XT_BRANCH,0x8,XT_EXECUTE,XT_BRANCH,0x8,XT_EXECUTE,XT_BRANCH,0x44,XT_PARSED,XT_TWOFETCH,XT_SGTNUMBER,XT_STATE,XT_FETCH,XT_ZEROBRANCH,0x28,XT_DPL,XT_FETCH,XT_ZEROLT,XT_ZEROBRANCH,0x10,XT_LITERAL,XT_BRANCH,0x8,XT_TWOLITERAL,XT_BRANCH,0xFFFFFF2C,XT_TWODROP,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x5,0x65,0x78,0x73,0x74,0x72
 .p2align 2
XT_EXSTR:
 nop
 nop
 nop
 call XT_DOVAR
  .byte 0xD,0x20,0x65,0x78,0x63,0x65,0x70,0x74,0x69,0x6F,0x6E,0x20,0x23,0x20


 .p2align 2
 .long 1b
1:
  .byte 0x4,0x2E,0x65,0x72,0x72
 .p2align 2
XT_DOTERR:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_PARSED,XT_TWOFETCH,XT_TYPE,XT_EXSTR,XT_COUNT,XT_TYPE,XT_DOT,XT_CR,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x71,0x75,0x69,0x74
 .p2align 2
XT_QUIT:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_RPZERO,XT_FETCH,XT_RPSTORE,XT_DOLIT,0x0,XT_DOTO,XT_SOURCEMINUSID,XT_BAL,XT_OFF,XT_LBRACKET,XT_REFILL,XT_DROP,XT_TICKINTERPRET,XT_FETCH,XT_CATCH,XT_QDUP,XT_ZEROEQUALS,XT_ZEROBRANCH,0x24,XT_STATE,XT_FETCH,XT_ZEROEQUALS,XT_ZEROBRANCH,0x8,XT_DOTPROMPT,XT_BRANCH,0xFFFFFFC0,XT_TICKDOTERROR,XT_FETCHEXECUTE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_BRANCH,0xFFFFFF7C,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x7,0x3A,0x6E,0x6F,0x6E,0x61,0x6D,0x65
 .p2align 2
XT_COLONNONAME:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_BAL,XT_FETCH,XT_DOQTHROW,0xFFFFFFE3,XT_HASNAMEQ,XT_OFF,XT_DOLIT,0x1,XT_BAL,XT_STORE,XT_RBRACKET,XT_XTOF,XT_DOLIST,XT_XTCOMMA,XT_DUP,XT_DOLIT,0xFFFFFFFF,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x1,0x3A
 .p2align 2
XT_COLON:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HEADCOMMA,XT_COLONNONAME,XT_ROT,XT_DROP,XT_HASNAMEQ,XT_ON,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x64,0x75,0x6D,0x6D,0x79,0x31
 .p2align 2
XT_DUMMYONE:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .p2align 2
 .long 1b
1:
  .byte 0x8,0x6C,0x69,0x6E,0x6B,0x6C,0x61,0x73,0x74
 .p2align 2
XT_LINKLAST:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_LASTNAME,XT_GETMINUSCURRENT,XT_STORE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x72,0x65,0x76,0x65,0x61,0x6C
 .p2align 2
XT_REVEAL:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HASNAMEQ,XT_FETCH,XT_ZEROBRANCH,0x8,XT_LINKLAST,XT_HASNAMEQ,XT_OFF,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x61,0x3B
 .p2align 2
XT_SEMI:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_BAL,XT_FETCH,XT_ONEMINUS,XT_DOQTHROW,0xFFFFFFEA,XT_NIP,XT_ONEPLUS,XT_DOQTHROW,0xFFFFFFEA,XT_REVEAL,XT_BAL,XT_OFF,XT_LPARENCOMPILERPAREN,XT_EXIT,XT_LBRACKET,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x24,0x64,0x6F,0x74,0x6F
 .p2align 2
_XT_DOTO:
 .long 0xdeadbeef,XT_DOTO


 .p2align 2
 .long 1b
1:
  .byte 0x68,0x70,0x6F,0x73,0x74,0x70,0x6F,0x6E,0x65
 .p2align 2
XT_POSTPONE:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_TICK,XT_FIMMED,XT_ZEROLT,XT_ZEROBRANCH,0x14,XT_LPARENCOMPILERPAREN,XT_LPARENCOMPILERPAREN,XT_COMMA,XT_EXIT,XT_COMPILECOMMA,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x2,0x73,0x2C
 .p2align 2
XT_SCOMMA:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_HERE,XT_OVER,XT_CHARPLUS,XT_ALLOT,XT_PLACE,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x4,0x63,0x6F,0x6C,0x64
 .p2align 2
XT_COLD:
 nop
 nop
 nop
 call XT_DOLIST
 .long XT_XTOF,XT_DICTZERO,XT_XTGTNAME,XT_DOLIT,0x18,XT_MINUS,XT_XTOF,XT_DICTZERO,XT_DOLIT,0x8,XT_PLUS,XT_STORE,XT_XTOF,XT_DUMMYTWO,XT_XTGTNAME,XT_DOTO,XT_HERE,XT_DICTZERO,XT_DOLIT,0x10000,XT_PLUS,XT_DUP,XT_DOTO,XT_MEMTOP,XT_CELLMINUS,XT_DUP,XT_USERP,XT_STORE,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_RPZERO,XT_STORE,XT_DOLIT,0x400,XT_MINUS,XT_DUP,XT_SPZERO,XT_STORE,XT_DOLIT,0x400,XT_MINUS,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_DOTO,XT_PAD,XT_DOLIT,0x100,XT_MINUS,XT_DUP,XT_DOTO,XT_TIB,XT_DROP,XT_XTOF,XT_RXQ,XT_TICKEKEYQ,XT_STORE,XT_XTOF,XT_RXFETCH,XT_TICKEKEY,XT_STORE,XT_XTOF,XT_TXQ,XT_TICKEMITQ,XT_STORE,XT_XTOF,XT_TXSTORE,XT_TICKEMIT,XT_STORE,XT_XTOF,XT_PRINTABLE,XT_TICKKHAN,XT_STORE,XT_XTOF,XT_INTERPRET,XT_TICKINTERPRET,XT_STORE,XT_XTOF,XT_DOTERR,XT_TICKDOTERROR,XT_STORE,XT_XTOF,XT_COMMA,XT_TICKCOMPILECOMMA,XT_STORE,XT_XTOF,XT_NOOP,XT_TICKDOTPROMPT,XT_STORE,XT_XTOF,XT_FORTHMINUSWORDLIST,XT_XTGTNAME,XT_DOLIT,0x3,XT_CELLS,XT_MINUS,XT_DOTO,XT_FORTHMINUSWORDLIST,XT_XTOF,XT_COLD,XT_XTGTNAME,XT_FORTHMINUSWORDLIST,XT_STORE,XT_FORTHMINUSWORDLIST,XT_DOTO,XT_GETMINUSCURRENT,XT_GETMINUSCURRENT,XT_DOLIT,0x1,XT_NUMBERORDER,XT_TWOSTORE,XT_SPZERO,XT_FETCH,XT_SPSTORE,XT_QUIT,XT_EXIT

 .p2align 2
 .long 1b
1:
  .byte 0x6,0x64,0x75,0x6D,0x6D,0x79,0x32
 .p2align 2
XT_DUMMYTWO:
 nop
 nop
 nop
 call XT_DOVAR
 .long 0x0

 .fill 54767 ,1,0
 .long 0xcacacaca
