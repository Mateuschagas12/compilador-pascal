# Compilador Pascal

Projeto da disciplina Compiladores

## Objetivo

Implementar um compilador para um subconjunto da linguagem Pascal utilizando:

- Flex
- Bison
- Linguagem C

## Funcionalidades

- Análise léxica
- Análise sintática
- Reconhecimento de:
  - variáveis
  - procedures
  - expressões
  - if/else
  - while

## Estrutura

- lexer.l → analisador léxico
- parser.y → analisador sintático
- exemplo.pas → código de teste

## Como compilar

```bash
bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -o compilador -lfl