% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd

% Example 2.17  
% Camparison of a sinusoids at different frequencies 
% with the EEG signal using crosscorrelation. 

load eeg_data;                  % Get eeg data
fs = 50;                        % Sampling frequency       
t = (1:length(eeg))/fs;         % Time vector

for i = 1:25
    f(i) = i;                   % Frequency range: 1–25 Hz
    x = sin(2*pi*f(i)*t);       % Generate sin
    r = axcor(eeg,x);           % Perform crosscorrelation
    rmax(i) = max(r);           % Store max value 
end

plot(f,rmax,'k');               % Plot max values as function of freq.
xlabel('Frequency (Hz)','FontSize',14); ylabel('Correlation','FontSize',14);
title('Cross-correlation of sinusoids at different frequencies with an EEG signal.')    
% Some frequencies show much higher correlation between 
% the sinusoid and the EEG. A particularly strong peak is 
% seen in the region of 7to 9-Hz, indicating the presence of 
% an oscillatory pattern known as the “alpha wave.”