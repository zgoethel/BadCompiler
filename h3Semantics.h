#pragma once

#include "SymTab.h"

#include <stdio.h>
#include <string.h>

// Implementation methods for runtime execution
void __PRINT_TABLE();
void __STORE_VAL(char *name, SymTab *value);
SymTab *__INTERS(SymTab *a, SymTab *b);
SymTab *__UNION(SymTab *a, SymTab *b);
SymTab *__LOAD_VAL(char *name);
SymTab *__PARSE_SET_LIT(char *set_lit);

void __ALLOC_H3();
void __FREE_H3();