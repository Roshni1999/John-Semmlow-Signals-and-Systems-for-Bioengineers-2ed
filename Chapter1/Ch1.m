% John Semmlow- 'Signals and Systems for Bioengineers, A MATLAB - Based Introduction', 2ndEd
%  Example 1.5 Program to generate a 500 point vector containing a 4 Hz sine wave 
%  with a sample frequency of 500 Hz

fs = 500;                   			% Sample interval
N = 500;                        		% Number of points
f = 4;                              	% Frequency of sine wave
t = (1:N)/fs;                   		% Generate time vector
x = sin(2*pi*f*t);                      % Generate sine wave
RMS = sqrt(mean(x.^2));                 % Calculate RMS
disp (RMS)                         	 	% and display
figure(1)
plot(t,x,'k','LineWidth',2);            % Plot sine wave
xlabel('Time(sec)');                    % Label axes
ylabel('x(t)');	
title('A 4-Hz sine wave')

%%
% Example 1.6 Program to plot EEG data and  +/- one standard deviation 

load eeg_data;              		              % Load the data (from the CD)
fs = 50;                    		              % Sample frequency of 50 Hz
N = length(eeg);                                  % Get data length
t = (1:N)/fs;                                     % Generate time vector
figure(2)
hold on
plot(t,eeg,'k'); hold on;                         % Plot the data
std_dev = sqrt(sum((eeg - mean(eeg)).^2)/(N-1));  % Eq. 1.22 
std_dev1 = std(eeg);         		              % MATLAB standard deviation
avg = mean(eeg);                                  % Determine the mean of EEG
disp([std_dev std_dev1])
plot([t(1) t(end)],[std_dev+avg std_dev+avg],':k'); 
plot([t(1) t(end)],[-std_dev+avg -std_dev+avg],':k'); 
xlabel('Time (sec)','FontSize',14);
ylabel('EEG','FontSize',14);
title({'The segment of an EEG signal with the positive and negative standard',...
       'deviations indicated by a dotted horizontal line.'})

%%
% Example 1.7 Load the visual evoked response data, 
%  Construct and plot the ensemble average

load ver;						   % Get visual evoked response data;
fs = 1/.005;					   % Sample interval = 5 msec
[nu,N] = size(ver);                % Get data matrix size 
if nu > N
	ver = ver';
	t = (1:nu)/fs;                 % Generate time vector 
else
	t = (1:N)/fs;				   % Time vector if no transpose	
end

figure(3)
plot(t,ver(1,:));                  % Plot individual record
xlabel('Time(sec)','FontSize',14); %Label axis
ylabel('EEG','FontSize',14);
title('The raw EEG signal showing a single response to an evoked stimulus')

% Construct and plot the ensemble average
avg = mean(ver);				   % Calculate ensemble average 
figure(4)
plot(t,avg);					   % Plot ensemble average other data
xlabel('Time(sec)','FontSize',14); %Label axis
ylabel('EEG','FontSize',14);
title('The ensemble average of 100 individual signals showing the VER')

%%
% Example 1.8 Example to evaluate noise reduction in ensemble averaging. 
 
load ver;						% Get visual evoked response data;
fs = 1/.005;					% Sample interval = 5 msec
[nu,N] = size(ver);             % Get data matrix size 
if nu > N
	ver = ver';
	t = (1:nu)/fs;              % Generate time vector 
else
	t = (1:N)/fs;				% Time vector if no transpose	
end	

figure(5)
hold on
subplot(2,1,1);
plot(t,ver(1,:),'k'); 			% Plot individual record
xlabel('Time(sec)','FontSize',14);
ylabel('EEG','FontSize',14);
% Construct and plot the ensemble average
avg1 = mean(ver);				% Calculate ensemble average 
avg2 = mean(ver(1:25,:));
subplot(2,1,2);
plot(t,avg1,'k');				% Plot ensemble average other data
xlabel('Time(sec)','FontSize',14);
ylabel('EEG','FontSize',14);

figure(6);
plot(t,avg2);					% Plot ensemble average other data
xlabel('Time(sec)','FontSize',14);
ylabel('EEG','FontSize',14);

% Estimate the noise components
ver_noise = ver(1,:) - actual_ver;
avg1_noise = avg1 - actual_ver;
avg2_noise = avg2 - actual_ver;
std_ver = std(ver_noise);
std_avg1 = std(avg1_noise);
std_avg2 = std(avg2_noise);

%%



















