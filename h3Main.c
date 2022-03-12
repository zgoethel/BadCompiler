#include <stdio.h>

#include "SymTab.h"
#include "IOMngr.h"
#include "h3Semantics.h"

extern int yyparse();

SymTab *table;

int main(int argc, char *argv[])
{
    __ALLOC_H3();
    table = createSymTab(17);

    if (!openFiles(argv[1], "listing"))
    {
        printf("open failed\n");
        exit(0);
    }

    yyparse();
    __FREE_H3();
}