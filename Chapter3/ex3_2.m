% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.2
% MATLAB program to check the analytical result of fourier series coefficients 
%

N = 1000;
fs = 1000;
T = 1;
t = (1:N)/fs;
x = [t(1:N/2) zeros(1,N/2)];

plot(t,x);
for m = 1:4
    b = (2/N)*sum(x.*sin(2*pi*m*t));
    a = (2/N)*sum(x.*cos(2*pi*m*t));
    A = sqrt(a^2+b^2);
    phi = atan2(b,a)*360/(2*pi);
    disp([m a b A phi])
end

clear a b;
