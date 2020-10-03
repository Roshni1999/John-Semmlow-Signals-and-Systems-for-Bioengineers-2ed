% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4_6: Example of the short-term Fourier transform time-frequency analysis

load Resp;                   % Get respiratory data
N = length(resp);
fs = 125;                    % Sampling frequency
nfft = fs*60;                % 1 min of samples
m_plot = round(2/(fs/nfft)); % Find m for 2 Hz
noverlap = round(nfft/2);    % Use 50% overlap
[PS,f,t] = stft(resp',nfft,noverlap,fs); % Calculate the STFT
PS1 = PS(:,2:m_plot);        % Resize power spectra to range to 2 Hz
f1 = f(1:m_plot-1);          % Resize freqeuncy vector for plotting
mesh(f1,t,PS1);              % Plot in 3D
view([17 30]);               % Adjust view for best perspective
ylabel('Time (Sec)','FontSize',12);     
xlabel('Frequency (Hz)','FontSize',12);
zlabel('PS(f)','FontSize',12);
colormap(bone);             % Make grascale for printing
caxis([0 200000]);          % Make all dark.
title('Time-frequency plot of a 10 minute respiratory signal.')

%Plot was constructed by segmenting the 10 minute signal into 1-minute
%increments and taking the power spectrum of each increment
%separately rather than averaging as in the welch method. Segments
%overlap by 50%.