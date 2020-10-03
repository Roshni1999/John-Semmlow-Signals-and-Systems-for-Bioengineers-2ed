% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4.4  Investigation of the influence of averaging to improve broadband
% spectral characteristics in the Power Spectrum.

load broadband1;                            % Load data (variable x)
fs = 1000;                                  % Sampling frequency
nfft = 128;                                 % Segment size for averaging
PS = abs((fft(x)).^2)/length(x);            % Calculate un-averaged PS -direct method
half_length = fix(length(PS)/2);			% Find data length /2
f = (1:half_length)* fs/(2*half_length);    % Frequency vector for plotting
subplot(1,2,1)
plot(f,PS(1:half_length),'k');              % Plot un-averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    title('Standard Spectrum','FontSize',12);

[PS_avg,f] = welch(x,nfft,nfft-1,fs);       %Calculate periodogram, max overlap
subplot(1,2,2)    
    plot(f,PS_avg,'k');                     % Plot averaged Power Spectrum
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Power Spectrum','FontSize',14);
    title('Periodogram','FontSize',12);

%In the unaveraged power spectrum the two sinusoids at 390 and 410-Hz are
%clearly seen; however, the broadband signal is noisy and poorly defined. 
%The periodogram produced from the segmented and averaged data is much 
%smoother, better reflecting the constant energy of white noise, but the 
%loss in frequency resolution is apparent as the two high-frequency
%sinusoids are barely visible. 
%Spectral techniques that produce a good representation of “global” 
%features such as broadband features are not good at resolving narrowband 
%or “local” features such as sinusoids and vice versa.
