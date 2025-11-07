%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s){}
%}

%token NUM

%%
expr: expr '+' expr { printf("%d\n", $1 + $3); }
    | expr '-' expr { printf("%d\n", $1 - $3); }
    | expr '*' expr { printf("%d\n", $1 * $3); }
    | expr '/' expr { printf("%d\n", $1 / $3); }
    | NUM           { $$ = $1; }
    ;
%%

int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}
----------------------
🧠 Example Input:

2+3*4


✅ Output (after folding):

14

lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
