%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s) { printf("Error\n"); }
%}

%token NUMBER

%%
expr: expr '+' expr   { printf("%d\n", $1 + $3); }
    | expr '-' expr   { printf("%d\n", $1 - $3); }
    | expr '*' expr   { printf("%d\n", $1 * $3); }
    | expr '/' expr   { printf("%d\n", $1 / $3); }
    | NUMBER          { $$ = $1; }
    ;
%%
int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
----------------
How to Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
