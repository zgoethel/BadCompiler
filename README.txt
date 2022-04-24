The demo test cases are under the "tests" directory. All 18 successfully
compiled and executed with the same output as when written in C. There were no
provided test case for a "test 5" nor "10."

Personal test cases, assemblies, and runtime results are in the "asm" folder.

Additional features I included [and test cases which use them]:
===
 - Array pass-by-value for n-dimensional arrays
   [ Test case found at "asm/test10.txt" ]
   [ Used for merge sort bounds in "asm/test9.txt" ]

 - Integer pass-by-reference
   [ Test case found at "asm/test12.txt" ]

 - 2D/3D/theoretically higher-dimensional arrays
   [ Test case found at "asm/test3.txt" ]

 - A composable print function to accept a list of expressions, also allowing
   reading into variables all in one command
   [ Example usage found at end of "asm/test2.txt" ]

 - For-loops (which I included in many of the provided test cases)
   [ Several used in merge sort at "asm/test8.txt" ]

 - Declarations which also set an initial value
   [ Used in essentially every test case ]

 - Declarations in the middle statement sequences
   [ Also used in essentially every test case ]

 - A stack of scopes and the ability to define variables within logical
   structures (i.e., for-loops, if-statements, etc.)
   [ Also used in essentially every test case ]