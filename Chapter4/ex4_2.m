% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 4.2: Generate a half second wave assuming a sample frequncy of 100 Hz, 
% Calculate and plot the Powers spectrum using the direct method and with
% zero padding.

fs = 100;                          % Sample frequencies
N1 = [0 100 500];                  % N values for padding
x =[(0:25) (24:-1:0) zeros(1,50)];  % Generate basic test signal, 100 pts long
for k = 1:3
    y = [x zeros(1,N1(k))];        % Zero pad signal
    N = length(y);                 % Data length
    t = (1:N)/fs;                  % Construct time vector for plotting
    f = (0:N-1)*fs/(N-1);          % Construct frequency vector for plotting
    subplot(3,2,k*2-1);
    plot(t,y,'k');                 % Plot test signal 
    xlabel('Time (sec)','FontSize',14);
    ylabel('x(t)','FontSize',14);
    if k == 1
        title('Time Domain','FontSize',14);
    end
    xlim([0 t(end)]);
    subplot(3,2,k*2);
    Y = abs(fft(y));               % Calculate the magnitude spectrum
    plot(f, Y,'.k');               % Plot PS
    xlabel('Freqency (Hz)','FontSize',14);
    ylabel('|X(f)|','FontSize',14);
    axis([0 10 0 max(Y)*1.2]);
    if k == 1 
        title('Frequency Domain','FontSize',14);
    end
end

%Extending the period to 2 and 6 seconds, by adding zeros decreases the 
%spacing between frequency points, producing a smoother-looking frequency curve.
%The spectral plots all have the same shape, but the points are more closely
%spaced with the zero-padded data. 
