function [I2,img] = part31(imgFilename,n) 
%PART III: (1)
%{
This fuction takes in as input arguement, the 'filename' & integer'n'(0<n<65), 
Where 'n' is the number of last coefficients set to zero, and gives as output
arguement the reconstructed image and original image. follow steps below.
Step 1:Ensure the 512x512 picture & this script file are in the same folder
Step 2:Run function with the arguements. eg: "part33('boat.512.tiff',60)"
%}
img=imread (imgFilename);% Reads & store image file 'imgFilename'in img
img=im2double(img);      % Translates'img'which is an integer, to double... 
                         % precision, by rescaling it in the range [0, 1].
A = dctmtx(8); % Calculates a discrete cosine transform matrix of 8 X 8

% Create a function 'Dct2' with arguement 'img_blocks', that calulates ...
% 2-DCT of image in MATRIX form (AxA').                
Dct2 = @(img_blocks) A * img_blocks.data * A'; 

% Divide the image 'img' into 8 X 8 matrix blocks and processing each ...
% block through the created function 'DCT2', saves the results in B.
B = blockproc(img,[8 8],Dct2);

% The below are vectors of the rows "i" & columns "j" representing positions
% /index of an 8x8 matrix, while scanning the matrix in a zigzag manner
i = [1 1 2 3 2 1 1 2 3 4 5 4 3 2 1 1 2 3 4 5 6 7 6 5 4 3 2 1 1 2 3 4 ...
    5 6 7 8 8 7 6 5 4 3 2 3 4 5 6 7 8 8 7 6 5 4 5 6 7 8 8 7 6 7 8 8];
j = [1 2 1 1 2 3 4 3 2 1 1 2 3 4 5 6 5 4 3 2 1 1 2 3 4 5 6 7 8 7 6 5 ...
    4 3 2 1 2 3 4 5 6 7 8 8 7 6 5 4 3 4 5 6 7 8 8 7 6 5 6 7 8 8 7 8];
p=64-n;                % Number of coefficients to set to'1'stored in 'p'
if (0<n)&&(n<65)       % Nhecks if the 'n' is valid within allowed limits
    mask=zeros(8);     % Creates an 8x8 matrix of zeros '0' called mask 
    for ct = 1:p       % loop that counts from 1 to 'P'
        mask(i(ct),j(ct))=1; % Assigns a 1 to the respective 'mask' index
    end
    % Divides B into 8x8 blocks and passess each block into a function ...
    % that multiplies it with the created mask. this sets the last ...
    % 'n' coeficient to zero
    B2 = blockproc(B,[8 8],@(imgg_blocks) mask .* imgg_blocks.data);
        
    % Create a function that Calculates IDCT in MATRIX form (A'xA)  
    invdct = @(block_struct) A' * block_struct.data * A;
 
    I2 = blockproc(B2,[8 8],invdct);  % Applies B2 to the IDCT function
    
    figure
    subplot(1,2,1); % Divides figure into 1 x 2 block and selects index 1
    imshow(img)                       % Displays the Original image
    title('Original Image');          % Titles the image 
    subplot(1,2,2); % Divides figure into 1 x 2 block and selects index 2
    imshow(I2)                        % Displays the Reconstructed image
    % Below Titles image with corresponding 'n'
    title(['Reconstructed Image for n = ',num2str(n)]);
    %disp(mask);          % Uncomment this to see the created 'mask' matrix
else 
    % Displays a statement if chosen 'n' is out of expected range 0<n<65 
    disp('PLEASE SELECT "n" WITHIN RANGE 0<n<65');
end 