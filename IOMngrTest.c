#include "IOMngr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int arg_c, char **arg_v)
{
	printf("Open source file 'IOMngr.c'\n");
	openFiles("IOMngr.c", NULL);
	printf("Printing first 50 characters\n");

	int i = 0;
	for (; i < 50; i++)
	{
		char c = getNextSourceChar();
		printf("%c", c);
	}

	printf("\n");

	printf("Reading file to completion\n");

	for (; getNextSourceChar(); i++)
	{ }
	printf("File contained %d characters total\n", i);

	printf("Closing file handles\n");
	closeFiles();
}
