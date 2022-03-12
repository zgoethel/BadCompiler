#!/bin/sh

gcc IOMngr.c SymTab.c SymTabTest.c -o test_symtab
gcc IOMngr.c IOMngrTest.c SymTab.c -o test_iomngr

lex lex2f.l
gcc IOMngr.c lex.yy.c SymTab.c -o compiler

yacc -d boolExpr.y
lex boolLex.l
gcc IOMngr.c y.tab.c lex.yy.c SymTab.c BoolSemantics.c BoolExample.c -o example_bool

yacc -d h3.y
lex h3.l
gcc IOMngr.c y.tab.c lex.yy.c SymTab.c h3Main.c h3Semantics.c -o homework3