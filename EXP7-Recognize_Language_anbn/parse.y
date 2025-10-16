%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();
%}

%token A B NL

%%
stmt : S NL {printf("Valid String\n"); exit(0);}
S : A S B |;
%%

int main(){
    printf("Enter the String:\n");
    yyparse();
}
int yyerror(char *msg){
    printf("Invalid String\n");
}