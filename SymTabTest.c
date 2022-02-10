#include "SymTab.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int arg_c, char **arg_v)
{
	printf("Create SymTab\n");
	SymTab *table = createSymTab(23);

	printf("Insert symbols into SymTab\n");
	enterName(table, "foo");
	setCurrentAttr(table, "A");
	enterName(table, "bar");
	setCurrentAttr(table, "B");
	enterName(table, "bin");
	setCurrentAttr(table, "C");
	enterName(table, "baz");
	setCurrentAttr(table, "D");

	printf("Retrieving individual symbols' attributes\n");
	findName(table, "foo");
	printf("%s\n", (char *)getCurrentAttr(table));
	findName(table, "bar");
	printf("%s\n", (char *)getCurrentAttr(table));
	findName(table, "bin");
	printf("%s\n", (char *)getCurrentAttr(table));
	findName(table, "baz");
	printf("%s\n", (char *)getCurrentAttr(table));

	printf("Using SymTab iterator\n");
	if (startIterator(table))
		do
		{
			printf("%s\n", (char *)getCurrentAttr(table));
		} while (nextEntry(table));

	printf("Destroy SymTab\n");
	destroySymTab(table);
}
