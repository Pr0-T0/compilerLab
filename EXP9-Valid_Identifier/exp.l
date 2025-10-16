%{
    #include "y.tab.h"
%}

%%
[a-zA-Z] {return L;}
[0-9] {return D;}
[_] {return U;}
\n {return NL;}
%%
int yywrap(){
    return 1;
}