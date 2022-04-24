var x: Int;
fun fact(n: Int): Int {
    if (n <= 1) { return = 1; }
    else { return = n * fact(n-1); }
}

print("Enter an int: ", <x>);
print(fact(x), " = ", x, "!\n",
    2 * fact(2 * x), " = 2*(2*", x, ")!\n");