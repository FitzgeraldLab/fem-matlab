%% Setup
% Add path to fem-matlab
addpath('/home/mstanley3/Documents/MATLAB/ImageProcessing/fem-matlab/NcorrAnalysis/Version2');

FRAMESPLIT = 60;
%%
% Add path of video file

%videoPath1 = '/home/mstanley3/Desktop/Second Videos';
videoPath2 = '/home/mstanley3/Desktop/Second Videos';
cd(videoPath2)
%%
% Perform setup
name = 'sample2.mov';
%Last section for sample 3 instead of sample 2
PreAnalyze(name,[755,1155;1314,1798;1825,2420; ...
            2450,2986;3012,3868;3894,5633;5660,11179],'sample2','fraction',10);