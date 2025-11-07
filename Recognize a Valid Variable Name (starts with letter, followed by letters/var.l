%{
#include "y.tab.h"
%}
%%
[a-zA-Z][a-zA-Z0-9]*    { return VALID; }
.                        { return INVALID; }
%%







--------------------
💻 How to Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
