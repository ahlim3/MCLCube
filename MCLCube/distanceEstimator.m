function d = distanceEstimator(x,y,z,u,v,w,L)
    LL = -L/2;
    LU = L/2;
    xl = -(x - LL);
    xu = LU - x;
    yl = -(y - LL);
    yu = LU - y;
    zl = -(z - LL);
    zu = LU - z;

    dcomp = zeros(6,1);
    dcomp(1) = xl / u;
    dcomp(2) = xu / u;
    dcomp(3) = yl / v;
    dcomp(4) = yu / v;
    dcomp(5) = zl / w;
    dcomp(6) = zu / w;

    for n = 1 : 6
        if dcomp(n) < 0
            dcomp(n) = NaN;
        end
    end
    [d, ~] = min(dcomp);
end