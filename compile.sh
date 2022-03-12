#!/bin/sh

lex lex2f.l

gcc IOMngr.c SymTab.c SymTabTest.c -o test_symtab
gcc IOMngr.c IOMngrTest.c SymTab.c -o test_iomngr
gcc IOMngr.c lex.yy.c SymTab.c -o compiler

yacc -d boolExpr.y
lex boolLex.l
gcc IOMngr.c y.tab.c lex.yy.c SymTab.c BoolSemantics.c BoolExample.c -o example_bool

yacc -d h3Expr.y
lex h3Lex.l
gcc IOMngr.c y.tab.c lex.yy.c SymTab.c h3Bootstrap.c h3Impl.c -o homework3