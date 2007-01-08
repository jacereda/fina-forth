warnings off
: xt>name ( xt -- name )
   dup >name if >name name>string drop 1- else drop 0 then ;
: lastname 
   last @ cell+ ;
create do?throw
defer ncell>t defer lit>t

create xtof
: renamed>t
   drop type cell+ ;
: renamed>t,
   renamed>t ." ," ;
: renamed ( addr len "word" -- )
   postpone rot ' postpone literal postpone over postpone = postpone if
      postpone renamed>t  postpone exit
   postpone else
      postpone nip postpone nip
   postpone then ; immediate 
: renamed+lit ( "word" -- )
   postpone rot ' postpone literal postpone over postpone = postpone if
      postpone renamed>t,  postpone lit>t postpone exit
   postpone else
      postpone nip postpone nip
   postpone then ; immediate 
: renamed+xt
   postpone rot ' postpone literal postpone over postpone = postpone if
      postpone renamed>t, postpone ncell>t postpone exit
   postpone else
      postpone nip postpone nip
   postpone then ; immediate 
: cell>t ( a-addr1 -- a-addr2 )
   dup @
   s" XT_EXIT" renamed ;s
   s" XT_DOFOR" renamed (for)
   s" XT_DODO" renamed (do)
   s" XT_DOQDO" renamed+lit (?do)
   s" XT_DOLIT" renamed+lit lit
   s" XT_DOLOOP" renamed+lit (loop)
   s" XT_DOPLUSLOOP" renamed+lit (+loop)
   s" XT_DONEXT" renamed+lit (next)
   s" XT_ZEROBRANCH" renamed+lit ?branch
   s" XT_BRANCH" renamed+lit branch
   s" XT_DOQTHROW" renamed+lit do?throw
   s" XT_LPARENCOMPILERPAREN" renamed+xt (compile)
   s" XT_XTOF" renamed+xt xtof
   drop ncell>t ;
: lastbody
   lastxt >body ;

\ Undefined in host
create rx? create rx@ create tx? create tx! create ?dodefine
create xt, create um+ create dolit create douser
create dovar create dofor create donext create doloop create do?do
create do+loop create 0branch create dodo create docreate
create doconst create dos" create s, create (abort") create dovalue
create primxt? create dict0 create /prims create prims create dict?
create cold

create exit create pause create sourceid create .hi 
create stacktop create follower create throwframe create memtop
create sourcevar create skipparse create histr create ?dict
create name>xt create #order create parse-word create search-word
create errword create redefstr create okstr create hld create bal
create throwmsgtable create .prompt create abort"msg 
create throwmsg create exstr create (d.) create (doublealso)
create dolit create pack" create dp create choose create litchoose
create doublealso, create doublealso create doword create userp
create 'ekey? create 'ekey create 'emit? create 'emit
create 'interpret create @execute create $skip create same?
create (nfa-search-wordlist) create remaining create digit
create accum create dolist create hasname? create nesting? 
create linklast create (head,) create head, create 0branch
create branch create fw create bw create resolve create mark
create link create foreach create forall create @r+ create !r+
create leaves create resolvleave create (xt,) create pipe
create .ok create con create echo create 'echo create '.prompt
create file create doto

: ahead postpone ahead ; immediate compile-only
: if postpone if ; immediate compile-only
: then postpone then ; immediate compile-only
: again postpone again ; immediate compile-only
create sliteral immediate compile-only

create 4arshift create 8arshift create 12arshift create 16arshift
create 20arshift create 24arshift create 28arshift create .dig
create .val create dumprow create arshift

create type2 create rdepth create rpick

create head>xt create xt>head create forwords create findname create naddr create nlen create nomore create forwords create co create caller create found create cellcount create match? create forth-wordlist' create #order' create wid 
create forwordsin create findnamein
create fxt create fimmed create /fcompo
create 'throwmsg create s>unumber
create parsed create nfa create nfain
create 'khan
create dummy2
create .err
create '.error create .rs
create do2lit
create sskip create sscan
create sparse create unparsed create unparsed!
create 'compile,
create printable

: char+ postpone 1+ ; immediate compile-only
: 1chars/ ; immediate
: cell- 1 cells - ;
