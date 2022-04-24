var numbers: Int[30];

fun readNums(nums: Ref<Int[1]>): Int {
    var count: Int;
    read(count);

    for (var i: Int = 0; i < count; i = i + 1) {
        var temp: Int;
        read(temp);
        *nums[i] = temp;
    }

    return = count;
}

fun sort(nums: Ref<Int[1]>, size: Int): Nothing {
    for (var i: Int = 1; i < size; i = i + 1) {
        var j: Int;
        var temp: Int = *nums[i];
        for (j = i - 1; j >= 0 && *nums[j] < temp; j = j - 1) {
            *nums[j+1] = *nums[j];
        }
        *nums[j+1] = temp;
    }
}

fun printNums(nums: Ref<Int[1]>, size: Int): Nothing {
    print("\n\n");
    for (var i: Int = 0; i < size; i = i + 1) {
        print(*nums[i], " ");
    }
    print("\n");
}

var count: Int;
count = readNums(&numbers);
sort(&numbers,count);
printNums(&numbers,count);
