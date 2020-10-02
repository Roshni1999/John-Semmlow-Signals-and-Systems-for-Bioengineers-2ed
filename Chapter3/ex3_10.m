% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.10 Fourier Transform of half triangle waveform in Example 3.2.

T = 1;                         % Total time
fs = 256;                      % Assumed sample frequency
N = fs*T;                      % Calculate number of points
t = (1:N)*T/N;                 % Generate time vector 
f = (1:N)*fs/N;                % Frequecy vector for plotting
x = [t(1:N/2) zeros(1,N/2)];   % Generate the signal, first a ramp
plot(t,x);
xlabel('Time (sec)','FontSize',12); ylabel('x(t)','FontSize',12);
figure;

Xf = fft(x);                   % Take Fourier Transform, scale
Mag = abs(Xf(2:end))/(N/2);    %  Reomve first point (DC value)
Phase = -angle(Xf(2:end))*(360/(2*pi));

plot(f(1:20),Mag(1:20),'.k','MarkerSize',12); hold on;   % Plot magnitude only lower frequencies
xlabel('Frequency (Hz)','FontSize',14); ylabel('|X(f)|','FontSize',14);

% Calculate fft using basic equations
for m = 1:20
    a(m) = (2/N)*sum(x.*(cos(2*pi*m*t)));       % Eq 3.11
    b(m) = (2/N)*sum(x.*(sin(2*pi*m*t)));       % Eq. 3.12
    C(m) = sqrt(a(m).^2 + b(m).^2);             % Eq. 3.9
    theta(m) = (360/(2*pi)) * atan2(b(m),a(m)); % Eq. 3.10
end
disp([a(1:4)' b(1:4)' C(1:4)' Mag(1:4)' theta(1:4)' Phase(1:4)'])
plot(f(1:20),C(1:20),'sk','MarkerSize',10);     % Plot sumperimposed 
   

%Magnitude frequency spectra produced by the MATLAB fft routine
%(dots) and a direct implementation of the Fourier transform
%equations(squares).
%The spectrum produced by the two methods is identical, as seen
%by the perfect overlap points.
    
    