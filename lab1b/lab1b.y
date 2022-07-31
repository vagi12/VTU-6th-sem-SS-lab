%{
#include<stdio.h>
#include<stdlib.h>
%}
%token num
%left '+''-'
%left '*''/'
%%
input:exp {printf("%d\n",$$);}
     ;
exp:exp'+'exp {$$=$1+$3;}
   |exp'-'exp {$$=$1-$3;}
   |exp'*'exp {$$=$1*$3;}
   |exp'/'exp {if($3==0){printf("Divided by zero");exit(0);}else{$$=$1/$3;}}
   |'('exp')' {$$=$2;}
   |num {$$=$1;}
   ; 
%%
int yyerror(){
	printf("ERROR");
	exit(0);
}
int main(){
	yyparse();
}
