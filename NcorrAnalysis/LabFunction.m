function [handles_ncorr, vidCell] = LabFunction( vidLoc, vidType, backName, calibrateName, checkerLength, boardLength, current, divCal )
%The purpose of this function is to have one file to perform the lab
%   

    addpath('/home/mstanley3/Documents/MATLAB/dic')
    addpath('/home/mstanley3/Documents/MATLAB/ImageProcessing/TestVids')
    handles_ncorr = ncorr;
    
    vidCell = Folder2Img(vidLoc, vidType);
    vidRef = FindROI(vidCell);
    if ~strcmp(backName, '')
        vidCell2 = RemoveBackground(vidCell,backName);
    end
    
    if ~strcmp(calibrateName, '')
        [param, lengthConvert] = GetCalibration(calibrateName, checkerLength, boardLength, current, divCal);
        vidCell = CalibrateImages(vidCell,param);
        vidCell2 = CalibrateImages(vidCell2,param);
        vidROI = FindROI(vidCell2);
        image1ROI = vidROI{1,1,1};
    end
    
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

