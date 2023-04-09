% PART II

% Please ensure that part.mat is in current directory/folder
load ('part2.mat'); % Loads the file "part2.mat",saves it in variable "y" by default
fs=1000;            % assigning the sampling frequency of the signal to "fs"
N=length(y);        % Length of signal is saved in variable "N"
df=fs/N;            % Divides the sampling frequency into the length of signal
w = (-(N/2):(N/2)-1)*df;  % Range of sample frequency expressed to length of signal(N) 

z = fftshift(fft(y,N));   % Calculates DFT of the signal & Shifts it to Center
plot(w,abs(z),'r');       % Plots the Magnitude of the Frequency components
ylabel('MAGNITUDE');      % Labels the y-axis
xlabel('FREQUENCY (Hz)'); % Labels the x-axis
title('FREQUENCY CONTENTS OF SIGNAL'); % titles the plot
grid on                   % Turns the grid on


