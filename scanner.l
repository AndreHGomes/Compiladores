%{
#include "parser.h"
#include <string>

extern int yylineno;
void yyerror(const char* s, ...);
%}

%option noyywrap nodefault yylineno

digs [0-9]
chars [a-zA-Z]

%%

[ \t\n]					; //ignora espacos

{digs}+					{yylval.name = strdup(yytext); return INTEIRO;}
"\'"."\'"				{yylval._char = yytext[1]; return CARACTER;}

"\""."\""				{yylval = atoi (yytext); return STRING;} // olhar aqui

{digs}.{digs}+				{yylval.name = strdup(yytext); return DOUBLE;} //definir 0 como default depois do ponto
"<"					{return COMECA_DEFINICAO;}
">"					{return TERMINA_DEFINICAO;}
{chars}({chars}|{digs})*		{yylval._string = new string(yytext); return IDENTIFICADOR;}

"+"					{return OP_SOMA;}
"-"					{return OP_SUBTRACAO;}
"/"					{return OP_DIVISAO;}
"*"					{return OP_MULTIPLICAO;}
"="					{return OP_ATRIBUICAO;}

"AND"					{return OP_AND;}
"OR"					{retrun OP_OR;}
"!"					{return OP_NOT;}

">>"					{return OP_MAIOR;}
"<<"					{return OP_MENOR;}
">="					{return OP_MAIOR_IGUAL;}
"<="					{return OP_MENOR_IGUAL;}
"=="					{return OP_IGUALDADE;}
"!="					{return OP_DIFERENCA;}

"("					{return COMECA_PARENTESES;}
")"					{return TERMINA_PARENTESES;}
"{"					{return COMECA_CHAVES;}
"}"					{return TERMINA_CHAVES;}
"["					{return COMECA_COLCHETES;}
"]"					{return TERMINA_COLCHETES;}

"IF"					{return OP_IF;}
"ELSE"					{return OP_ELSE;}
"FOR"					{return OP_FOR;}
"WHILE"					{return OP_WHILE;}

"TRUE"					{return OP_TRUE;}
"FALSE"					{return OP_FALSE;}
	
"ret"					{return RETORNO;}
"length"				{return OP_TAMANHO;}
"concat"				{return OP_CONCATENACAO;}

%%

void yyerror(const char *s, ...){
    va_list ap;
    va_start(ap, s);
    std::fprintf(stderr, "[Linha %d] Erro ", yylineno);
    std::vfprintf(stderr, s, ap);
    std::fprintf(stderr, "\n");
}
