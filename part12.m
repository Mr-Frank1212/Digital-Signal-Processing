% PART I: (2)
% The Filter used here is as designed in PART I: (1)
% Declaring filter parameters (frequency values are in Hertz).
fs = 10000;          % Sampling Frequency
Fpass = 500;         % Passband Frequency
Fstop = 800;         % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 90;          % Stopband Attenuation (dB)
match = 'passband';  % Band to match exactly
% Butterworth Lowpass filter designed using filterDesigner tool
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, fs);
Hd = design(h, 'butter', 'MatchExactly', match);

load chirp;           % This Loads the chirp sound from the MATLAB
% by default chirp audio & its sampling rate are saved in variable y & Fs resp  
N=length(y);          % Saves the length OF chirp signal in N
t=linspace(0,1.6,N);  % sets the x-axis to length of N/Fs=1.6 by N points
z=filter(Hd,y);       % Passes the chirp sound through filter

sound(z);             % plays/sounds the filtered signal
%sound(y); % Uncomment "sound(y)" to listen to the original signal

subplot(2,1,1);        % Divides the figure into 2 x 1, and selects row 1 
plot (t,z,'r');        % Plots the filtered signal 'z' in red
grid on                % Turns on the grid of the plot
title('Plot of Filtered Chirp Audio') % Titles the plot 
ylabel('Amplitude of Filtered Signal')% labels the y-axis
xlabel('Time (seconds)');             % labels the x-axis

subplot(2,1,2);         % Divides the figure into 2 x 1, and selects row 2
plot (t,y,'b');         % Plots the Unfiltered signal 'y'in blue
grid on                 % Turns on the grid of the plot
title('Plot of Original Chirp Audio') % Titles the plot
ylabel('Amplitude of Original Chirp Signal') % labels the y-axis
xlabel('Time (seconds)');                    % labels the x-axis