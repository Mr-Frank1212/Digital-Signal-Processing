
% PART I: (1)
% Declaring filter parameters (frequency values are in Hertz)
Fs = 10000;          % Sampling Frequency
Fpass = 500;         % Passband Frequency
Fstop = 800;         % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 90;          % Stopband Attenuation (dB)
match = 'passband';  % Band to match exactly
% Butterworth Lowpass filter designed using filterDesigner tool
% 'h'below, Designs the lowpass filter with the set frequency and dB values
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);

% Sets the filter type & order, and assigns the complete filter design to
% variable'Hd'
Hd = design(h, 'butter', 'MatchExactly', match); 

[h,a]=freqz(Hd);   % Saves the frequency response and angular frequency of... 
                   % the designed filter (Hd) in 'h' and 'a' respectively
[phi,w] = phasez(Hd);% Saves phase response vector and angular frequency... 
                     % of the designed filter to 'phi' and 'w' respectively

figure % Creates a new figure 
x=a/pi;            % Divides the angular frequency by pi
p=20*log10(abs(h));% Expresses the magnitude of the freq response in decibel
plot(x,p,'b');     % plots p against x - (plots the magnitude response) 
ax = gca;          % Returns the axis data of the current figure to ax 
ax.YLim = [-900 50];% Adjusts the y axis to a max of 50 and min of -900
grid on                                         % Turns the grid ON
title('Magnitude Response of Designed Filter'); % Titles the plot
xlabel('Normalized Frequency (x π rad/sample)');% lebels the X-axis
ylabel('Magnitude (dB)');                       % labels the y-axis

figure % Creates a new figure   
plot(x,phi,'r');                   % plots phase response against x
grid on                                         % Turns the grid ON
title('Phase Response of Designed Filter');     % Titles the plot
xlabel('Normalized Frequency (x π rad/sample)');% lebels the X-axis
ylabel('Phase (radians)');                      % labels the y-axis

