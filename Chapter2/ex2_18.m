% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd

% Example 2.18 Program to plot autocorelation function of EEG data 
%

load eeg_data;
fs = 50;                           % Assume sample interval is 50 Hz sample freq
[rxx,lags] =axcor(eeg);            % Calculate autocorrelation function
plot(lags/fs,rxx,'k'); hold on;    % Plot autocorrelation function
plot([lags(1) lags(end)], [0 0],'k');       % Plot zero line
title('EEG Autocorrelation Function','FontSize',14);
axis([-1 1 -.5 1.2]);
xlabel('Lag (sec)','FontSize',14);
ylabel ('Rxx','FontSize',14);

%The autocorrelation function of the EEG signal.
%The signal decorrelates quickly, reaching a value of zero
%correlation after a time shift of approximately 0.08 sec.
%The EEG signal is likely to be contaminated with noise and 
%since noise decorrelates instantly, some of the rapid 
%decorrelation seen is likely due to noise.
