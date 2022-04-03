#!/bin/sh

gcc -g IOMngr.c SymTab.c SymTabTest.c -o test_symtab
gcc -g IOMngr.c IOMngrTest.c SymTab.c -o test_iomngr

yacc -d compiler.y
lex compiler.l
gcc -g IOMngr.c y.tab.c lex.yy.c SymTab.c CompilerMain.c Semantics.c CodeGen.c \
    -o compiler