% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.15 
%  File neural data.mat contains two waveforms, x and y, that were recorded from two 
%  different neurons in the brain with a sampling interval of 0.2 msec.  They are believed to be
%  involved in the same function, but separated by one or more neuronal junctions that would impart 
%  a delay to the signal.  Plot the original data, determine if they are related, and if so the time
%  delay between them.  

load neural_data.mat;                       % Load data
fs = 1/0.0002;                              % Sampling freq. (1/Ts)
t = (1:length(x))/fs;                       % Calc. time vector
subplot(2,1,1);
    plot(t,y,'k',t,x,':k');                 % Plot data
    xlabel('Time(sec)','FontSize',14); ylabel('x(t) and y(t)','FontSize',14);

[rxy,lags] = axcor(x,y);                    % Compute crosscorrelation
subplot (2,1,2);
    plot(lags/fs,rxy,'k');                  % Plot crosscorrelation         
    xlabel('Time (sec)','FontSize',14); ylabel('rxy','FontSize',14)
[max_corr, max_shift] = max(rxy);
disp([max_corr lags(max_shift)/fs])         % Output delay in sec.

% Recordings made from two different neurons believed to be
%involved in the same neural process, but delayed by intervening
%synapses (simulated data). Some background noise is seen in both
%recordings. B) Crosscorrelation between the two neural recordings
%showing a peak at 0.013 sec.

