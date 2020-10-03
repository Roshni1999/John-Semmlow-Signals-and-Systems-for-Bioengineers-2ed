% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4.3: Frequency analysis of heart rate data in the normal and
% mediative state.

fs = 100.0;             % Sample frequency
ts = 1/fs;              % Sample interval
load Hr_pre;            % Load normal data

% Convert to evenly spaced time data using interpolation-resampling
% First generate an evenly space time vectors having 
% one second intervals and extending over the time range of the data
xi = (ceil(t_pre(1)):ts:floor(t_pre(end)));
yi = interp1(t_pre,hr_pre,xi');        % Interpolate
yi = yi - mean(yi);                    % Remove average
N2 = round(length(yi)/2) ;             % Get half data length
f = (1:N2)*fs/N2;                      % Frequency vector for ploting
YI = abs((fft(yi)).^2);                % Calculate power spectrum-Direct approach
subplot(1,2,1);
plot(f,YI(2:N2+1),'k');                % Plot frequency spectrum, ignore DC value
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    axis([0 .15 0 max(YI)*1.25]);
    title('Normal')

% Repeat for meditative data
load Hr_med;            % Load meditative data

% Convert to evenly spaced time data using interpolation
% First generate and evenly space time vectors having 
% one second intervals and extending over the time range of the data
xi = (ceil(t_med(1)):ts:floor(t_med(end)));
yi = interp1(t_med,hr_med,xi');          % Interpolate
yi = yi - mean(yi);                      % Remove average
f = (0:length(yi)-1)*fs/(length(yi)-1);  % Frequency vector for ploting
YI = abs((fft(yi)).^2);                  % Calculate power spectrum-Direct approach
subplot(1,2,2);
plot(f,YI,'k');                          % Plot frequency spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    axis([0 .15 0 max(YI)*1.25]);
    title('Meditation')

%The power spectrum of normal heart rate variability is low and decreases 
%with frequency, showing little energy above 0.1-Hz. The meditative state,
%shows large peaks at around 0.1 to 0.12-Hz, indicating that some resonant 
%process is active at these frequencies. 
