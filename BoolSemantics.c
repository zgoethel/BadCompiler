#include <stdio.h>
#include <stdlib.h>

#include "SymTab.h"
#include "BoolSemantics.h"
#include "IOMngr.h"

extern SymTab *table;

void printSymTab()
{
    int hasMore = startIterator(table);
    printf("%20s\t%10s\n", "Variable", "Value");
    
    while (hasMore)
    {
        printf("%20s\t%10s\n",getCurrentName(table),
        getCurrentAttr(table) ? "true" : "false");
        hasMore = nextEntry(table);
    }
}

void storeVar(char * name, bool v)
{
    enterName(table, name);
    setCurrentAttr(table, (void *) v);
}

bool getVal(char * name)
{
    if (enterName(table, name))
    {
        writeIndicator(getCurrentColumnNum());
        writeMessage("Initialize variable to false");
        setCurrentAttr(table, (void *)false);
    }

    return (bool)getCurrentAttr(table);
}

bool doOR(bool v1, bool v2)
{
    return v1 || v2;
}
bool doAND(bool v1, bool v2)
{
    return v1 && v2;
}
bool doNOT(bool v1)
{
    return !v1;
}