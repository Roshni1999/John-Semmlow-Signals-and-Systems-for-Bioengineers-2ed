% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.12
% Application of the correlation and covariance matrices to 
% sinusoids that are orthongonal and non-orthogonal to sawtooth 

N = 1000;                       % Number of points
Tt = 2;                         % desired total time
fs = N/Tt;                      % Calculate sampling frequency
t = (0:N-1)/fs;                 % Time vector from 0 (approx.) to 2 sec.
x(:,1) = cos(2*pi*t)';      	% Generate a 1 Hz cosine
x(:,2) = sin(2*pi*t)';    		% Generate a 1 Hz sine
x(:,3) = cos(4*pi*t)';  		% Generate a 2 Hz cosine
x(:,4) = saw(1,2,fs)';    		% Generate a 1 Hz sawtoothe
%
figure
plot(t,x(:,1),'k', t,x(:,2), 'b', t,x(:,3),'r', t, x(:,4), 'g')
xlabel('Time (sec)','FontSize', 14);
ylabel('x(t)s','FontSize', 14);
S = cov(x)                      %  Print covariance matrix
Rxx = corrcoef(x)               %  Print correlation matrix

%The diagonals of the covariance matrix give the
%variance of the 4 signals.
%The correlation matrix shows similar results except that
%the diagonals are now 1.0 since these reflect the
%correlation of the signals with themselves.
%The covariance and correlation between the various
%signals are given by the off-diagonals. The
%off-diagonals show that the sinusoids have no
%correlation with one another, a reflection of their
%orthogonal relationship. The 1-Hz cosine wave is
%highly correlated with the sawtooth and there is some
%correlation between the 1-Hz sine wave and the
%sawtooth; however, no correlation is found between
%the 2-Hz cosine wave and the sawtooth.