% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4.7  Find the effective bandwidth of the signal x in file ex4_7_data.mat

load Ex4_7_data.mat;			        % Load the data file.  Data in x
fs = 500;				                % Sampling frequency (given)
[PS1,f1] = welch(x,length(x),0,fs);  	% Determine and plot the un-averaged spectrum
figure(1)
plot(f1,PS1,'k');                       % Plot spectrum
xlabel('Frequency (Hz)','FontSize',14);
ylabel('PS(f)','FontSize',14);
title('The spectrum of the noisy signal')

nfft = 256;                             	% Power spectrum window size
[PS,f] = welch(x,nfft,nfft-1,fs);           % Magnitude spectrum of eeg
PS = PS/max(PS);                            % Normalize to 1.0             
figure(2)
plot(f,PS,'k');                             % Plot spectrum
xlabel('Frequency (Hz)','FontSize',14);
ylabel('PS(f)','FontSize',14);

in_fl = find(PS > .5, 1, 'first');          % Find index of low freq. cutoff
in_fh = find(PS > .5, 1, 'last');           % Find index of high freq. cutoff
f_low = f(in_fl);                           % Find low cutoff freq.
f_high = f(in_fh);                          % Find high cutoff freq.
hold on;
plot(f_low,PS(in_fl),'k.','MarkerSize',20);
plot(f_high,PS(in_fh),'k.','MarkerSize',20);
BW = f_high - f_low;                        % Calculate bandwidth
title(['Bandwidth:  ',num2str(BW,3),' Hz'],'FontSize',14);


%The spectrum of the signal obtained using spectral averaging. The
%window size was selected empirically to be 256 samples. This size 
%appears to give a smooth spectrum while maintaining good resolution. 
%The half-power points which are the same as the ?3-dB points in the 
%magnitude spectrum are determined by searching for the first and last 
%points in the spectrum that are greater than 0.5. MATLAB’s find routine 
%was used to locate these points, which are identified as large dots on 
%the spectral curve. 