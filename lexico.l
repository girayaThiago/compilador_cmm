%{
#include <stdio.h>
%}

comment \/\/.*\n
id	[a-zA-Z_][a-zA-Z_0-9]*\n
int [+-]?[0-9]+\n
float [+-]?([0-9]+\.[0-9]*|\.[0-9]+)\n
%x C_COMMENT

/**/
outro	.*

%%
"/*"\n?           		{ BEGIN(C_COMMENT); printf("entrou no estado do bloco\n");}
<C_COMMENT>"*/" 	{ BEGIN(INITIAL); printf("; comentarios multilinha\n");}
<C_COMMENT>\n   	{ }
<C_COMMENT>.    	{ }

{comment} 	{printf("comentario. Proximo token: \n");}
{id}		{printf("Identificador. Proximo token: \n");}
{int}		{printf("Inteiro. Proximo token: \n");}
{float}		{printf("Float. Proximo token: \n");}
[ \n\r\t] 		{  }
{outro} {printf("Não sei. Proximo token: \n");}

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