#include "h3Semantics.h"
#include "SymTab.h"

#include <stdio.h>
#include <string.h>

SymTab *VariableValues = NULL;
int VariableSerial = 0;

void __ALLOC_H3()
{
    VariableValues = createSymTab(17);
}

void __FREE_H3()
{
    if (startIterator(VariableValues))
        do
        {
            SymTab *Table = (SymTab *)getCurrentAttr(VariableValues);
            destroySymTab(Table);
        } while (nextEntry(VariableValues));

    destroySymTab(VariableValues);
    VariableValues = NULL;
}

void __PRINT_TABLE()
{
    if (startIterator(VariableValues))
        do
        {
            char *Name = getCurrentName(VariableValues);
            SymTab *Table = (SymTab *)getCurrentAttr(VariableValues);

            printf("%s: {", Name);

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
        // Delete existing value from table
        destroySymTab((SymTab *)getCurrentAttr(VariableValues));
    else
        // Put the key in the table
        enterName(VariableValues, name);
    // Store provided table pointer as value
    setCurrentAttr(VariableValues, (void *)value);
}

SymTab *__INTERS(SymTab *a, SymTab *b)
{
    SymTab *Result = createSymTab(17);

    if (startIterator(a)) do
    {
        if (findName(b, getCurrentName(a)))
        {
            enterName(Result, getCurrentAttr(a));
            setCurrentAttr(Result, getCurrentAttr(a));
        }
    } while (nextEntry(a));

    return Result;
}

SymTab *__UNION(SymTab *a, SymTab *b)
{
    SymTab *Result = createSymTab(17);

    if (startIterator(a)) do
    {
        enterName(Result, getCurrentAttr(a));
        setCurrentAttr(Result, getCurrentAttr(a));
    } while (nextEntry(a));
    if (startIterator(b)) do
    {
        enterName(Result, getCurrentAttr(b));
        setCurrentAttr(Result, getCurrentAttr(b));
    } while (nextEntry(b));

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
            setCurrentAttr(Result, getCurrentAttr(ToDuplicate));
        } while (nextEntry(ToDuplicate));
    }

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
        enterName(Result, strndup(&c, 1));
        setCurrentAttr(Result, strndup(&c, 1));
    }

    return Result;
}