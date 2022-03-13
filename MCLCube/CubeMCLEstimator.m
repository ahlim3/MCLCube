function MCLCube = CubeMCLEstimator(n,L)

x0 = zeros(n,1);
y0 = zeros(n,1);
z0 = zeros(n,1);

u0 = zeros(n,1);
v0 = zeros(n,1);
w0 = zeros(n,1);

u1 = zeros(n,1);
v1 = zeros(n,1);
w1 = zeros(n,1);

L1 = zeros(n,1);
L2 = zeros(n,1);

x1 = zeros(n,1);
y1 = zeros(n,1);
z1 = zeros(n,1);

x2 = zeros(n,1);
y2 = zeros(n,1);
z2 = zeros(n,1);

chordLegnthMatrix = zeros(n,1);

SurfaceArea = L ^ 2 * 6;
Volume = L ^ 3;
AnalyticalSolution = Volume / SurfaceArea * 4

Rcomp = (((Volume / 4 * 3 / pi) ^ (1/3)) - L/2) / (L / 2);

for i = 1:n

    if rand > Rcomp

        [x0(i),y0(i),z0(i)] = CubePointGenerator2(L);
    
    else
        
        [x0(i),y0(i),z0(i)] = CubePointGenerator(L);
    
    end

    [u0(i),v0(i),w0(i)] = UnitVectorGenerator;
    [u1(i),v1(i),w1(i)] = UnitVectorGenerator;


    [L1(i)] = distanceEstimator(x0(i),y0(i),z0(i),u0(i),v0(i),w0(i),L);
    [L2(i)] = distanceEstimator(x0(i),y0(i),z0(i),u1(i), v1(i), w1(i), L);

    x1(i) = L1(i) * u0(i) + x0(i);
    y1(i) = L1(i) * v0(i) + y0(i);
    z1(i) = L1(i) * w0(i) + z0(i);

    x2(i) = L2(i) * u1(i) + x0(i);
    y2(i) = L2(i) * v1(i) + y0(i);
    z2(i) = L2(i) * w1(i) + z0(i);

    chordLegnthMatrix(i) = sqrt((x1(i) - x2(i))^2 + (y1(i) - y2(i))^2 + (z1(i) - z2(i))^2);

end
figure(1)
plot3( x1,y1,z1, '.', x2,y2,z2, 'o')
xlabel('x')
ylabel('y')
zlabel('z')

figure(2)
plot3(x0,y0,z0,'.')

MCLCube = mean(chordLegnthMatrix)

figure(3)
histogram(chordLegnthMatrix)
end
