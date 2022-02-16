#include "IOMngr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int arg_c, char **arg_v)
{
	openFiles("IOMngr.c", NULL);

	int i = 0;
	for (; getNextSourceChar() != EOF; i++)
	{ }

	writeIndicator(0);
	writeMessage("This is column 0");
	writeIndicator(1);
	writeMessage("This is column 1");
	writeIndicator(2);
	writeMessage("This is column 2");
	writeIndicator(3);
	writeMessage("This is column 3");
	
	closeFiles();
	openFiles("IOMngr.c", "IOMngr.txt");

	writeIndicator(0);
	writeMessage("This is column 0");
	writeIndicator(1);
	writeMessage("This is column 1");
	writeIndicator(2);
	writeMessage("This is column 2");
	writeIndicator(3);
	writeMessage("This is column 3");

	closeFiles();
}
