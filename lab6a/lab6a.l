%{
#include<stdio.h>
int sl=0,ml=0;
%}
%%
"/*"[a-zA-Z0-9' '\t\n]+"*/" {ml++;}
"//".*	{sl++;}
%%
int main(){
	yyin=fopen("write.c","r");
	yyout=fopen("output.c","w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	printf("\n Number of single line comments are = %d\n",sl);
	printf("\nNumber of multi-line comments are =%d\n",ml);
	return 0;
}
