% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.7 Construct the image of a sine wave grating having 4 cycles
% across the image.  Make the image 100 by 100 pixels.
%

N = 100;          % Number of pixels per line 
x = (1:N)/N;      % Pixel vector
y = sin(8*pi*x);  % Four cycle sine wave
for k = 1:N
    I(k,:) = y;   % Duplicate 100 times
end

pcolor(I)
shading interp;      % Use interpolation 
colormap(bone);      % use a grayscale colormap
%axis('square');     % Adjust axis aspect ratio
xlabel('Pixel Column Number','FontSize',12);
ylabel('Pixel Row Number','FontSize',12);
title('A sinusoidal grating')
%The sinusoidal gradation in gray levels is compromised in the printing process.