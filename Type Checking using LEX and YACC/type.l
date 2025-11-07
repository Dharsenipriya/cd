%{
#include "y.tab.h"
%}

%%
"int"    { return INT; }
"float"  { return FLOAT; }
[a-zA-Z][a-zA-Z0-9]* { return ID; }
[=;]     { return *yytext; }
[0-9]+   { return NUM; }
[\n\t ]+ ;
.        ;
%%
