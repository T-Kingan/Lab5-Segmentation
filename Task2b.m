clear all;
close all;

% Define thresholds for each method
thresholds = struct();
thresholds.sobel = [0.05, 0.1, 0.15]; % Example thresholds for Sobel
thresholds.log = [0.02, 0.03, 0.04]; % Example thresholds for LoG
thresholds.canny = [0.1, 0.2, 0.3]; % Example thresholds for Canny

% Read the images
f = imread('assets/circuit_rotated.tif'); % circuits
g = imread('assets/brain_tumor.jpg'); % brain tumor

% Perform edge detection with different thresholds
performEdgeDetectionWithThresholds(f, thresholds, 'Circuits - Different Thresholds');
performEdgeDetectionWithThresholds(g, thresholds, 'Brain Tumor - Different Thresholds');


% Function to perform edge detection with specified thresholds
function performEdgeDetectionWithThresholds(img, thresholds, titleText)
    methods = {'sobel', 'log', 'canny'};
    
    % Preallocate a cell array for the edge-detected images
    edgeImages = cell(1, length(methods) * length(thresholds.sobel));
    
    idx = 1; % Index for storing images in edgeImages
    % Loop through each method
    for i = 1:length(methods)
        method = methods{i};
        % Apply edge detection for each threshold
        for threshold = thresholds.(method)
            edgeDetectedImg = edge(img, method, threshold);
            edgeImages{idx} = edgeDetectedImg;
            idx = idx + 1;
        end
    end
    
    % Display the original and the edge-detected images in a montage
    figure, montage([{img}, edgeImages], 'Size', [1, idx]);
    title(titleText);
end

