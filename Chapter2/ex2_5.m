% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.5 Demonstration of the Euler Identity in MATLAB

Tt = 1;                     % Total time
fs = 500;                   % Sampling frequncy
t = (0:1/fs:Tt);            % Time vector    
z = exp(-1j*2*pi*t);         % Complex sinusoid (Equation 2.13)
figure(1)
plot(t,real(z),'k',t,imag(z),':k'); 
xlabel('Time (sec)', 'FontSize',14);
ylabel('y(t)','FontSize',14);
title({'A one-cycle cosine and sine wave produced by plotting the real and ',...
       'imaginary part of e(-j2pit)'})

%t is a 500-point vector varying between 0 and 1.
