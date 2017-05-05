function handles = NcorrAnalyze( 'saveName' )
%NCORRANALYZE Summary of this function goes here
%   Detailed explanation goes here

    load('saveName');
    
    addpath('/home/mstanley3/Documents/MATLAB/dic')
    
    handles = ncorr;
    handles.set_ref(referenece);
    handles.set_cur(vidCell);

end

