Compiler for a C-like language which generates MIPS Assembly.  Written in C; minimal validation, error handling, and very few features.

Includes
 - Arithmatic ops
 - For loops
 - While loops
 - Logical branches
 - Integers
 - Integer arrays
 - Pass integer by value
 - Pass integer by reference
 - Pass array by value
 - Pass array by references
 
 Here is some example syntax of input source.  This is a merge sort written in a C- and Kotlin-like syntax.
 
 ```kt
/* Generates a reverse-order array */
var array: Int[16];
var aux: Int[16];
for (var i: Int = 0; i < 16; i = i + 1)
{
    array[i] = 15 - i;
}

/* Recursive merge sort */
fun merge(array: Ref<Int[1]>, aux: Ref<Int[1]>, start: Int, mid: Int, end: Int): Nothing
{
    if (end - start > 2)
    {
        merge(array, aux, start, (start + mid) / 2, mid);
        merge(array, aux, mid, (mid + end) / 2, end);
    }

    var i: Int = start;
    var j: Int = mid;
    var k: Int = start;

    for (k = k; i < mid && j < end; k = k + 1)
    {
        if (*array[i] < *array[j])
        {
            *aux[k] = *array[i];
            i = i + 1;
        } else
        {
            *aux[k] = *array[j];
            j = j + 1;
        }
    }

    for (i = i; i < mid; i = i + 1) { *aux[k] = *array[i]; k = k + 1; }
    for (j = j; j < end; j = j + 1) { *aux[k] = *array[j]; k = k + 1; }

    for (k = start; k < end; k = k + 1)
    {
        *array[k] = *aux[k];
    }
}

/* Sort the array and print values */
merge(&array, &aux, 0, 8, 16);
for (var i: Int = 0; i < 16; i = i + 1)
{
    print("array[", i, "] -> ", array[i], "\n");
}
 ```
