#include "SymTab.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int arg_c, char **arg_v)
{
	printf("Create SymTab\n");
	SymTab *table = create_tab(23);

	printf("Insert symbols into SymTab\n");
	enter_name(table, "foo");
	set_attr(table, "A");
	enter_name(table, "bar");
	set_attr(table, "B");
	enter_name(table, "bin");
	set_attr(table, "C");
	enter_name(table, "baz");
	set_attr(table, "D");

	printf("Retrieving individual symbols' attributes\n");
	find_name(table, "foo");
	printf("%s\n", (char *)get_attr(table));
	find_name(table, "bar");
	printf("%s\n", (char *)get_attr(table));
	find_name(table, "bin");
	printf("%s\n", (char *)get_attr(table));
	find_name(table, "baz");
	printf("%s\n", (char *)get_attr(table));

	printf("Using SymTab iterator\n");
	if (start_it(table))
		do
		{
			printf("%s\n", (char *)get_attr(table));
		} while (it_next(table));

	printf("Destroy SymTab\n");
	free_tab(table);
}
