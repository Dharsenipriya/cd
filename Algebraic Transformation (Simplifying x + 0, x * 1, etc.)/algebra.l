%{
#include "y.tab.h"
%}
%%
[0-9]+   { yylval = atoi(yytext); return NUM; }
[a-zA-Z] { return ID; }
[*+()]   { return *yytext; }
[\n\t ]+ ;
%%
