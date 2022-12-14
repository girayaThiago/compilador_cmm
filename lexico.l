%{
#include <stdio.h>
%}
id	[a-zA-Z][a-zA-Z0-9]*\n
outro	.*\n
%%
{id}		{printf("Identificador. Proximo token: \n");}
{outro}		{printf("Nao sei...deixe-me tentar mais um:\n");}
%%
/* recomendavel declarar sempre funcao yywrap() */
int yywrap ();

/* programa principal */
main() {
	printf("Informe um token e tecle <enter>:\n");
	yylex(); /* scanner gerado por Flex */
}

int yywrap() {
	return 1;
}