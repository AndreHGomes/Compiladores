%{
#include "ast.h"
#include "st.h"

ST::SymbolTable symtab;
AST::Block *programRoot;

extern int yylex();
extern void yyerror(const char* s, ...);
%}

%define parse.trace

%union {
    AST::Node *node;        //Node of the syntax tree
    AST::Block *block;      //List of nodes of syntax trees
    AST::VarDeclaration *vars; //List of variables in a declaration
    const char *name;       //Names of variables and values
}

%token OP_SOMA OP_SUBTRACAO OP_DIVISAO OP_MULTIPLICACAO OP_AND OP_OR OP_NOT OP_MAIOR OP_MENOR OP_MAIOR_IGUAL OP_MENOR_IGUAL OP_IGUALDADE OP_DIFERENCA
%token OP_ATRIBUICAO
%token OP_TRUE OP_FALSE INTEIRO CARACTER
%token OP_IF OP_ELSE OP_WHILE OP_FOR OP_TAMANHO OP_CONCATENACAO
%token IDENTIFICADOR 



%left OP_AND OP_OR
%left OP_NOT
%left OP_MAIOR OP_MENOR OP_MAIOR_IGUAL OP_MENOR_IGUAL OP_IGUALDADE OP_DIFERENCA
%left OP_SOMA OP_SUBTRACAO
%left OP_MULTIPLICACAO OP_DIVISAO

/* Starting rule 
 */
%start program

%%


