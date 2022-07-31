%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
input:s'\n' {printf("Succesfull");exit(0);}
s:A s1 B
 |B
 ;
s1:A s1
 |
 ;
%%
int yyerror(){
printf("ERROR");
exit(0);
}
void main(){
printf("Enter the grammer :\n");
yyparse();
}
