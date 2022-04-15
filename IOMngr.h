#include <stdlib.h>
#include <stdio.h>

#define MAXLINE 1024

int init_io(char *source_name, char *listing_name);
void free_io();
char next_char();
void put_marker(int column);
void put_warning(char *message);
int line_num();
int col_num();
