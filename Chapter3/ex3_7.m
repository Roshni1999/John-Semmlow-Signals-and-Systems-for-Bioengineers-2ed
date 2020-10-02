% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.7 Program to check the analytical solution in Ex 3.7

N=1000;
fs = 1000;
t = (1:N)/fs;
x = exp(2.4*t) -1;
plot(t,x);
xlabel('Time (sec)','FontSize',12); 
ylabel('x(t)','FontSize',12);

X = fft(x)/N;
disp(X(1:4))
for m = 1:3
    X1(m) = (exp(2.4) -1)/(2.4-1j*2*pi*m);
end
X1 = [mean(x) X1];
disp(X1)