%{
#include "y.tab.h"
%}
%%
"for"      { return FOR; }
"while"    { return WHILE; }
"if"       { return IF; }
"else"     { return ELSE; }
"switch"   { return SWITCH; }
"case"     { return CASE; }
.          ;
%%
