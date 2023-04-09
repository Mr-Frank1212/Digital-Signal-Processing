% PART I: (4)
% Please Ensure the problem1-4.wav & this script file are in the same folder

% Below, The 'audioread' function reads the audio file and saves the signal & ... 
% sample rate in variable 'Data' and 'Data_fs' repectfully
[Data,Data_fs]= audioread('problem1-4.wav');                

%Observing the Magnitude of the Frequency Contents of Audio signal
N=length(Data);           % Size of sound is saved in N
df=Data_fs/N;             % divides the sampling rate by signal length, saved in variable df
w = (-(N/2):(N/2)-1)*df;  % Range of sample frequency expressed to have length of signal N 
y = fftshift(fft(Data,N));% calculates DFT of the Audio signal and Shifts to Center
plot(w,abs(y));           % Plots the Magnitude of the Frequency components of the signal
ylabel('MAGNITUDE');      % labels ths y-axis
xlabel('FREQUENCY');      % label the x-axis
title('AUDIO FREQUENCY CONTENT'); % titles the plot
grid on                   % Turns On the grid of the plot

% Designing a Butterworth Lowpass Filter to Pass frequency of 0 to 1400Hz
% Declaring filter parameters (frequency values are in Hertz)
Fs = Data_fs;          % Sampling Frequency
Fpass = 700;         % Passband Frequency
Fstop = 1400;        % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 90;          % Stopband Attenuation (dB)
match = 'passband';  % Band to match exactly
% Butterworth Lowpass filter designed using filterDesigner tool

% 'h'below, Designs the lowpass filter with the set frequency and dB values
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);

%Sets the filter type & order, and assigns the complete filter design to Hd
Hd = design(h, 'butter', 'MatchExactly', match); 

z=filter(Hd,Data);    % Applies the filter to the audio signal 
sound(z,Data_fs);     % Sounds the filtered sound      