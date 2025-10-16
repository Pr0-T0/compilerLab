%{
    #include<stdio.h>
    int yywrap(void) { return 1; }  // End of input
%}

/* ---------------- Definitions ---------------- */

delim       [\t]                      // Tab character
ws          {delim}+                  // One or more tabs
letter      [A-Za-z]                  // Any letter
digit       [0-9]                     // Any digit
id          {letter}({letter}|{digit})*  // Identifier: letter followed by letters/digits
num         {digit}+(\.{digit}+)?(E[+-]?{digit}+)?  // Number: int, float, or scientific

%%

ws  { /* no action for whitespace */ }

"auto"|"break"|"char"|"const"|"int"  { printf("%s is a keyword\n", yytext); }

{id}    { printf("%s is an identifier\n", yytext); }

{num}   { printf("%s is a number\n", yytext); }


"="    { printf("%s is an assignment operator\n", yytext); }
"+"    { printf("%s is an arithmetic operator\n", yytext); }
"-"    { printf("%s is an arithmetic operator\n", yytext); }
"*"    { printf("%s is an arithmetic operator\n", yytext); }
"/"    { printf("%s is an arithmetic operator\n", yytext); }
"%"    { printf("%s is an arithmetic operator\n", yytext); }

.      { printf("unrecognized character: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
