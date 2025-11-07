%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid Variable\n"); }
%}

%token VALID INVALID

%%
input: VALID   { printf("Valid Variable\n"); }
     | INVALID { printf("Invalid Variable\n"); }
     ;
%%

int main() {
    printf("Enter variable name: ");
    yyparse();
    return 0;
}
