% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.1 Plot two sinusoids 60 deg out of phase

fs = 1000;              % Assumed sampling frequency
N = 500;                % Number of points
t = (0:N-1)/fs;         % Generate time vector
phase = 60*(2*pi/360);  % 60 deg phase; convert to rad
x1 = sin(2*pi*2*t);     % Construct sinusoids 
x2 = sin(2*pi*2*t - phase);

figure(1)
hold on;
plot(t,x1,'k');             % Plot sinusoids
plot(t,x2,'--k');
plot([0 .5], [0 0],'k');    % Plot horizontal line
xlabel('Time (sec)','FontSize',14);
ylabel('x(t)','FontSize',14);
axis([0 .5 -1.5 1.5]);
grid on;
title('Two 2-Hz sinusoids that differ in phase by 60 deg')
%This phase difference translates to a time difference or delay of 83.3 msec

