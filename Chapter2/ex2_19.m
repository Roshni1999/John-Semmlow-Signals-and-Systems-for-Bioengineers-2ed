% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd

% Example 2.19 Use of autocovariance to determine the correlation 
% of heart rate variation between heart beats

load Hr_pre; %Load normal HR data
load HR_med; %Load meditative conditions HR data

[cov_pre,lags_pre] = axcor(hr_pre-mean(hr_pre));        % Determine autocovariance
% Plot and label data.  Limit lags to +- 30 seconds
plot(lags_pre,cov_pre,'k'); hold on;  % Plot normal auto-cov
plot([lags_pre(1) lags_pre(end)], [0 0],'k');   % Plot a zero line
xlabel('Lags (beats)','FontSize',14); ylabel('Auto-covariance','FontSize',14);
axis([-30 30 -.2 1.2]);
title('Autocovariance function of the heart rate under normal resting conditions')
grid on;

%Some correlation is observed in this individual over 
%approximately 10 successive heartbeats.