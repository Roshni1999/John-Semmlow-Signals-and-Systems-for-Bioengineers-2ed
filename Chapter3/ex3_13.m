% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.13  Example applyimg the FT to a respiration signal.

load Resp           % Get respiratory signal
fs = 125;           % Sampling freqeuncy in Hz
max_freq = 2;       % Max desired plotting frequency in Hz
N = length(resp);   % Length of respiratory signal
f = (1:N)*fs/N;     % Construct frequency vector
t = (1:N)/fs;       % Construct tim vector
plot(t,resp,'k');   % Plot time signal
xlabel('Time (sec)','FontSize',14);
ylabel('Respiration','FontSize',14);
title('Respiratory signal. The peaks correspond to maximum inspiration')
figure;

X = fft(resp);              % Calculate the DFT
m_plot = round(2/(fs/N));   % Find m for 2 Hz
subplot(2,1,1);
plot(f(1:m_plot-1),abs(X(2:m_plot)),'k');   % Plot magnitude spectrum
xlabel('Frequency (Hz)','FontSize',14); ylabel('|X(f)|','FontSize',14);
phase = unwrap(angle(X));                   % Calculate phase spectrum
phase = phase * 360/(2*pi);                 % Unwarp phase spectrum
subplot(2,1,2);
plot(f(1:m_plot-1),phase(2:m_plot),'k');    % Plot phase spectrum
xlabel('Frequency (Hz)','FontSize',14); ylabel('Phase','FontSize',14);
[peak, m_peak] = max(abs(X(2:m_plot)));      % Find m at max magnitude peak
max_freq = f(m_peak)                        % Calculate and display frequency
max_time = 1/max_freq                       % Calculate and display max time
breath_min = 60/max_time                    % Calculate and display breath/min

%The frequency of the peak was found to be 0.3125-Hz corresponding to 
%an inter-breath interval of 3.2 sec giving rise to a respiratory rate 
%of 18.75 breaths/min.


