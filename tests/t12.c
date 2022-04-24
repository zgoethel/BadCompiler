var n: Int;
var x: Int;

fun fact(): Int {
    if (n <= 1) { return = 1; }
    else {
        n = n - 1;
        return = (n+1) * fact();
    }
}

print("Enter an int: ", <n>);
x = n;
print(fact(), " = ", x, "!\n");