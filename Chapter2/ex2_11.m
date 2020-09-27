% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.11  correlation between an sinewave and a cosinewave. 

N = 500;                    % Number of points
Tt = 1.0;                   % desired total time
fs = N/Tt;                  % Calculate sampling frequency
t = (0:N-1)/fs;             % Time vector from 0 (approx.) to 1 sec.
x = sin(2*pi*t);            % 1 Hz sinewave
y = cos(2*pi*t);            % 1 Hz cosine wave
z = [ones(1,N/2) -ones(1,N/2)];     % 1 Hz square wave
rxz = mean(x.*z);           % Correlation b/n x and z (=2/pi)
rxy = mean(x.*y);           % Correlation b/n x and y (=0)
ryz = mean(y.*z);           % Correlation b/n x and y (=0)

figure(1)
plot(t,x,'k',t,y,':k', t,z, 'b');     % Plot x and y and z
xlabel('Time (sec)','FontSize', 14);
ylabel('x(t), y(t)','FontSize', 14);
disp([rxz rxy ryz])