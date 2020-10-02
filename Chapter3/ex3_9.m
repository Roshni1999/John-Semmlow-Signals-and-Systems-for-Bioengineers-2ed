% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Ex3_9 Program to check solution in Ex3_9

N = 7;
x = [0 1 .5 0 -.5 -1 0];
X = (fft(x));
for m = 1:6
    X1(m) = 2*1j*sin(4*pi*m/7) + 1j*sin(2*pi*m/7);
end
      
disp(abs(X))
disp(abs(X1))


