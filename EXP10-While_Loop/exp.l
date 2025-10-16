%{
    #include "y.tab.h"
%}

%%
"while" {return WHILE;}
"&&" {return AND;}
"||" {return OR;}
"!=" {return NTEQ;}
"==" {return EQ;}
"<" {return LT;}
">" {return GT;}
"<=" {return LTEQ;}
">=" {return GTEQ;}
[=,{},();] {return *yytext;}
[a-zA-Z_][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUM;}
%%
int yywrap() {return 1;}