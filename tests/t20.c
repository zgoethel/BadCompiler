fun readArray(n: Ref<Int[5][4]>): Nothing {
    print("Enter 20 ints: ");
    for (var i: Int = 0; i < 5; i = i + 1) {
        for (var j: Int = 0; j < 4; j = j + 1) {
            var k: Int;
            read(k);
            *n[i][j] = k;
        }
    }
}

fun calcRowSums(r: Ref<Int[1]>, n: Ref<Int[5][4]>): Nothing {
    for (var i: Int = 0; i < 5; i = i + 1) {
        *r[i] = 0;
        for (var j: Int = 0; j < 4; j = j + 1) {
            *r[i] = *r[i] + *n[i][j];
        }
    }
}

fun calcColSums(c: Ref<Int[1]>, n: Ref<Int[5][4]>): Nothing {
    for (var j: Int = 0; j < 4; j = j + 1) {
        for (var i: Int = 0; i < 5; i = i + 1) {
            *c[j] = *c[j] + *n[i][j];
        }
    }
}

fun printSums(r: Ref<Int[1]>, c: Ref<Int[1]>, n: Ref<Int[5][4]>): Nothing {
    for (var i: Int = 0; i < 5; i = i + 1) {
        print(*r[i], ":\t");
        for (var j: Int = 0; j < 4; j = j + 1) {
            print(*n[i][j], "\t");
        }
        print("\n");
    }
    
    print("\t");
    for (var j: Int = 0; j < 4; j = j + 1) {
        print(*c[j], "\t");
    }
    print("\n");
}

var rowSums: Int[5];
var colSums: Int[4];
var twoD: Int[5][4];
var i: Int;
var j: Int;
var k: Int;

readArray(&twoD);


calcRowSums(&rowSums, &twoD);

calcColSums(&colSums, &twoD);

printSums(&rowSums, &colSums, &twoD);