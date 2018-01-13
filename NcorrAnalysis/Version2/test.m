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
PreAnalyze(name,[1,563;755,1155;1314,1798;1825,2420; ...
            2450,2986;3012,3868;3894,5633;5660,11179; ...
            14131,14943],FRAMESPLIT);

name = 'sample8.mov';
%First two for sample 8, third for sample 9, all chordwise
PreAnalyze(name,[1,1983;2001,2468;4480,5510],FRAMESPLIT);

name = 'sample6.mov';
%All for sample 6
PreAnalyze(name,[1,1880;1909,4082;4116,6794;6825,10169; ...
            10212,10403;10808,13812],FRAMESPLIT);
