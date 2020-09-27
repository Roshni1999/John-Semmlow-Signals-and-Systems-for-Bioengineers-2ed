% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.13 Find the best correlation between the EEG signal
%  and both a 8 Hz and 12 Hz sinusoid. 

load eeg_data              % Loads data array 'eeg'
fs = 50;                   % Sampling freq of EEG data
t = (1:length(eeg))/fs;    % Time vector from 0 to 1 sec.
f = [6.5 14];              % Frequencies used

for k = 1:2                % Loop for different freqeuncies
    for m = 1:360          % Loop for phases
        phase = (m-1)*pi/180;        % Change phase convert to rad
        x = sin(2*pi*f(k)*t+phase);  % Construct sinusoid
        rxy(m) = mean(x.*eeg);       % Eq. 2.15
    end
    subplot(1,2,k);         % Plot correlations versus phase
    rxy = rxy/sqrt(var(x)*var(eeg)); % Normalize Eq. 2.17
    [max_corr, max_phase] = max(abs(rxy));
    plot((1:360)-1,rxy,'k');           % Corr as a function of phase
    xlabel('Phase (deg)','FontSize', 14);
    ylabel('Correlation','FontSize', 14);
    title(['Max correl: ',num2str(max_corr,2),' at ',num2str(max_phase,3),' deg']);

    [dum max_phase(k)] = max(abs(rxy));
end
figure; hold on;

% This code is use for figure 2.15
eeg = eeg/max(abs(eeg))     % Scale to 1.0
x = sin(2*pi*f(1)*t+max_phase(1));

plot(t(300:350),eeg(300:350),'r'); plot(t(300:350),x(300:350));
xlabel('Time (sec)','FontSize', 14);
ylabel('Correlation','FontSize', 14);
title({'A time plot of a 1-sec segment of the EEG signal and the 6.5-Hz sine wave ',...
       'at highest correlation coefficient = 0.16'})

%The two curves show the correlations as a function 
%of phase shift 6.5-Hz (left) and 14-Hz (right) and the
% maximum correlations are given in the graph titles. 
%The 6.5-Hz sinusoid shows a much
%higher correlation reaching a value of 0.16. 

%Figure 2 shows a 1-second time plot of the EEG signal
%and the 6.5-Hz sinusoid at the optimum phase shift.
%Some similarity between the two signals can be observed. The
%correlation coefficient for these two signals is 0.16.