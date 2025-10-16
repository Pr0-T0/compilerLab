#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int isKeyword(char buffer[]) {
    int flag = 0;
    char keywords[5][10] = {"int", "float", "double", "for", "while"};
    for (int i = 0; i < 5; i++) {
        if (strcmp(keywords[i], buffer) == 0) {
            flag = 1;
            break;
        }
    }
    return flag;
}

int main() {
    FILE *fp;
    char ch, buffer[15];
    int num = 0, j = 0;
    char operators[] = "+-*/%=:;,()";

    fp = fopen("input.txt", "r");
    if (fp == NULL) {
        printf("Error opening file\n");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF) {
        // detect numbers
        if (isdigit(ch)) {
            num = ch - '0';
            ch = fgetc(fp);
            while (isdigit(ch)) {
                num = num * 10 + (ch - '0');
                ch = fgetc(fp);
            }
            printf("%d is a number\n", num);
            ungetc(ch, fp);
        }

        // detect operators
        for (int i = 0; i < strlen(operators); i++) {
            if (ch == operators[i]) {
                printf("%c is an operator\n", ch);
            }
        }

        // detect identifiers / keywords
        if (isalnum(ch)) {
            buffer[j++] = ch;
        } else if ((ch == ' ' || ch == '\n') && j != 0) {
            buffer[j] = '\0';
            j = 0;

            if (isKeyword(buffer))
                printf("%s is a keyword\n", buffer);
            else
                printf("%s is an identifier\n", buffer);
        }
    }

    fclose(fp);
    return 0;
}

