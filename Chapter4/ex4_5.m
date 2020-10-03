% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4.5 Influence of averaging on heart rate data. 

fs = 100;                          % Sample frequency
ts = 1/fs;                         % Sample time
load Hr_pre;                       % Load normal data

% Convert to evenly spaced time data using interpolation
% First generate and evenly space time vectors having 
% one second intervals and extending over the time range of the data
xi = (ceil(t_pre(1)):ts:floor(t_pre(end)));
yi = interp1(t_pre,hr_pre,xi');                 % Interpolate
yi = yi - mean(yi);                             % Remove average

nfft = floor(length(yi)/8);                     % Calculate segment length
[PS_avg1,f1] = welch(yi,nfft,[],fs);            % Calculate periodogram
subplot(1,2,1); hold on;                        
    plot(f1,PS_avg1,'k');                       % Plot averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    title('Normal'); xlim([0 .2]);              % Limit horizontal axis

% Repeat for meditative data
load Hr_med;            % Load meditative data

% Convert to evenly spaced time data using interpolation
% First generate and evenly space time vectors having 
%  one second intervals and extending over the time range of the data
xi = (ceil(t_med(1)):ts:floor(t_med(end)));
yi = interp1(t_med,hr_med,xi');             % Interpolate
yi = yi - mean(yi);                         % Remove average
nfft = floor(length(yi)/8);
[PS_avg2,f2] = welch(yi,nfft,[],fs); 
subplot(1,2,2);     
    plot(f2,PS_avg2,'k');                   % Plot averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    title('Meditation');  xlim([0 .2]); 		% Limit horizontal axis

figure      % Replot in dB 
subplot(1,2,1)    
    plot(f1,10*log10(PS_avg1),'k');           % Plot averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum (dB)','FontSize',14);
    title('Normal');  xlim([0 .2]); 		  % Limit horizontal axis
subplot(1,2,2)    
    plot(f2,10*log10(PS_avg2),'k');           % Plot averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum (dB)','FontSize',14);
    title('Meditation'); xlim([0 .2]);        % Limit horizontal axis

%The spectra produced by averaging are considerably smoother.
%The spectrum obtained under normal conditions is seen to decrease 
%linearly with frequency. The spectrum obtained under meditative 
%conditions shows a large peak at 0.12-Hz. A reduced version of this 
%peak is also seen in the normal data.
