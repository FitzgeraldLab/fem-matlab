function SaveInfo(vidCell, loc)
%The purpose of this function is to save the values from process so that they do not need to be recalculated
%   Input:  handles_ncorr: the strain data from dic
%           vidCell(cell): the frames used for image correlation
%           loc(string): location for saving the file

    if strcmp(loc, '')
        loc = pwd;
    end

    saveNameVid = fullfile(loc,'dicSaveVid.mat');
    save(saveNameVid, 'vidCell');

end

