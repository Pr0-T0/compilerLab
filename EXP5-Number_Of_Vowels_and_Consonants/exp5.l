%{
    #include<stdio.h>
    int vow_count = 0;
    int cons_count = 0;    
%}

%%
[aeiouAEIOU]    {vow_count++;}
[a-zA-Z]    {cons_count++;}
%%

void main(){
    printf("Enter vowels and consonants:");
    yylex();
    printf("Vowel Count = %d\n",vow_count);
    printf("Consonant Count = %d\n",cons_count);
}
int yywrap(){
    return 1;
}