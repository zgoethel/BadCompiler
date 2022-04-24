var numbers: Int[30];

fun readNums(nums: Ref<Int[1]>): Int {
    var count: Int;
    print("Enter the number of ints (30 or less) in the array: ", <count>);
    
    for (var i: Int = 0; i < count; i = i + 1) {
        var temp: Int;
        print("Enter an int: ", <temp>);
        *nums[i] = temp;
    }

    return = count;
}

fun swap(nums: Ref<Int[1]>, i: Int, j: Int): Nothing {
    var temp: Int = *nums[i];
    *nums[i] = *nums[j];
    *nums[j] = temp;
}

fun medianOf3(nums: Ref<Int[1]>, left: Int, right: Int): Int {
    var center: Int = (right+left)/2;
    if (*nums[left] > *nums[center]) {
        swap(nums, left, center);
    }
    if (*nums[center] > *nums[right]) {
        swap(nums, center, right);
    }
    if (*nums[left] > *nums[center]) {
        swap(nums, left, center);
    }
    swap(nums, center, right-1);
    return = *nums[right-1];
}

fun partition(nums: Ref<Int[1]>, left: Int, right: Int): Nothing {
    var pivot: Int = medianOf3(nums, left, right);
    var i: Int = left;
    var j: Int = right-1;
    while (i < j) {
        i = i+1;
        while (*nums[i] < pivot) {
            i = i+1;
        }
        j = j-1;
        while (*nums[j] > pivot) {
            j = j-1;
        }
        if (i < j) {
            swap(nums, i, j);
        }
    }
    swap(nums, i, right-1);
    return = i;
}

fun quicksort(nums: Ref<Int[1]>, left: Int, right: Int): Nothing {
    if (left+2 <= right) {
        var i: Int = partition(nums, left, right);
        quicksort(nums, left, i-1);
        quicksort(nums, i+1, right);
    }
}

fun insertionSort(nums: Ref<Int[1]>, size: Int): Nothing {
    for (var i: Int = 1; i < size; i = i + 1) {
        var j: Int;
        var temp: Int = *nums[i];
        for (j = i - 1; j >= 0 && *nums[j] < temp; j = j - 1) {
            *nums[j+1] = *nums[j];
        }
        *nums[j+1] = temp;
    }
}

fun quicksortStart(nums: Ref<Int[1]>, size: Int): Nothing {
    quicksort(nums, 0, size-1);
    insertionSort(nums, size);
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
quicksortStart(&numbers,count);
printNums(&numbers,count);