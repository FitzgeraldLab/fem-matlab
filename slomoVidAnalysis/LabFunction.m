function [ output ] = LabFunction( vidname, backName, calibrateName, checkerLength, boardLength )
%The purpose of this function is to have one file to perform the lab
%   

    addpath('DIC')
    handles_ncorr = ncorr;
    if exist('vidInfo.mat','file')
        load('vidInfo.mat');
    end
    if  ~exist('vidCell','var')
        vidCell = Vid2Img( vidname);
        vidCell = RemoveBackground(vidCell,backName);
        [param, lengthConvert] = GetCalibration(calibrateName, checkerLength, boardLength);
        vidCell = CalibrateImages(vidCell,param);
    end
    if isempty(vidCell.roi)
        vidROI = FindROI(vidCell);
    end
    
    %%Ncorr Commands
    handles_ncorr.set_ref(vidCell(:,:,1));
    handles_ncorr.set_cur(vidCell);
    handles_ncorr.set_roi_ref(vidROI(:,:,1));
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

