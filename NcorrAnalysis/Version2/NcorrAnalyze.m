function handles = NcorrAnalyze( saveName )
%NCORRANALYZE Begins the ncorr setup
%   INPUT:
%       saveName is the name of saved PreAnalyze file
%   OUTPUT:
%       handles is the ncorr file
    %%
    % Make sure no reference or vidCell video
    clear reference vidCell
    %%
    % Load the file with reference and vidCell
    load(saveName);
    %%
    % Make sure the path to ncorr is available
    addpath('/home/mstanley3/Documents/MATLAB/ncorr_v1_2_1')
    %%
    % Setup ncorr
    handles = ncorr;
    handles.set_ref(reference);
    handles.set_cur(vidCell);
end

