function [u,v,w,theta,phi] = UnitVectorGenerator
theta = acos(1-2*rand);
phi = rand * pi * 2;
u = cos(theta);
v = sin(theta) * cos(phi);
w = sin(theta) * sin(phi);
end

