function [ handles,vidCell ] = performDIC( vidName )
%PERFORMDIC Summary of this function goes here
%   Detailed explanation goes here
    vidCell = Vid2Img(vidName);
    vidCell = cropImages(vidCell);
    
    handles = ncorr;
    image1 = vidCell{1,1,1};
    vidCell(:,:,1) = [];
    
    %%Ncorr Commands
    handles_ncorr.set_ref(image1);
    handles_ncorr.set_cur(vidCell);
    if ~strcmp(calibrateName, '')
        handles_ncorr.set_roi_ref(image1ROI);
        handles_ncorr.set_roi_cur(vidROI);
    
        if length(lengthConvert) == 1
            message = 'Use the following as the pixel to length conversion: ' + int2str(lengthConvert);
            disp(message)
        else
            message = 'Use the following as the pixel to length conversion along x axis: ' + int2str(lengthConver(1));
            disp(message)
            message = 'Use the following as the pixel to length conversion along y axis: ' + int2str(lengthConver(2));
            disp(message)
        end
    end
    
end
