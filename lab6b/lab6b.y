%{
#include <stdio.h>
#include <stdlib.h>
int id=0,dig=0,key=0,op=0,lit=0;
%}
%token DIGIT ID KEY OP LIT
%%
input:DIGIT input { dig++; }
     | ID input { id++; }
     | KEY input { key++; }
     | OP input {op++;}
     | LIT input {lit++;}
     | DIGIT { dig++; }
     | ID { id++; }
     | KEY { key++; }
     | OP { op++;}
     | LIT {lit++;}
     ;
%%
extern FILE *yyin;
void main() 
{ 
	yyin = fopen("hello.c", "r");
	do{
		yyparse();
	}
	while (!feof(yyin));
	printf("\nnumbers = %d\nKeywords = %d\nIdentifiers = %d\noperators = %d\nliteral = %d",dig, key,id, op,lit);
}
void yyerror() {
	printf("EEK, parse error! Message: ");
	exit(-1);
}
