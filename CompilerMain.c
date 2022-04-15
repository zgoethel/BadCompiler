#include <stdio.h>

#include "SymTab.h"
#include "IOMngr.h"
#include "y.tab.h"

extern int yyparse();
extern void yylex_destroy();

FILE *codegen_file;
SymTab *table;
SymTab *str_lits;

int main(int argc, char * argv[])
{
	init_io(argv[1], argv[2]);
    table = create_tab(17);
    str_lits = create_tab(17);

	if (argc == 4) 
		codegen_file = fopen(argv[3], "w");
	else
		codegen_file = stdout;

	if (start_it(str_lits)) do
	{
		free(get_attr(str_lits));
	} while (it_next(str_lits));

	yyparse();
    free_tab(table);
    free_tab(str_lits);
    free_io();
    yylex_destroy();
}
