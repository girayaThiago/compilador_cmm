%{
#include <stdio.h>
%}

comment \/\/.*\n
id	[a-zA-Z_][a-zA-Z_0-9]*\n
int [0-9][0-9]*\n
float [0-9]+\.[0-9]*\n|[0-9]*\.[0-9]+\n
/**/
outro	.*\n

%%
{comment} 	{printf("comentario. Proximo token: \n");}
{id}		{printf("Identificador. Proximo token: \n");}
{int}		{printf("Inteiro. Proximo token: \n");}
{float}		{printf("Float. Proximo token: \n");}

{outro}		{printf("Nao sei...deixe-me tentar mais um:\n");}
%%
/* recomendavel declarar sempre funcao yywrap() */
int yywrap ();

/* programa principal */
main() {
	printf("Informe um token e tecle <enter>:\n");
	yylex(); /* scanner gerado por Flex */
}

// Retorna 1 quando chegar EOF
int yywrap() {
	return 1;
}