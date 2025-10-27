%{
	#include<stdio.h>
	int flag = 0;
	
	int yylex();
	void yyerror(char *s);
%}

%token NUMBER
%left '+''-'
%left '*''/''%'
%left '('')'

%%
	ArithmaticExpression: E{
		printf("Result=%d\n",$$);
		return 0;
	};
	E : E '+' E {$$ = $1 + $3;} |
	E '-' E {$$ = $1 - $3;} |
	E '*' E {$$ = $1 * $3;} |
	E '/' E {$$ = $1 / $3;} |
	E '%' E {$$ = $1 % $3;} |
	'('E')' {$$ = $2;} |
	NUMBER {$$ = $1;};
%%
void main(){
	printf("Enter any arithmatic Expression : ");
	yyparse();
	if (flag == 0)
		printf("\n\n");
}
void yyerror(char *s){
	printf("\nInvalid:%s\n\n",s);
	flag = 1;
}
