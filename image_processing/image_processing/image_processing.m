
%Subject: Image Processing & Recognition

%Damla GOKTAS

%Exercises part I-2

%TASK 1
% Create a 3x2 matrix to represent the pixels
pixels = zeros(3, 2, 3,'uint8'); % 3 rows, 2 columns, 3 channels (RGB)

% Define the colors for each pixel
pixels(1, 1, 1) = 255;       % Red
pixels(1, 2, 2) =  255;       % Green
pixels(2, 1, :) =  255;   % White
pixels(2, 2, :) = 0;         % Black
pixels(3, 1, :) = [255, 255, 0];     % Yellow
pixels(3,2, :) = 128;   % Gray

% Display the image
figure,imagesc(uint8(pixels));




%TASK 2

% Load the color image
rgbImage = imread('butterfly.jpg');

% Method 1: Using arithmetic mean of RGB components
grayImage_arithmetic = uint8(mean(rgbImage, 3));

% Method 2: Using weighted factors
grayImage_weighted = uint8(0.2989 * double(rgbImage(:,:,1)) + 0.5870 * double(rgbImage(:,:,2)) + 0.1140 * double(rgbImage(:,:,3)));

% Display the original image and grayscale images side by side
figure;
subplot(1, 3, 1);
imshow(rgbImage);
title('Original Image');

subplot(1, 3, 2);
imshow(grayImage_arithmetic);
title('Grayscale (Arithmetic Mean)');  

subplot(1, 3, 3);
imshow(grayImage_weighted);
title('Grayscale (Weighted Factors)');


%TASK 3
% Load the grayscale image
grayImage = imread('butterfly.jpg');

% If the image is color, convert it to grayscale
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end

% Calculate histogram using 256 bins
histogram_custom = histcounts(grayImage(:), 256, 'Normalization', 'probability');

% Calculate histogram using imhist() function
histogram_builtin = imhist(grayImage, 256);

% Plot histograms
figure;
subplot(1, 2, 1);
bar(0:255, histogram_custom);
title('Custom Histogram (256 Bins)');
xlabel('Pixel Intensity');
ylabel('Probability');

subplot(1, 2, 2);
bar(0:255, histogram_builtin);
title('imhist() Function Histogram (256 Bins)');
xlabel('Pixel Intensity');
ylabel('Frequency');

%TASK4
% Load the grayscale image
grayImage = imread('butterfly.jpg');

% If the image is color, convert it to grayscale
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end

% Display the original image
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

% Perform histogram stretching
min_intensity = min(grayImage(:));  % Find minimum intensity
max_intensity = max(grayImage(:));  % Find maximum intensity

stretchedImage = uint8(((grayImage) - min_intensity) / (max_intensity - min_intensity) * 255);

% Display the stretched image
subplot(1, 2, 2);
imshow(stretchedImage);
title('Stretched Image');

% Compute histograms
num_bins = 256;
original_hist = zeros(1, num_bins);
stretched_hist = zeros(1, num_bins);

% Compute histogram for the original image
for intensity = 0:num_bins-1
    original_hist(intensity+1) = sum(grayImage(:) == intensity);
end

% Compute histogram for the stretched image
for intensity = 0:num_bins-1
    stretched_hist(intensity+1) = sum(stretchedImage(:) == intensity);
end

% Display histograms for comparison
figure;
subplot(1, 2, 1);
bar(0:num_bins-1, original_hist);
title('Original Histogram');

subplot(1, 2, 2);
bar(0:num_bins-1, stretched_hist);
title('Stretched Histogram');



%TASK 5
% Load the grayscale image
grayImage = imread('butterfly.jpg');

% If the image is color, convert it to grayscale
if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end

% Display the original image
figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

% Perform histogram equalization
equalizedImage = histeq(grayImage);

% Display the equalized image
subplot(1, 2, 2);
imshow(equalizedImage);
title('Equalized Image');

% Calculate histograms for comparison
num_bins = 256;
original_hist = zeros(1, num_bins);
equalized_hist = zeros(1, num_bins);

% Compute histogram for the original image
for intensity = 0:num_bins-1
    original_hist(intensity+1) = sum(grayImage(:) == intensity);
end

% Compute histogram for the equalized image
for intensity = 0:num_bins-1
    equalized_hist(intensity+1) = sum(equalizedImage(:) == intensity);
end

% Display histograms for comparison
figure;
subplot(1, 2, 1);
bar(0:num_bins-1, original_hist);
title('Original Histogram');

subplot(1, 2, 2);
bar(0:num_bins-1, equalized_hist);
title('Equalized Histogram');





