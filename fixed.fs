1000 constant fxscale
: fxdivider 1 dpl @ 0 max 0 ?do 10 * loop ;
: >fx ( d -- fx ) dup 0< <> -11 and throw  fxscale fxdivider */ ;
: fx# ( "number" -- fx )
   parse-word 10 based s>dnumber >fx state @ if postpone literal then ; immediate 
: fx* ( fx1 fx2 -- fxres ) fxscale m*/ ;
