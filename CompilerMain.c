#include <stdio.h>

#include "SymTab.h"
#include "IOMngr.h"
#include "y.tab.h"

extern int yyparse();
extern void yylex_destroy();

FILE *aFile;
SymTab *table;

int main(int argc, char * argv[])
{
	openFiles(argv[1], argv[2]);
    table = createSymTab(17);

	if (argc == 4) 
		aFile = fopen(argv[3], "w");
	else
		aFile = stdout;

	yyparse();
    destroySymTab(table);
    closeFiles();
    yylex_destroy();
}
