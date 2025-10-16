%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();    
%}

%token WHILE AND OR NTEQ EQ LT GT LTEQ GTEQ ID NUM

%%
whileloop: WHILE'('cond')''{''}' {printf("Parsing Successfull\n");}
cond : scond | scond logop cond;
scond : nid | nid relop nid;
nid : ID | NUM;
logop : AND | OR;
relop : NTEQ | EQ | LT | LTEQ | GT | GTEQ;
%%
void main(){
    printf("Enter the input : ");
    yyparse();
}
int yyerror(char *msg){
    printf("Parsing Failed\n");
}