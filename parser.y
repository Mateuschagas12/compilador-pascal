%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    char* str;
    double num;
}

%token <str> ID
%token <num> NUM

%token PROGRAM VAR INTEGER REAL PROCEDURE
%token BEGINN END IF THEN ELSE WHILE DO
%token OR AND NOT DIV MOD

%token ASSIGN
%token GE LE NE GT LT EQ

%%

program:
    header declarations block '.'
    {
        printf("Programa válido!\n");
    }
;

header:
    PROGRAM ID ';'
;

declarations:
    variable_declarations procedure_declarations
;

variable_declarations:
    VAR variable_list
    |
;

variable_list:
    variable_list variable_decl
    | variable_decl
;

variable_decl:
    identifier_list ':' type ';'
;

identifier_list:
    identifier_list ',' ID
    | ID
;

type:
    INTEGER
    | REAL
;

procedure_declarations:
    procedure_declarations procedure_decl
    |
;

procedure_decl:
    procedure_header declarations block ';'
;

procedure_header:
    PROCEDURE ID ';'
;

block:
    BEGINN statements END
;

statements:
    statements ';' statement
    | statement
;

statement:
    ID ASSIGN expression
    | ID '(' ')'
    | block
    | IF expression THEN statement else_clause
    | WHILE expression DO statement
    |
;

else_clause:
    ELSE statement
    |
;

expression:
    simple_expression
    | simple_expression relop simple_expression
;

simple_expression:
    term
    | '+' term
    | '-' term
    | simple_expression '+' term
    | simple_expression '-' term
    | simple_expression OR term
;

term:
    factor
    | term '*' factor
    | term '/' factor
    | term DIV factor
    | term MOD factor
    | term AND factor
;

factor:
    ID
    | NUM
    | '(' expression ')'
    | NOT factor
;

relop:
    GT
    | LT
    | GE
    | LE
    | EQ
    | NE
;

%%

void yyerror(const char *s) {
    printf("Erro sintático: %s\n", s);
}

int main() {
    return yyparse();
}