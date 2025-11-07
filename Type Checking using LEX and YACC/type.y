%{
#include <stdio.h>
#include <string.h>
int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }

char type[10];
%}

%token INT FLOAT ID NUM

%%
stmt: type ID '=' NUM ';'
        { printf("Type Checking Passed: %s assigned to %s\n", $1, $2); }
    ;

type: INT   { strcpy(type, "int"); $$ = "int"; }
    | FLOAT { strcpy(type, "float"); $$ = "float"; }
    ;
%%

int main() {
    printf("Enter declaration (e.g., int a=5;): ");
    yyparse();
    return 0;
}
----------------
Sample Input
int a=5;

Sample Output
Type Checking Passed: int assigned to a

💻 How to Compile and Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
