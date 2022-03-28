#include "semantics.h"
#include "SymTab.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

SymTab *VariableValues = NULL;

void __ALLOC_H3()
{
    // Allocate table to hold variables
    VariableValues = createSymTab(17);
}

void __DELETE_VAR_DEEP(SymTab *Table)
{
    // Delete copied strings
    if (startIterator(Table)) do
    {
        free(getCurrentAttr(Table));
    } while (nextEntry(Table));
    // Delete variable table
    destroySymTab(Table);
}

void __FREE_H3()
{
    // Iterate through variable tables
    if (startIterator(VariableValues)) do
    {
        SymTab *Table = (SymTab *)getCurrentAttr(VariableValues);
        __DELETE_VAR_DEEP(Table);
    } while (nextEntry(VariableValues));

    destroySymTab(VariableValues);
    VariableValues = NULL;
}

void __PRINT_TABLE()
{
    if (startIterator(VariableValues)) do
    {
        // Get variable name and table value
        char *Name = getCurrentName(VariableValues);
        SymTab *Table = (SymTab *)getCurrentAttr(VariableValues);

        printf("%s: {", Name);

        // Print out set literal notation
        int i = 0;
        if (startIterator(Table)) do
        {
            if (i > 0)
                printf(",");
            printf("%s", (char *)getCurrentAttr(Table));
            i++;
        } while (nextEntry(Table));

        printf("}\n");
    } while (nextEntry(VariableValues));
}

void __STORE_VAL(char *name, SymTab *value)
{
    if (findName(VariableValues, name))
    {
        SymTab *Current = (SymTab *)getCurrentAttr(VariableValues);
        __DELETE_VAR_DEEP(Current);
    } else
        // Put the key in the table
        enterName(VariableValues, name);
    // Store provided table pointer as value
    setCurrentAttr(VariableValues, (void *)value);

    free(name);
}

SymTab *__INTERS(SymTab *a, SymTab *b)
{
    SymTab *Result = createSymTab(17);

    if (startIterator(a)) do
    {
        if (findName(b, getCurrentName(a)))
        {
            enterName(Result, getCurrentAttr(a));
            setCurrentAttr(Result, strdup(getCurrentAttr(a)));
        }
    } while (nextEntry(a));

    __DELETE_VAR_DEEP(a);
    __DELETE_VAR_DEEP(b);

    return Result;
}

SymTab *__UNION(SymTab *a, SymTab *b)
{
    SymTab *Result = createSymTab(17);

    if (startIterator(a)) do
    {
        enterName(Result, getCurrentAttr(a));
        setCurrentAttr(Result, strdup(getCurrentAttr(a)));
    } while (nextEntry(a));
    if (startIterator(b)) do
    {
        // Wrapped in if to avoid memory leak
        if (!findName(a, getCurrentName(b)))
        {
            enterName(Result, getCurrentAttr(b));
            setCurrentAttr(Result, strdup(getCurrentAttr(b)));
        }
    } while (nextEntry(b));
    
    __DELETE_VAR_DEEP(a);
    __DELETE_VAR_DEEP(b);

    return Result;
}

SymTab *__LOAD_VAL(char *name)
{
    SymTab *Result = createSymTab(17);
    // Deep copy data if exists in memory
    if (findName(VariableValues, name))
    {
        SymTab *ToDuplicate = (SymTab *)getCurrentAttr(VariableValues);
        if (startIterator(ToDuplicate)) do
        {
            enterName(Result, getCurrentName(ToDuplicate));
            setCurrentAttr(Result, strdup(getCurrentAttr(ToDuplicate)));
        } while (nextEntry(ToDuplicate));
    }
    
    free(name);

    return Result;
}

SymTab *__PARSE_SET_LIT(char *set_lit)
{
    SymTab *Result = createSymTab(17);
    int NumElements = strlen(set_lit) / 2;
    if (strcmp(set_lit, "{}") == 0) NumElements = 0;

    int i = 0;
    for (; i < NumElements; i++)
    {
        // Get character to add
        char c = set_lit[i * 2 + 1];
        // Enter value into table
        char *stringified = strndup(&c, 1);
        enterName(Result, stringified);
        setCurrentAttr(Result, strndup(&c, 1));
        free(stringified);
    }

    free(set_lit);

    return Result;
}