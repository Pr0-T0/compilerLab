#include <stdio.h>
#include <string.h>

void main() {
    char stack[20], ip[20], opt[10][10], ter[10];
    int top = 0, col, row, n, i, j, k;

    for (i = 0; i < 20; i++) {
        stack[i] = '\0';
        ip[i] = '\0';
    }
    for (i = 0; i < 10; i++)
        for (j = 0; j < 10; j++)
            opt[i][j] = '\0';

    printf("\nEnter number of terminals: ");
    scanf("%d", &n);

    printf("\nEnter the terminals: ");
    scanf("%s", ter);

    printf("\nEnter the table values:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("Enter the value for %c %c: ", ter[i], ter[j]);
            scanf(" %c", &opt[i][j]);
        }
    }

    printf("\nOPERATOR PRECEDENCE TABLE\n\n");
    printf("\t");
    for (i = 0; i < n; i++)
        printf("%c\t", ter[i]);
    printf("\n");

    for (i = 0; i < n; i++) {
        printf("%c\t", ter[i]);
        for (j = 0; j < n; j++)
            printf("%c\t", opt[i][j]);
        printf("\n");
    }

    stack[top] = '$';

    printf("\nEnter the input string: ");
    scanf("%s", ip);

    printf("\nSTACK\t\tINPUT\t\tACTION\n");
    printf("%s\t\t%s\t\t\t", stack, ip);

    // Parsing setup
    i = 0;
    while (i <= strlen(ip)) {
        for (k = 0; k < n; k++) {
            if (stack[top] == ter[k])
                row = k;
            if (ip[i] == ter[k])
                col = k;
        }

        //if both stack and input end with $ ; accept
        if ((stack[top]=='$') && (ip[i] == '$')){
            printf("string is accepted!");
            break;
        }
        else if ((opt[row][col] == '<') || (opt[row][col] == '=')){
            //shift
            stack[++top] = opt[row][col];
            stack[++top] = ip[i];
            printf("Shift %c",ip[i]);
            i++;
        }
        else {
            //reduce
            if (opt[row][col] == '>'){
                while (stack[top] != '<')
                    --top;
                top = top - 1;
                printf("Reduce");
            }
            else {
                printf("\nString is not accepted!");
                break;
            }
        }

        printf("\n");
        for (k = 0; k <= top; k++)
            printf("%c",stack[k]);
        printf("\t\t\t");

        for (k = i; k < strlen(ip); k++)
            printf("%c",ip[k]);

        printf("\t\t\t");
    }
}
