#!/bin/sh

yacc -d h3.y
lex h3.l
gcc -g IOMngr.c y.tab.c lex.yy.c SymTab.c main.c semantics.c -o homework3