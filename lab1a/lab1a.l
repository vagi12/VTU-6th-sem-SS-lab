%{
#include<stdio.h>
int id=0,op=0,v=0,flag=0;
%}
%%
[0-9]+ {id++;printf("%s is an identifier\n",yytext);}
[+ *] {op++;printf("%s is an operator\n",yytext);}
"(" {v++;}
")" {{if(v<=0) flag=1;return 0;}v--;}
. {flag=1;}
%%
void main(){
printf("Enter the expression :\n");
yylex();
if(id==op+1 && v==0 && flag==0){
printf("No. of identifier %d\nNo. of operator %d",id,op);
}
else{
printf("ERROR");
}
}
