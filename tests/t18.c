var x: Int = 1;
var y: Int = 0;
var z: Int = x && y;

print(z, " =  x && y\n");
z = x || y;
print(z, " =  x || y\n");
z = !x;
print(z, " =  !x\n");
z = !(x && y);
print(z, " =  !(x && y)\n");
z = !x || !y;
print(z, " =  !x || !y\n");
z = !!x;
print(z, " =  !!x\n");