function [ vidStruct ] = LabFunction( calibrateName, checkerLength, boardLength )
%The purpose of this function is to have one file to perform the lab
%   

    addpath('DIC')
    handles_ncorr = ncorr;
    if exist('vidInfo.mat','file')
        load('vidInfo.mat');
    elseif ~exist('vidStruct', 'var')
        vidStruct = struct('image',{}, 'roi',{}, );
    end
    if  isempty(vidStruct.image)
        vidStruct = Vid2Img( vidname, vidStruct);
        vidStruct = RemoveBackground(vidStruct,backName);
        [param, lengthConvert] = GetCalibration(calibrateName, checkerLength, boardLength);
        vidStruct = CalibrateImages(vidStruct,param);
    end
    if isempty(vidStruct.roi)
        vidStruct = FindROI(vidStruct);
    end
    
    %%Ncorr Commands
    handles_ncorr.set_ref(vidStruct(1).image);
    handles_ncorr.set
    
end

