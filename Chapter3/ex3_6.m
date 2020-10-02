% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.6  Find the magnitude spectrum of two pulse waveforms using the 
% complex form of the Fourier series analysis.


T = 1;                      % Period (sec)
fs = 500;                   % Sampling freqaeuncy (Hz)
f1 = 1/T;                   % Fundamental frequency
N = round(T*fs);            % Calculate the number of points needed
t = (1:N)/fs;               % Time vector for complex sinusiods
x = zeros(1,N);             % Generate pulse waveform

PW = round(.005*N);         % PW = 0.005 sec
x(1:PW) =  1;               % Amplitude = 1.0

% Apply complex Fourier series analysis 
for m = 1:round(N/2)                            % Make m half the number of points
    f(m) = m*f1;                                % Frequency vector for plotting
    C(m)  = mean(x.*exp(-1j*2*pi*m*f1*t));      % Find complex compEq. 3.23
    Cmag(m) = sqrt(real(C(m))^2+imag(C(m))^2);  % Find magnitude Eg.3.24
end
subplot(2,2,1); 
plot(t,x,'k','LineWidth',2);
xlabel('Time (sec)','FontSize',12); 
ylabel('x(t)','FontSize',12);
title('PW: 0.005 sec','FontSize',12);
axis([0 0.1 0 1.2]);

subplot(2,2,2);
plot(f,Cmag,'ko','MarkerSize',4,'MarkerFaceColor','c');
xlabel('Frequency (Hz)','FontSize',12); ylabel('|C_m(f)|','FontSize',12);

%
clear x C f M;
x = zeros(1,N);                 % Generate pulse waveform
PW = round(.05*N);              % PW  = 0.05 sec        
x(1:PW) =  1;
subplot(2,2,3); 
plot(t,x,'k','LineWidth',2);
xlabel('Time (sec)','FontSize',12); 
ylabel('x(t)','FontSize',12);
title('PW: 0.05 sec','FontSize',12);
axis([0 0.1 0 1.2]);
for m = 1:round(N/2)
    C(m)  = mean(x.*exp(-1j*2*pi*m*f1*t));  
    f(m) = m*f1;
    A(m) = sqrt(real(C(m))^2+imag(C(m))^2)/.707;     
end
subplot(2,2,4);
plot(f,A,'ko','MarkerSize',4,'MarkerFaceColor','c');
xlabel('Frequency (Hz)','FontSize',12); 
ylabel('|C_m(f)|','FontSize',12);

%The frequency spectra of two pulse functions having different pulse
%widths found using the complex Fourier series analysis. The spectra
%consist of individual points spaced 1/T=2.0-Hz apart. The longer
%pulse produces a spectrum with a shorter peak. Both spectra have the
%shape of sinc funtion- |sin(x)/x|.
%Inverse relationship between pulse width and the width of the spectrum-
%The narrower the pulse the broader the spectrum and vice versa.
