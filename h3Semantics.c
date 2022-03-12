#include "h3Semantics.h"

#include <stdio.h>
#include <string.h>

void __PRINT_TABLE()
{
    printf("__PRINT_TABLE()\n");
}

void __STORE_VAL(char *name, int value)
{
    printf("__STORE_VAL(%s, %d)\n", name, value);
}

int count = 0;

int __INTERS(int a, int b)
{
    printf("__INTERS(%d, %d)\n", a, b);
    return count++;
}

int __UNION(int a, int b)
{
    printf("__UNION(%d, %d)\n", a, b);
    return count++;
}

int __LOAD_VAL(char *name)
{
    printf("__LOAD_VAL(%s)\n", name);
    return count++;
}

int __PARSE_SET_LIT(char *set_lit)
{
    printf("__PARSE_SET_LIT(%s)\n", set_lit);
    return count++;
}