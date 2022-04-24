var start: Int;
var end: Int;
var inc: Int;
var current: Int;
var c: Int;
var k: Int;

print("Enter three integers: Starting temp, ending temp and a positive increment: ",
    <start>, <end>, <inc>);

for (current = start; current <= end; current = current + inc) {
    c = (current - 32) * 5/9;
    k = (current + 460) * 5/9;
    print(current, " ", c, " ", k, "\n");
}