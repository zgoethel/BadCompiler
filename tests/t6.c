var low: Int;
var mid: Int;
var high: Int;
var temp: Int;
var count: Int;

print("Enter the number of triples to be processed: ", <count>);

for (count = count; count > 0; count = count - 1) {
    print("Enter three integers: ", <low>, <mid>, <high>);
    if (low > mid) {
        temp = low;
        low = mid;
        mid = temp;
    }
    if (low > high) {
        temp = low;
        low = high;
        high = temp;
    }
    if (mid > high) {
        temp = mid;
        mid = high;
        high = temp;
    }
    print(low, " ", mid, " ", high, "\n");
}