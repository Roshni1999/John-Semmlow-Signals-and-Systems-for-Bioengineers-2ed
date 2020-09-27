% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
% Example 2.8  Example to apply some mathmatical and threshold 
% operations to an MR image of the brain.  
% MR image of the brain that has been brightened, contrast-enhanced, and thresholded.

thresh = .25;        % Set threshold 
load brain;          % Load image   
[r c] = size(I);     % Determine size of image
figure(1)
hold on

subplot(2,2,1);
pcolor(I);           % Display image 
shading interp;      % Use interpolation 
colormap(bone);      % use a grayscale colormap
caxis([0 1]);        % Fix pcolor scale
title('Orignal Image','FontSize',12);
%
subplot(2,2,2);
I_1 = I + .3;          % Brighten the image by adding 0.3
pcolor(I_1);           % Display image 
shading interp;        % Use interpolation 
colormap(bone);        % use a grayscale colormap
caxis([0 1]);          % 
title('Brightened','FontSize',12);
%
subplot(2,2,3);
I_1 = 1.75*I;          % Increase image contrast by multiplying by 1.75
pcolor(I_1);           % Display image 
shading interp;        % Use interpolation 
colormap(bone);        % use a grayscale colormap
caxis([0 1]);          % 
title('Contrast Enhanced','FontSize',12);
%
subplot(2,2,4);
thresh = 0.25;
for k = 1:r
    for j = 1:c
        if I(k,j) > thresh         % Test each pixel separately
            I_1(k,j) = 0;%I(k,j);  % Make it black
        else 
            I_1(k,j) = 1;          % If low make corresponding pixel white
        end
    end
end
pcolor(I_1);           % Display image 
shading interp;        % Use interpolation 
colormap(bone);        % use a grayscale colormap
title('Thresholded','FontSize',12);
        
%In thresholding, the darker regions are shown as white and all other regions as black.
 