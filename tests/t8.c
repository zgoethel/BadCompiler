var numbers: Int[30];
var count: Int;

print("Enter the number of ints (30 or less) in the array: ", <count>);

for (var i: Int = 0; i < count; i = i + 1) {
	var temp: Int;
	print("Enter an int: ", <temp>);
	numbers[i] = temp;
}

print("\n\n");
for (var i: Int = 0; i < count; i = i + 1) {
	print(numbers[i], " ");
}
print("\n");