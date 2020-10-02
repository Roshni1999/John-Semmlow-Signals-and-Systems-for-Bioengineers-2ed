% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.1  
% Correlaton analysis of two signals each containing three sinusoids

fs = 1000;                              % Sample freq.
N = 2000;                               % Number of points in the test signal
t = (1:N)/fs;                           % Time vector
f = [100 200 300];                      % Test signal frequencies
% Generate the test signal as a mixture of 3 sinusoids at different freq. 
x1 = 1.5*cos(2*pi*f(1)*t) + 1.75*sin(2*pi*f(2)*t) + 2.0*sin(2*pi*f(3)*t);
 
for i = 1:50                            % Analysis loop
    f(i) = i*10;                        % Frequency range: 10 - 500 Hz 
    y = cos(2*pi*f(i)*t);               % Generate sinusoid
    [r,lags] = axcor(x1,y);             % Crosscorrelate
    [rmax(i),ix(i)] = max(r);           % Find maximum value
end    
subplot(1,2,1); plot(f,rmax,'k');       % Plot and lable crosscorrelation results
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Correlation','FontSize',14);
    title('100, 200, 300 Hz','FontSize',14); axis([0 400 0 1]);

% Redo for test signal having slightly different frequecnies. 
f = [100 204 306];                      % Next test signal frequencies
x2 = 1.5*cos(2*pi*f(1)*t) + 1.75*sin(2*pi*f(2)*t) + 2.0*sin(2*pi*f(3)*t);
%
for i = 1:50
    f(i) = i*10;                        % Frequency range: 10 - 500 Hz 
        y = cos(2*pi*f(i)*t);           % Generate sinusoid
    [r,lags] = axcor(x2,y);             % Crosscorrelate
    [rmax(i),ix(i)] = max(r);           % Find maximum values
end    
subplot(1,2,2); plot(f,rmax,'k');       % Plot and lable crosscorrelation results
    xlabel('Frequency (Hz)','FontSize',14); ylabel('Correlation','FontSize',14);
    title('100, 204, 306 Hz','FontSize',14); axis([0 400 0 1]);

%The crosscorrelation analysis correctly identifies the three
%sinusoids found in the first mixture. The peaks of the three
%components accurately reflect the change in amplitude of the 
%three sine waves (from 1.5 at 100-Hz, 1.75 at 200-Hz and 2.0 at 300-Hz. 
%However, when the frequencies of two of the component sine
%waves are shifted just a few Hz, the analysis fails to find them. 
%This is because the crosscorrelation is searching in increments of 10-Hz
%and does not compare the test signal with sinusoids at 204Hz and 306-Hz.
