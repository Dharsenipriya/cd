%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid Expression\n"); }
%}

%token NUMBER

%%
expr: expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | NUMBER
    ;
%%

int main() {
    printf("Enter expression: ");
    yyparse();
    printf("Valid Expression\n");
    return 0;
}
