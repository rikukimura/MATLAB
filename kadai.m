function dotq = kadai(t,q)
p=10;
r = 28;
b = 8/3;

x = q(1);
y = q(2);
z = q(3);
dotx = -p*(x-y);
doty = -x*z + r*x -y;
dotz = x*y - b*z;
dotq = [dotx; doty; dotz]
end