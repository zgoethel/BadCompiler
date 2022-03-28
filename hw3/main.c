#include <stdio.h>

#include "SymTab.h"
#include "IOMngr.h"
#include "semantics.h"

extern int yyparse();
extern void yylex_destroy();

int main(int argc, char *argv[])
{
    __ALLOC_H3();

    if (!openFiles(argv[1], "listing"))
    {
        printf("open failed\n");
        exit(0);
    }

    yyparse();
    closeFiles();
    __FREE_H3();
    yylex_destroy();

    return 0;
}