%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s) { printf("Error: %s\n", s); }

int tempCount = 1;
char temp[10];
%}

%token NUM ID

%%
stmt: ID '=' expr { printf("TAC: %s = %s\n", $1, $3); }
    ;

expr: expr '+' term { sprintf(temp, "t%d", tempCount++); printf("%s = %s + %s\n", temp, $1, $3); $$ = temp; }
    | expr '-' term { sprintf(temp, "t%d", tempCount++); printf("%s = %s - %s\n", temp, $1, $3); $$ = temp; }
    | term
    ;

term: term '*' factor { sprintf(temp, "t%d", tempCount++); printf("%s = %s * %s\n", temp, $1, $3); $$ = temp; }
    | term '/' factor { sprintf(temp, "t%d", tempCount++); printf("%s = %s / %s\n", temp, $1, $3); $$ = temp; }
    | factor
    ;

factor: ID { $$ = strdup(yytext); }
      | NUM { sprintf(temp, "%d", yylval); $$ = strdup(temp); }
      ;
%%

int main() {
    printf("Enter simple expression (e.g., a=b+c*d): ");
    yyparse();
    return 0;
}
------------
Sample Input
a=b+c*d

Sample Output
t1 = c * d
t2 = b + t1
TAC: a = t2

How to Compile and Run
lex filename.l
yacc -d filename.y
gcc lex.yy.c y.tab.c -o output
./output
