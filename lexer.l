%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

letter      [a-zA-Z]
digit       [0-9]

id          {letter}({letter}|{digit})*
num         {digit}+(\.{digit}+)?([eE][+-]?{digit}+)?

%%

"program"      { return PROGRAM; }
"var"          { return VAR; }
"integer"      { return INTEGER; }
"real"         { return REAL; }
"procedure"    { return PROCEDURE; }
"begin"        { return BEGINN; }
"end"          { return END; }
"if"           { return IF; }
"then"         { return THEN; }
"else"         { return ELSE; }
"while"        { return WHILE; }
"do"           { return DO; }

"or"           { return OR; }
"and"          { return AND; }
"not"          { return NOT; }
"div"          { return DIV; }
"mod"          { return MOD; }

":="           { return ASSIGN; }

">="           { return GE; }
"<="           { return LE; }
"<>"           { return NE; }
">"            { return GT; }
"<"            { return LT; }
"="            { return EQ; }

"+"            { return '+'; }
"-"            { return '-'; }
"*"            { return '*'; }
"/"            { return '/'; }

";"            { return ';'; }
":"            { return ':'; }
","            { return ','; }
"."            { return '.'; }

"("            { return '('; }
")"            { return ')'; }

{num} {
    yylval.num = atof(yytext);
    return NUM;
}

{id} {
    yylval.str = strdup(yytext);
    return ID;
}

"{"[^}]*"}"    { }

[ \t\n\r]+     { }

. {
    printf("Caractere inválido: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}