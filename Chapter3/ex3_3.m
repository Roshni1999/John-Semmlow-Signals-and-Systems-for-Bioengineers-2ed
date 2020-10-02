% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 3.3 Reconstruct the waveform of Example 3.2 using only the first
% four components found analytically.

fs = 500;                   % Assumed sample frequency
N = 500;                    % Number of points for 1 sec.
t = (1:N)/N;            
A = [0.187 0.08 0.054 0.04];            % Component magnitudes
theta = [122 -90 103 -90]*2*pi/360;     % Component phase (in rad)

x = zeros(1,N);
for f = 1:4                                 % Add the 4 terms of Eq. 3.5
     x = x + A(f)*cos(2*pi*f*t - theta(f)); % Using appropriate A and theta 
end

x = x + 0.125;                          % Add DC term
plot(t,x,'k');                          % Plot results 
xlabel('Time (sec)','FontSize',14); 
ylabel('x(t)','FontSize',14);
hold on; 
plot([0 .5],[ 0 .5],':k');
plot([.5 .5],[.5 0],':k');
plot([.5 1],[0 0],':k');

%The Fourier summation (solid line) produces a fair approximation of
%the original waveform (dotted line) even though only four
%components are used.