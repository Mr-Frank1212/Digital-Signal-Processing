% PART I: (3)
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

load chirp;        % This Loads the chirp sound from the MATLAB
% by default chirp audio & its sampling rate are saved in variable y & Fs resp  
z=filter(Hd,y);    % Passes the chirp sound through filter and saves in z

figure 
spectrogram(y,70,50,250,Fs,'yaxis') % plots the spectrogram of the original chirp
ax = gca;                           % Return the current axis to ax
ax.FontSize = 18;                   % Increases the font of the axis

figure  
spectrogram(z,70,50,250,Fs,'yaxis'); % plots the spectrogram of filtered chirp
ax = gca;                            % Return the current axis to ax
ax.FontSize = 18;                    % Increases the font of the axis