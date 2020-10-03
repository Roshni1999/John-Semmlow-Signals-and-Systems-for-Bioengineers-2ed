function [PS,f,t] = stft(x,nfft,noverlap,fs)
%Function to calculate short term Fourier transform
%[ps,f] = welch(x,nfft,noverlap,fs);
%  Output arguments
%		PS	power spectrum
%		f	frequency vector for plotting
%       t   time vector for plotting
%  Input arguments
%		x data
%		nfft window size
%      	noverlap number of overlaping points in adjacent segements
%	    fs sample frequency
%	Uses Hanning window
%
N = length(x);                              % Get data length
half_segment = round(nfft/2);               % Half segment length
if nargin < 4                               % Test inputs
    fs = pi;                                % Default fs
end
if nargin < 3 || isempty(noverlap)
    noverlap = half_segment;                % Set default overlap at 50%
end
 
%  Defaults complete. The routine now calculates the appropriate number of points
%	to shift the window and the number of averages that can be done given
%	the data length (N), window size (nff) and overlap (noverlap). 
f = (1:half_segment)* fs/(2*half_segment);      % Calculate frequency vector
increment = nfft - noverlap;                    % Calculate window shift
nu_avgs =  round(N/increment);                  % Determine the number of segments
%
% Now shift the segment window and calculate the PS using Eq. 4.17
for k = 1:nu_avgs               			% Calculate spectra for each data point
   first_point = 1 + (k - 1) * increment;
   if (first_point + nfft -1) > N			% Check for possible overflow
       first_point = N - nfft + 1;       	% Shift last segment to prevent overflow
   end
    data = x(first_point:first_point+nfft-1); 	% Get data segment
    N1 = length(data);
    % Insert window function
    window = .41 - .5*cos(2*pi*(0:N1-1)/N1) + .08*cos(4*pi*(0:N1-1)/N1);
    data = data .* window';                  % apply window to data
    PS_temp = abs((fft(data)).^2)/N1;       	% Calculate power spectrum normalized
    PS(k,:) = PS_temp(2:half_segment+1)/(nfft/2);      % Remove redundent points
    t(k) = (k - 1)*increment/fs;                % Construct time vector
 end
  


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
