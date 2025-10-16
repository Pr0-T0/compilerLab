%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();    
%}

%token A B NL

%%
stmt : S NL {printf("Valid String\n");}
S : A S | B|;
%%

int yyerror(char *msg) {printf("Invalid Expression\n");}
void main() {printf("Enter the String:");yyparse();}