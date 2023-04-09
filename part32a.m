%   PART III: (2)
%{
This script calculates and plots the peak signal-to-noise ratio and ...
structural similarity index. displays both original and reconstructed
image for each 'n' value.
NOTE: Ensure the 'boat.512.tiff'image and the fuction'part31' from the previous 
part, are in the current folder. 
%}
n=[ 2 4 8 32 64 ]; % vector of the given n values
PSNR= zeros(1,length(n));% Preallocating an empty vector to PSNR, for speed 
SSIM= zeros(1,length(n));% Preallocating an empty vector to SSIM, for speed
for i= 1:5         % Counts/loops from 1 to 5
    % Saves the reconstructed and original image of the function 'part31'...
    % in variable 'I2' and 'img' respectively
    [I2,img]=part31('boat.512.tiff',n(i)); 
    % The below code populates the empty PSNR and SSIM array by using the
    % corresponding calculated psnr and ssim values.
    PSNR(i) = psnr(I2,img);       % Saves PSNR values in peaksnr vector
    SSIM(i) = ssim(I2,img);       % Saves SSIM values in ssimval vector
end                               % end of loop
figure
subplot(2,1,1);    % Divides figure into a 2x1 block, selects position 1   
plot (n,PSNR,'r-*')% Plot the filled 'PSNR' value against corresponding 'n'
title ('PEAK SIGNAL TO NOISE RATIO'); % Titles the plot
ylabel('PSNR (dB)');                  % Labels the vertical axis
xlabel('"n" coeffients set to zero'); % Labels the horizontal axis
grid on                               % Turns the grid ON

subplot(2,1,2);     % Divides figure into a 2x1 block, selects position 2  
plot (n,SSIM,'b--o')% Plot the filled 'SSM' value against corresponding 'n'
title ('STRUCTURAL SIMILARITY INDEX');% Titles the plot
ylabel('SSIM');                       % Labels the vertical axis
xlabel('"n" coeffients set to zero'); % Labels the horizontal axis
grid on                               % Turns the grid ON

