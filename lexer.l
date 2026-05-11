%{
#include <stdio.h>
#include <stdlib.h>
%}

letter      [a-zA-Z]
digit       [0-9]

id          {letter}({letter}|{digit})*
num         {digit}+(\.{digit}+)?([eE][+-]?{digit}+)?

%%

"program" {
    printf("TOKEN -> PROGRAM\n");
}

"var" {
    printf("TOKEN -> VAR\n");
}

"integer" {
    printf("TOKEN -> INTEGER\n");
}

"real" {
    printf("TOKEN -> REAL\n");
}

"procedure" {
    printf("TOKEN -> PROCEDURE\n");
}

"begin" {
    printf("TOKEN -> BEGIN\n");
}

"end" {
    printf("TOKEN -> END\n");
}

"if" {
    printf("TOKEN -> IF\n");
}

"then" {
    printf("TOKEN -> THEN\n");
}

"else" {
    printf("TOKEN -> ELSE\n");
}

"while" {
    printf("TOKEN -> WHILE\n");
}

"do" {
    printf("TOKEN -> DO\n");
}

"or" {
    printf("TOKEN -> OR\n");
}

"and" {
    printf("TOKEN -> AND\n");
}

"not" {
    printf("TOKEN -> NOT\n");
}

"div" {
    printf("TOKEN -> DIV\n");
}

"mod" {
    printf("TOKEN -> MOD\n");
}

":=" {
    printf("TOKEN -> ASSIGN\n");
}

">=" {
    printf("TOKEN -> GE\n");
}

"<=" {
    printf("TOKEN -> LE\n");
}

"<>" {
    printf("TOKEN -> NE\n");
}

">" {
    printf("TOKEN -> GT\n");
}

"<" {
    printf("TOKEN -> LT\n");
}

"=" {
    printf("TOKEN -> EQ\n");
}

"+" {
    printf("TOKEN -> PLUS\n");
}

"-" {
    printf("TOKEN -> MINUS\n");
}

"*" {
    printf("TOKEN -> MULT\n");
}

"/" {
    printf("TOKEN -> DIVIDE\n");
}

";" {
    printf("TOKEN -> SEMICOLON\n");
}

":" {
    printf("TOKEN -> COLON\n");
}

"," {
    printf("TOKEN -> COMMA\n");
}

"." {
    printf("TOKEN -> DOT\n");
}

"(" {
    printf("TOKEN -> LPAREN\n");
}

")" {
    printf("TOKEN -> RPAREN\n");
}

{num} {
    printf("TOKEN -> NUM (%s)\n", yytext);
}

{id} {
    printf("TOKEN -> ID (%s)\n", yytext);
}

"{"[^}]*"}" {
    printf("TOKEN -> COMMENT\n");
}

[ \t\n\r]+ {
    /* Ignora espaços */
}

. {
    printf("ERRO LEXICO -> Caractere invalido: %s\n", yytext);
}

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}