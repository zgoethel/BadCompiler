#!/bin/sh

gcc -g IOMngr.c SymTab.c SymTabTest.c -o test_symtab
gcc -g IOMngr.c IOMngrTest.c SymTab.c -o test_iomngr

lex lex2f.l
gcc -g IOMngr.c lex.yy.c SymTab.c -o compiler

yacc -d boolExpr.y
lex boolLex.l
gcc -g IOMngr.c y.tab.c lex.yy.c SymTab.c BoolSemantics.c BoolExample.c -o example_bool

yacc -d h3.y
lex h3.l
gcc -g IOMngr.c y.tab.c lex.yy.c SymTab.c h3Main.c h3Semantics.c -o homework3