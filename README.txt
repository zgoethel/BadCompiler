The demo test cases are under the "tests" directory. All 18 successfully
compiled and execute with the same output as when written in C. There were no
provided test case for a "test 5" nor "10."

Additional features I included:
===
 - Array pass-by-value for n-dimensional arrays
   [ Test case found at "tests/test10.txt" ]
 - Integer pass-by-reference
   [ Test case found at "tests/test12.txt" ]
 - 2D/3D/theoretically higher-dimensional arrays
   [ Test case found at "tests/test3.txt" ]
 - A composable print function to accept a list of expressions, also allowing
   reading into variables all in one command
   [ Test case found at end of "tests/test2.txt" ]
 - For-loops (which I included in many of the provided test cases)
   [ Test case found at "tests/test8.txt" ]
 - Declarations which also set an initial value
   [ Used in essentially every test case ]
 - Declarations in the middle statement sequences
   [ Also used in essentially every test case]
 - A stack of scopes and the ability to define variables within logical
   structures (i.e., for-loops, if-statements, etc.)
   [ Also used in essentially every test case]