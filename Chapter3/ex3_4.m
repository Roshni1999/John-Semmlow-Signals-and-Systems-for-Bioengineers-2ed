% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.4  Evaluate the three sine wave signals of Example 3.1 using 
% Fouries series analysis

fs = 1000;                              % Sampling freq.
N = 2000;                               % Number of points in the test signal
t = (1:N)/fs;                           % Time vector
T = N/fs;                               % Period (max t)
f1 = 1/T;                               % Basic frequency 
fsig = [100 204 306];                   % Generate test signal frequencies
x = 1.5*cos(2*pi*fsig(1)*t) + 1.75*sin(2*pi*fsig(2)*t) + 2.0*sin(2*pi*fsig(3)*t);
% Calculate spectrum from basic eq.
for m = 1:1000
    f(m) = m*f1;                            %  Freq. vector for plotting
    a(m) = (2/N)*sum(x.*(cos(2*pi*m*f1*t)));
    b(m) = (2/N)*sum(x.*(sin(2*pi*m*f1*t)));
    A(m) = sqrt(a(m).^2 + b(m).^2);
end
plot(f,A,'k');
xlabel('Frequency (Hz)','FontSize',14); ylabel('|A(f)|','FontSize',14);
axis([0 500 0 2.2]);