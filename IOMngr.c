#include "IOMngr.h"

char READ_BUFFER[MAXLINE];
size_t bufferSize = 0;
size_t remainingBuffer = 0;

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
    printf("Opening source file '%s' with listing at '%s'\n",
        sourceName,
        listingName == NULL ? "standard out" : listingName);

    handleSource = fopen(sourceName, "r");
    if (handleSource == 0) return 0;

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
    fclose(handleSource);
    handleSource = 0;

    if (handleListing != 0)
        fclose(handleListing);
    handleListing = 0;
}

/**
 * Retrieves the next character from the source file. If no files are buffered
 * for reading, more bytes are read from file. Echoes the read characters into
 * any listing file specified.
 *
 * @return Read character, or null-character at end of file.
 */
char getNextSourceChar()
{
    if (remainingBuffer == 0)
    {
        printf("Buffer is empty, replenishing from disk\n");

        bufferSize = fread(READ_BUFFER, sizeof(char), MAXLINE, handleSource);
        //if (bufferSize < 0)
        //    ERROR!
        if (bufferSize == 0)
            return 0;

        printf("Loaded %d bytes from file!\n", bufferSize);
        remainingBuffer = bufferSize;
    }

    return READ_BUFFER[bufferSize - (remainingBuffer--)];
}

/**
 *
 */
void writeIndicator(int column)
{

}

/**
 *
 */
void writeMessage(char *message)
{

}

/**
 *
 */
int getCurrentLineNum()
{

}

/**
 *
 */
int getCurrentColumnNum()
{

}
