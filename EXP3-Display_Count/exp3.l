%{
#include<stdio.h>
int sc=0;	//space count
int wc=0;	//word count
int lc=0;	//line count
int cc=0;	//character count
%}

%%
[\n]	{lc++;}
[\t] 	{sc++;wc++;}
[" "] 	{sc++;wc++;}
.	;	
%%

void main(){
    printf("\nEnter the input:\n");
    yylex();
    printf("The number of lines=%d\n",lc+1); 
    printf("The number of spaces=%d\n",sc);
    printf("The number of words=%d\n",wc);
    printf("The number of characters=%d\n",cc);
}
int yywrap(){
    return 1;
}
