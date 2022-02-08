function [x0, y0, z0, x1, y1, z1, l] = CubeGenerator(L)

%Condition for starting point on one side
x0 = - L / 2;
y0 = (rand - 0.5) * L;
z0 = (rand - 0.5) * L;
phi = rand * pi * 2;
theta = acos(1-2*rand);

%Restriction due 
while theta > pi/2
    theta = acos(1-2*rand);
end


chordArray = [];
chordArray(end+1) = L / cos(theta);
chordArray(end+1) = (L/2 - y0) / (sin(theta) * cos(phi));
chordArray(end+1) = (-L/2 - y0) / (sin(theta) * cos(phi));
chordArray(end+1) = (L/2 - z0) / (sin(theta) * sin(phi));
chordArray(end+1) = (-L / 2 - z0) / (sin(theta) * sin(phi));

[l, Case_number] = min(abs(chordArray));


if Case_number == 1
    x1 = L/2;
    y1 = y0 + l * sin(theta) * cos(phi);
    z1 = z0 + l * sin(theta) * sin(phi);
elseif Case_number == 2
    x1 = x0 + cos(theta) * l;
    y1 = L/2;
    z1 = z0 + l * sin(theta) * sin(phi);
elseif Case_number == 3
    x1 = x0 + cos(theta) * l;
    y1 = -L/2;
    z1 = z0 + l * sin(theta) * sin(phi);
elseif Case_number == 4
    x1 = x0 + cos(theta) * l;
    y1 = y0 + l * sin(theta) * cos(phi);
    z1 = L/2;
else
    x1 = x0 + cos(theta) * l;
    y1 = y0 + l * sin(theta) * cos(phi);
    z1 = -L/2;
end
end
