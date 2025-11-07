%{
#include <stdio.h>
int yylex();
void yyerror(const char *s) { printf("Invalid Control Statement\n"); }
%}

%token FOR WHILE IF ELSE SWITCH CASE

%%
stmt: FOR
    | WHILE
    | IF
    | IF ELSE
    | SWITCH
    | SWITCH CASE
    ;
%%

int main() {
    printf("Enter control keyword: ");
    yyparse();
    printf("Valid Control Structure\n");
    return 0;
}

------------------
💻 How to Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
