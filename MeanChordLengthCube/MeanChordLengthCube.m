function MeanChordLengthCube (n, CubeLength)
SurfaceArea = CubeLength ^ 2 * 6;
Volume = CubeLength ^ 3;
AnalyticalSolution = Volume / SurfaceArea * 4
binnumber = int16(sqrt(Volume) + 1);

x0Array = [];
y0Array = [];
z0Array = [];
x1Array = [];
y1Array = [];
z1Array = [];
MCLArray = [];

for i = 1 : n
    [x0, y0, z0, x1, y1, z1, l] = CubeGenerator(CubeLength);
    x1Array(end + 1) = x1;
    y1Array(end + 1) = y1;
    z1Array(end + 1) = z1;
    x0Array(end + 1) = x0;
    y0Array(end + 1) = y0;
    z0Array(end + 1) = z0;
    MCLArray(end + 1 ) = 2 * l;

end
mu = mean(MCLArray)
sigma = std(MCLArray)
a = histogram(MCLArray,binnumber)
q = a.Values;
HistMax = max(q);

figure(1)
histogram(MCLArray,binnumber)
grid on;
xlabel('Chord Length(cm)', 'FontSize', 15);
ylabel('Count', 'FontSize', 15);
xline(mu, 'color', 'g', "LineWidth", 2);
xline(mu - sigma, 'color', 'r', 'LineWidth', 2, 'LineStyle', '--');
xline(mu + sigma, 'color', 'r', 'LineWidth', 2, 'LineStyle', '--');
ylim([0, HistMax * 1.2]); % Give some headroom above the bars.
yl = ylim;
sMean = sprintf('  Mean = %.3f cm \n   SD = %.3f cm \n A.Sol. = %.3f cm', mu, sigma, AnalyticalSolution);
text(binnumber * 0.5, 0.9*yl(2), sMean, 'Color', 'r','FontWeight', 'bold', 'FontSize', 12, 'EdgeColor', 'b');
sMean2= sprintf('Frequency vs Chordlength (cm). N = %.0f trials  Mean = %.3f. cm  SD = %.3f cm A.Sol. = %.3f cm', n, mu, sigma, AnalyticalSolution);
title(sMean2, 'FontSize', 15);

figure(2)
plot3(x0Array, y0Array, z0Array, '.', x1Array,y1Array,z1Array,'.')
title('Point Distribution')
xlabel('x cord')
ylabel('y coord')
zlabel('z coord')

end
