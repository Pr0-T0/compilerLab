%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();
%}

%token L D U NL

%%
stmt : S NL {printf("Valid String\n");exit(0);}
S : L A;
A : L A | D A | U A | L | D | U
%%
void main(){
    printf("Enter the String: ");
    yyparse();
}
int yyerror(char *msg){printf("Invalid\n");}