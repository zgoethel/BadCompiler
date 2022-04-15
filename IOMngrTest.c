#include "IOMngr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int arg_c, char **arg_v)
{
	init_io("IOMngr.c", NULL);

	int i = 0;
	for (; next_char() != EOF; i++)
	{ }

	put_marker(0);
	put_warning("This is column 0");
	put_marker(1);
	put_warning("This is column 1");
	put_marker(2);
	put_warning("This is column 2");
	put_marker(3);
	put_warning("This is column 3");
	
	free_io();
	init_io("IOMngr.c", "IOMngr.txt");

	put_marker(0);
	put_warning("This is column 0");
	put_marker(1);
	put_warning("This is column 1");
	put_marker(2);
	put_warning("This is column 2");
	put_marker(3);
	put_warning("This is column 3");

	free_io();
}
