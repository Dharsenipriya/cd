%{
#include "y.tab.h"
%}
%%
[0-9]+      { return NUMBER; }
[+\-*/]     { return *yytext; }
[ \t\n]     ;
.           { return *yytext; }
%%

-------------
💻 How to Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
