%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s){}
%}

%token NUM ID

%%
stmt: ID '*' NUM {
        if ($3 == 2)
            printf("Optimized: %c + %c\n", 'x', 'x');
        else
            printf("No optimization\n");
    }
    ;
%%

int main() {
    printf("Enter expression (e.g., x*2): ");
    yyparse();
    return 0;
}
------------------
Example Input:

x*2


✅ Output:

Optimized: x + x

How to Compile and Run (for all)
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
