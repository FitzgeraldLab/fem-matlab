function [EXX,EYY,EXY,unit] = openNcorr(name, x, y)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       name is the file name
%       x, y interested x and y coordinate
%   OUTPUT:
%       EXX, EYY, EXY the strains at x,y
%       units the ncorr strain units
    %%
    % Open Files
    load(name);
    %%
    % Get strains
    size = length(data_dic_save.strains);
    EXX = zeros(1,size);
    EYY = zeros(1,size);
    EXY = zeros(1,size);
    for i = 1:size
        EXX(i) = data_dic_save.strains(i).plot_exx_ref_formatted(y,x);
        EYY(i) = data_dic_save.strains(i).plot_eyy_ref_formatted(y,x);
        EXY(i) = data_dic_save.strains(i).plot_exy_ref_formatted(y,x);
    end
    unit = data_dic_save.dispinfo.units;
    unit = strcat(unit,'/',unit);
end