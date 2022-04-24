var rowSums: Int[5];
var colSums: Int[4];
var twoD: Int[5][4];
var i: Int;
var j: Int;
var k: Int;

print("Enter 20 ints: ");
for (var i: Int = 0; i < 5; i = i + 1) {
    for (var j: Int = 0; j < 4; j = j + 1) {
        read(k);
        twoD[i][j] = k;
    }
}

for (var i: Int = 0; i < 5; i = i + 1) {
    rowSums[i] = 0;
    for (var j: Int = 0; j < 4; j = j + 1) {
        rowSums[i] = rowSums[i] + twoD[i][j];
    }
}

for (var j: Int = 0; j < 4; j = j + 1) {
    for (var i: Int = 0; i < 5; i = i + 1) {
        colSums[j] = colSums[j] + twoD[i][j];
    }
}

for (var i: Int = 0; i < 5; i = i + 1) {
    print(rowSums[i], ":\t");
    for (var j: Int = 0; j < 4; j = j + 1) {
        print(twoD[i][j], "\t");
    }
    print("\n");
}

print("\t");
for (var j: Int = 0; j < 4; j = j + 1) {
    print(colSums[j], "\t");
}
print("\n");