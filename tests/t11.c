var numbers: Int[30];
var count: Int;
var i: Int;
var j: Int;
var temp: Int;

fun readNums(): Nothing {
    print("Enter the number of ints (30 or less) in the array: ", <count>);

    for (var i: Int = 0; i < count; i = i + 1) {
        var temp: Int;
        print("Enter an int: ", <temp>);
        numbers[i] = temp;
    }
}

fun sort(): Nothing {
    for (var i: Int = 0; i < count; i = i + 1) {
        var j: Int;
        var temp: Int = numbers[i];
        for (j = i - 1; j >= 0 && numbers[j] < temp; j = j - 1) {
            numbers[j+1] = numbers[j];
        }
        numbers[j+1] = temp;
    }
}

fun printNums(): Int {
    print("\n\n");
    for (var i: Int = 0; i < count; i = i + 1) {
        print(numbers[i], " ");
    }
    print("\n");
}

readNums();
sort();
printNums();