Compiler for a C-like language which generates MIPS Assembly.  Written in C and using the tools Flex and Bison.  Offers minimal validation, essentially no error handling, and very few features.  This source stems from a course assignment with extra work put in.

Includes
 - Arithmatic ops
   ```kt
   /* Evaluates the expression with precedence/associativity */
   var i: Int = 3 * (2 + 8) % 20 ^ 2;
   ```
 - For loops
   ```kt
   /* Creates a scoped variable named `i` */
   for (var i: Int = 0; i < 100; i = i + 1)
   {
       print("Half of ", i, " is ", i / 2, "\n");
   }
   ```
 - While loops
   ```kt
   /* Loops infinitely and accepts user number input */
   while (1)
   {
       var input: Int;
       print("Enter a new value: ", <input>);
   }
   ```
 - Logical branches
   ```kt
   /* Accepts a number if it is at most 100 */
   var input: Int;
   print("Enter a new value: ", <input>);
   
   if (input > 100)
   {
       print("Input ", input, " is too high!\n");
   } else
   {
       print("That input is valid.\n");
   }
   ```
 - Integers
   ```kt
   var i: Int = 3;
   ```
 - Integer arrays
   ```kt
   var arr: Int[4];
   arr[0] = 1;
   arr[1] = 2;
   arr[2] = 3;
   arr[3] = 4;
   ```
 - Pass integer by value
   ```kt
   /* Accepts a value and returns the value plus one */
   fun do_thing(arg: Int): Integer
   {
       return = arg + 1;
   }
   ```
 - Pass integer by reference
   ```kt
   /* Increments the integer pointed to by `arg` */
   fun do_thing(arg: Ref<Int>): Nothing
   {
       *arg = *arg + 1;
   }
   ```
 - Pass array by value
   ```kt
   /* Accepts an array by value */
   fun do_thing(arg: Int[4]): Nothing
   {
       arg[0] = 20;
       /* Prints the value 20 */
       print(arg[0]);
   }
   
   var arr: Int[4];
   arr[0] = 1;
   do_thing(arr);
   /* Prints the value 1 */
   print(arg[0]);
   ```
 - Pass array by references
   ```kt
   /* Accepts an array by reference */
   fun do_thing(arg: Ref<Int[1]>): Nothing
   {
       *arg[0] = 20;
       /* Prints the value 20 */
       print(*arg[0]);
   }
   
   var arr: Int[4];
   arr[0] = 1;
   do_thing(&arr);
   /* Prints the value 20 */
   print(arg[0]);
   ```
 
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
