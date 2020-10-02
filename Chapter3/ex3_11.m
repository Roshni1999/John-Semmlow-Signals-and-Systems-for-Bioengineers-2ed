% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.11 Determine the magnitude spectrum of a noisy waveform.

N = 1024;                                % Number of data points 
fs = 1000;          	                 % The sample frequency of data is 1 kHz.
freq = (0:N-1)*fs/(N-1);                 % Frequency vector for plotting

% Generate data using sig_noise 
% 250 Hz sin plus white noise; N data points; SNR =  -14 db 
[x,t] = sig_noise (250,-14,N);

Xf = fft(x);		                     % Calculate FFT
Mf = abs(Xf);  	                         % Calculate the magnitude
plot(freq,Mf,'k');                       % Plot the magnitude spectrum
hold on; plot([500 500],[0 max(Mf) * 1.1],':k','LineWidth',2);	
title('Spectrum (symmetric about fs/2)','FontSize',14);
xlabel('Frequency (Hz)','FontSize',14);  ylabel('Magnitude','FontSize',14);

% The peak at 250-Hz is apparent. The sampling frequency of data is 1 kHz
%and the spectrum is symmetric about fs/2 (dashed line at 500-Hz).