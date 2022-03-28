#include "IOMngr.h"

#include <string.h>

#include "ANSIColors.h"

// Buffer and buffer state
char READ_BUFFER[MAXLINE];
size_t bufferSize = 0;
size_t remainingBuffer = 0;
// Read position state
unsigned int _row = -1;
unsigned int _column = 0;

// File handle reference state
FILE *handleSource = 0;
FILE *handleListing = 0;

/**
 * Finds and opens the provided file by name. If a listing file is specified, it
 * will be used for listing entries.
 *
 * @param sourceName Source file for which to open file handle.
 * @param listingName Output listing file name; NULL for stdout.
 * @return 1 on file open success; 0 on file open failure.
 */
int openFiles(char *sourceName, char *listingName)
{
    // Open source file always
    handleSource = fopen(sourceName, "r");
    if (handleSource == 0) return 0;
    // Open listing if necessary
    if (listingName != NULL)
    {
        handleListing = fopen(listingName, "w");
        if (handleListing == 0) return 0;
    }

    return 1;
}

/**
 * Closes the file handles which are currently open for writing.
 */
void closeFiles()
{
    // Close source file always
    fclose(handleSource);
    handleSource = 0;

    // Close listing if present
    if (handleListing != 0)
        fclose(handleListing);
    handleListing = 0;
}

/**
 * Retrieves the next character from the source file. If no files are buffered
 * for reading, more bytes are read from file. Echoes the read characters into
 * any listing file specified.
 *
 * @return Read character, or `EOF` (-1) at end of file.
 */
char getNextSourceChar()
{
    // Load a new line when necessary
    if (remainingBuffer == 0)
    {
        // Adapted from using `fread`
        char *r = fgets(READ_BUFFER, MAXLINE, handleSource);
        bufferSize = strlen(READ_BUFFER);
        // Error/`EOF` input check
        if (r == NULL)
        {
            if (feof(handleSource) == 0)
                perror("Failed to read from source file");
            
            return EOF;
        }
        remainingBuffer = bufferSize;
        // Update status row/column counters
        _row++;
        _column = 0;

        // Print to listing file or out
        const char *format = "%s%-4d%s %s";
        if (handleListing == NULL)
            printf(format, CYAN, _row + 1, RESET, READ_BUFFER);
        else
            fprintf(handleListing, format, "", _row + 1, "", READ_BUFFER);
    }

    // Grab the current character
    char c = READ_BUFFER[bufferSize - (remainingBuffer--)];
    // Update the status column counter
    _column++;

    switch (c)
    {
        case '\t':
            c = ' ';
            break;
    }

    return c;
}

/**
 * Writes an indicator on a new line.
 *
 * @param column Zero-indexed column to indicate.
 */
void writeIndicator(int column)
{
    const char *format = "   %0*s-^-\n";
    if (handleListing == NULL)
    {
        printf(YELLOW);
        printf(format, column + 1, " ");
        printf(RESET);
    } else
        fprintf(handleListing, format, column + 1, " ");
}

/**
 * @param message Message to print to listing file.
 */
void writeMessage(char *message)
{
    if (message == NULL)
    {
        if (handleListing == NULL)
        {
            printf("\n");
        } else
            fprintf(handleListing, "\n");
        return;
    }

    const char *format = "Msg: '%s'\n";
    if (handleListing == NULL)
    {
        printf(YELLOW);
        printf(format, message);
        printf(RESET);
    } else
        fprintf(handleListing, format, message);
}

/**
 * @return Zero-indexed row number being read.
 */
int getCurrentLineNum()
{
    return _row;
}

/**
 * @return Zero-indexed column number being read.
 */
int getCurrentColumnNum()
{
    return _column;
}
