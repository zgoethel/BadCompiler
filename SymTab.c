#include "SymTab.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Allocates the space for a symbol table and its inital
 * member structures.
 *
 * @param size Estimated size of the resulting table.
 */
SymTab *create_tab(int size)
{
	// Allocate the data structure
	SymTab *result = (SymTab *)malloc(sizeof(SymTab));
	// Initialize internal values and buffers
	result->size = size;
	result->contents = (SymEntry **)malloc(sizeof(SymEntry *) * size);
	int i = 0;
	for (; i < size; i++) result->contents[i] = NULL;
	result->current = NULL;

	return result;
}

/**
 * Performs a deep deletion of the provided table.
 */
void free_tab(SymTab *table)
{
	// Iterate and destroy all chains
	unsigned int i = 0;
	for (; i < table->size; i++)
	{
		// Delete all nodes in each chain
		SymEntry *temp = table->contents[i];
		while (temp != NULL)
		{
			SymEntry *maintainRef = temp;
			temp = temp->next;

			free(maintainRef->name);
			free(maintainRef);
		}
	}

	// Free main buffers
	free(table->contents);
	free(table);
}

// Utility for naive hashing of strings (collisions are accepta-
// ble)
unsigned long quickStringHash(char *data)
{
	unsigned long hash = (unsigned long)0;
	int i = 0, length = strlen(data);
	for (; i < length; i++)
	{
		hash = ((hash << 5) + hash) + data[i];
	}

	return hash;
}

/**
 * Inserts a new named node in the table and makes it current.
 * If the name is already in the table, its corresponding
 * node will become the current node.
 *
 * @param name Name of the node to find or create.
 * @return 1 if a node was created, 0 if it was found.
 */
int enter_name(SymTab *table, char *name)
{
	// Get the correct chain for the name
	int hash = quickStringHash(name) % table->size;
	SymEntry *chain = table->contents[hash];

	// Check that the node doesn't already exist
	for (; chain != NULL; chain = chain->next)
		if (strcmp(chain->name, name) == 0)
		{
			table->current = chain;

			return 0;
		}

	// Create and insert a new node
	SymEntry *node = (SymEntry *)malloc(sizeof(SymEntry));
	node->name = strdup(name);
	node->attribute = NULL;
	node->next = table->contents[hash];
	// Link the new node at the start of the chain
	table->contents[hash] = node;
	table->current = node;

	return 1;
}

/**
 * Finds the name in the symbol table, making its corresp-
 * onding node current.
 *
 * @param name Name of the node to find in the table.
 * @return 1 if found, 0 if not found.
 */
int find_name(SymTab *table, char *name)
{
	// Get the correct chain for the name
	int hash = quickStringHash(name) % table->size;
	SymEntry *chain = table->contents[hash];

	for (;;)
	{
		// Check if each node matches
		if (chain != NULL && strcmp(chain->name, name) == 0)
		{
			table->current = chain;
			return 1;
		}

		// Fail search at end of chain
		if (chain == NULL || chain->next == NULL)
			return 0;
		chain = chain->next;
	}
}

/**
 * @return Whether the specified table has a current node.
 */
int hasCurrent(SymTab *table)
{
	return table->current != NULL;
}

/**
 * Changes the pointer value assigned to the current node.
 *
 * @param attr Any pointer to associate with the current
 *     node. Memory allocation is managed externally.
 */
void set_attr(SymTab *table, void *attr)
{
	table->current->attribute = attr;
}

/**
 * @return Pointer value of the table's current node.
 */
void *get_attr(SymTab *table)
{
	return table->current->attribute;
}

/**
 * @return Name associated with the table's current node.
 */
char *get_name(SymTab *table)
{
	return table->current->name;
}

/**
 * Returns current node to the table's "first" node.
 *
 * @return 1 if nodes remain, 0 if the table is empty.
 */
int start_it(SymTab *table)
{
	// Reset the chain row counter to 0 (first chain)
	//_itRow = 0;
	int _itRow = 0;
	// Iterate until a chain has elements
	for (; _itRow < table->size; _itRow++)
	// Start iterating on one of the chains
	if (table->contents[_itRow] != NULL)
	{
		table->current = table->contents[_itRow];

		return 1;
	}

	return 0;
}

/**
 * Resumes to the "next" node in the table after the current.
 *
 * @return 1 if nodes remain, 0 if the table is empty.
 */
int it_next(SymTab *table)
{
	// Advance to next pointer if applicable
	if (table->current->next != NULL)
	{
		table->current = table->current->next;

		return 1;
	}

	int _itRow = quickStringHash(table->current->name) % table->size;

	// Increment iterator row count
	_itRow++;
	// Find the next chain with values in it
	for (; _itRow < table->size; _itRow++)
		if (table->contents[_itRow] != NULL)
		{
			table->current = table->contents[_itRow];

			return 1;
		}

	return 0;
}
