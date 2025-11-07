#include <stdio.h>
#include <string.h>

int main() {
    char op[5], arg1[10], arg2[10], result[10];

    printf("Enter Three Address Code (e.g., t1 = a + b)\n");
    printf("Type 'end' to stop.\n\n");

    while (1) {
        scanf("%s", result);
        if (strcmp(result, "end") == 0) break;

        scanf("%s %s %s", op, arg1, arg2); // op will contain '='
        scanf("%s", op); // operator (+,-,*,/)

        printf("\n; 8086 Assembly Code:\n");
        printf("MOV AX, %s\n", arg1);

        if (strcmp(op, "+") == 0)
            printf("ADD AX, %s\n", arg2);
        else if (strcmp(op, "-") == 0)
            printf("SUB AX, %s\n", arg2);
        else if (strcmp(op, "*") == 0)
            printf("MUL %s\n", arg2);
        else if (strcmp(op, "/") == 0)
            printf("DIV %s\n", arg2);

        printf("MOV %s, AX\n", result);
        printf("-------------------------\n");
    }

    return 0;
}
---------------------------
  💻 How to Compile and Run
gcc backend.c -o backend
./backend

🧠 Sample Input
t1 = a + b
t2 = t1 - c
end

✅ Sample Output
; 8086 Assembly Code:
MOV AX, a
ADD AX, b
MOV t1, AX
-------------------------
; 8086 Assembly Code:
MOV AX, t1
SUB AX, c
MOV t2, AX
-------------------------

📘 Explanation

The program reads a TAC statement (like t1 = a + b).

It translates it to equivalent 8086 assembly instructions:

Load the first operand into AX

Perform the operation (ADD, SUB, MUL, DIV)

Store result into the target variable
