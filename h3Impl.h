#pragma once

#include <stdio.h>
#include <string.h>

// Implementation methods for runtime execution
void __PRINT_TABLE();
void __STORE_VAL(char *name, int value);
int __INTERS(int a, int b);
int __UNION(int a, int b);
int __LOAD_VAL(char *name);
int __PARSE_SET_LIT(char *set_lit);