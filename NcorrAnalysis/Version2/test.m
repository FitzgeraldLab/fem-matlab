%% Setup
% Add path to fem-matlab
addpath('/home/mstanley3/Documents/MATLAB/ImageProcessing/fem-matlab/NcorrAnalysis/Version2');
%%
% Add path of video file
videoPath = '/home/mstanley3/Desktop/Second Videos';
cd 
addpath(pwd);
%%
% Perform setup
PreAnalyze('slomo_1485922878.mov',[1,559;590,736;758,1152;1187,1294;
    1317,1795;1831,2411;2451,2983;3015,3865;3897,5636;5660,10993],50);
%PreAnalyze('slomo_1485926725.mov',[1,1881;1913,4086;4114,6789;6825,10170;
%    10215,13668],50);
%PreAnalyze('slomo_1485930001.mov',[1,1982;2004,2464],50);
