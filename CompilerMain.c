#include <stdio.h>

#include "SymTab.h"
#include "IOMngr.h"
#include "y.tab.h"

extern int yyparse();
extern void yylex_destroy();

FILE *aFile;
SymTab *table;
SymTab *stringLiterals;

int main(int argc, char * argv[])
{
	openFiles(argv[1], argv[2]);
    table = createSymTab(17);
    stringLiterals = createSymTab(17);

	if (argc == 4) 
		aFile = fopen(argv[3], "w");
	else
		aFile = stdout;

	if (startIterator(stringLiterals)) do
	{
		free(getCurrentAttr(stringLiterals));
	} while (nextEntry(stringLiterals));

	yyparse();
    destroySymTab(table);
    destroySymTab(stringLiterals);
    closeFiles();
    yylex_destroy();
}
