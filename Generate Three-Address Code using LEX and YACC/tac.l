%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUM; }
[a-zA-Z][a-zA-Z0-9]*   { return ID; }
[+\-*/=()]      { return *yytext; }
[\n\t ]+        ;
.               ;
%%
