#!/bin/sh

lex lex2f.l

gcc IOMngr.c SymTab.c SymTabTest.c -o test_symtab
gcc IOMngr.c IOMngrTest.c SymTab.c -o test_iomngr
gcc IOMngr.c lex.yy.c SymTab.c -o cc