% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 12 Evaluate and plot the phase shift to the half triangle wave.
% Phase shift with and without unwrapping using the MATLAB unwarp routine.  

T = 2;                      % Total time
fs = 256;                   % Assumed sample frequency
N = fs*T;                   % Calculate number of points
t = (1:N)*T/N;              % Generate time vector 
f = (0:N-1)*fs/(N-1);       % Freqeucy vector for plotting

% Generate waveform
x = [t(1:N/4) zeros(1,3*N/4)];      % Generate the signal
plot(t,x);
xlabel('Time (sec)','FontSize',12); ylabel('x(t)','FontSize',12);
figure

X = fft(x);                                      % Calculate complex spectrum
Mag = abs(X);                                    % Get magnitude
Phase = angle(X)*360/(2*pi);                     % Get phase in deg
Phase_unwrap = unwrap(angle(X))*360/(2*pi);      % Unwrapped phase in deg. 
plot(f(1:21),Mag(1:21),'*k');                    % Plot magnitude spectrum
xlabel('Frequency (Hz)','FontSize',14);
    ylabel('Magnitude','FontSize',14);
    title('Magnitude Spectrum', 'FontSize',14);
figure
subplot(2,1,1)
    plot(f(1:21),Phase(1:21),'*k');
    xlabel('Frequency (Hz)','FontSize',14);
    ylabel('Phase (deg)','FontSize',14);
    title('Phase Spectrum', 'FontSize',14);
 subplot(2,1,2);
    plot(f(1:20),Phase_unwrap(2:21),'*k');
    xlabel('Frequency (Hz)','FontSize',14);
    ylabel('Phase (deg)','FontSize',14);
    title('Phase Unwrapped', 'FontSize',14);
  
%Without unwrapping, the phase spectra are seen to transition upward 
%sharply whenever they approach 180 degrees as expected. 
%The unwrapped spectrum is a straight line that decreases smoothly 
%to 1500 degrees at 10-Hz.
    
