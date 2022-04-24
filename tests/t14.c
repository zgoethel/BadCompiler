fun fib(n: Int): Int {
    if (n <= 1) { return = 1; }
    else { return = fib(n-2) + fib(n-1); }
}

var x: Int;
print("Enter an int: ", <x>);
print(fib(x), " = ", x, "th Fibonacci number\n",
    fib(2 * x), " = ", 2 * x, "th Fibonacci number\n");