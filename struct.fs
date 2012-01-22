\g Start structure definition
: struct ( -- sizeof )
   0 ;

\g Define structure field
: field ( prevsizeof size "name" -- sizeof )
   create over , + does> @ + ;

\g Terminate structure definition
: /struct ( sizeof "name" -- )
   create ,  does>  @ * ;

