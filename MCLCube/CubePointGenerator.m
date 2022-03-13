function [x,y,z] = CubePointGenerator(l)
theta = acos(1-2*rand);
phi = rand * pi * 2;
lInt = rand * l;
check = l/2;
x1 = lInt * cos(theta);
y1 = lInt * sin(theta) * cos(phi);
z1 = lInt * sin(theta) * sin(phi);

x2 = abs(x1);
y2 = abs(y1);
z2 = abs(z1);

while x2 > check | y2 > check | z2 > check
    theta = acos(1-2*rand);
    phi = rand * pi * 2;
    lInt = rand * l;
    x1 = lInt * cos(theta);
    y1 = lInt * sin(theta) * cos(phi);
    z1 = lInt * sin(theta) * sin(phi);
    x2 = abs(x1);
    y2 = abs(y1);
    z2 = abs(z1);
end
x = x1;
y = y1;
z = z1;

end
