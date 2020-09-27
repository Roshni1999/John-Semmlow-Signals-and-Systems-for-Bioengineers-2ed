% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd

% Example 2.16
% Figure to demonstrate translation of probing function and inner product
% Use Mexican Hat probing function and a chirp waveform.   

% Generate waveform to be probed.
fs = 1000;              % Sampling freq. 
N = 1024;               % Length of waveform / 6
M = 64;                 % Length of probe function
nt = 256;               % Number of translations
t = (1:N)*2*pi/fs;
x = 0.5 * chirp(t,.00005,3,4);
tx = (1:length(x))/fs;

% Generate the probing function: a Mexican Hat function
t1 = (0:M-1)*2/M;
a = .5;
mx=1/sqrt(abs(a)) * (1 - 2*(t1/a).^2).*exp(-(t1/a).^2);
l =length(mx);
y = [mx(l:-1:2) mx];    % Reflect function about center
tmx = (1:length(y))/fs;

subplot(2,1,1);
plot(tx,x,'k')          % Plot waveform
hold on;
plot(tmx,y,'k');        % Plot probe function
xlabel('Time (sec)','FontSize',14); ylabel('x(t) & y(t)','FontSize',14);
plot(tmx+.3,y,':k');    % Plot additional probing functions
plot(tmx+.7, y,':k');
axis([0 1 -1 2]);
save chirp_signal.mat x y;

% Signal analysis starts here
load chirp_signal;              % Load data
[rxy,lags] = axcor(y,x);        % Crosscorr: shift reference (y)
subplot(2,1,2);
hold on;
plot(lags/fs,8*rxy,'k');          % Plot data
xlabel('Time (sec)','FontSize',14); ylabel('rxy','FontSize',14);
xlim([0 1]);
[max_corr max_shift] = max(rxy);        % Find max values
disp([max_corr lags(max_shift)/fs])     % Display max values
plot([lags(max_shift)/fs lags(max_shift)/fs],[-1 1],'k');    % Plot line

%The short reference waveform(Mexican hat) on the left is to be compared to the longer
%signal. The longer signal continuously increases its frequency with time and is
%termed a chirp signal. Crosscorrelation can be used to perform a running
%correlation. Crosscorrelation between the two signals: A maximum
%correlation of 0.677 was found at 0.325 sec (vertical line).
