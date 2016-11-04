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

program : blocks {programRoot = $1; }
        ;
        
blocks  : block { $$ = new AST::Block(); if($1 != NULL) $$->lines.push_back($1); }
        | blocks block { if($2 != NULL) $1->lines.push_back($2); }
        ;

block   : decl END      {$$ = $1;}
        | assign END    
        | error END     {yyerrok; $$ = NULL;}
        ;

expr    : term              /*just copies the Node*/
        | expr COMP expr { $$ = new AST::BinOp($1->coerce($3), $2, $3->coerce($1)); }
        | expr OP_PLUS expr { $$ = new AST::BinOp($1->coerce($3), Ops::plus, $3->coerce($1)); }
        | expr OP_TIMES expr { $$ = new AST::BinOp($1->coerce($3), Ops::times, $3->coerce($1)); }
        | expr OP_DIV expr { $$ = new AST::BinOp($1->coerce($3), Ops::div, $3->coerce($1)); }
        | expr OP_MINUS expr { $$ = new AST::BinOp($1->coerce($3), Ops::minus, $3->coerce($1)); }
        | expr OP_AND expr { $$ = new AST::BinOp($1, Ops::andOp, $3); }
        | expr OP_OR expr { $$ = new AST::BinOp($1, Ops::orOp, $3); }
        | OP_NOT expr { $$ = new AST::UnOp($2, Ops::notOp); }
        | OP_MINUS expr %prec OP_MIN_UN { $$ = new AST::UnOp($2, Ops::uMinus); }
        | PAR_OP expr PAR_CL { $$ = new AST::UnOp($2, Ops::par); }
        ;
