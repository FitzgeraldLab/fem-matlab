function [ output ] = LabFunction( calibrateName, checkerLength, boardLength )
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
    
end

