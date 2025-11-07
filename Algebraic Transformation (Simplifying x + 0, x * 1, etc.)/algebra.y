%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s){}
%}

%token NUM ID

%%
expr: ID '+' NUM { if($3==0) printf("Optimized: %s\n", $1); else printf("No optimization\n"); }
    | ID '*' NUM { if($3==1) printf("Optimized: %s\n", $1); else printf("No optimization\n"); }
    ;
%%

int main() {
    printf("Enter expression (e.g., x+0 or x*1): ");
    yyparse();
    return 0;
}

-----------------
🧠 Example Input:

x+0


✅ Output:

Optimized: x

💻 How to Compile and Run (for all)
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
