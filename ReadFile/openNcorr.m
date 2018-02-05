function [EXX,EYY,EXY,unit] = openNcorr(name, x, y, cur)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       name is the file name
%       x, y interested x and y coordinate
%       formatted boolean if should use cur (otherwise, use ref)
%   OUTPUT:
%       EXX, EYY, EXY the strains at x,y
%       units the ncorr strain units
    %%
    % Open Files
    load(name);
    %%
    % Format inputs
    if length(x) < length(y)
        sizeValues = length(x);
    else
        sizeValues = length(y);
    end
    
    if ~exist('cur','var')
        cur = 0;
    end
    %%
    % Get strains
    sizeData = length(data_dic_save.strains);
    EXX = zeros(1,sizeData);
    EYY = zeros(1,sizeData);
    EXY = zeros(1,sizeData);
    if cur
        for i = 1:sizeData
            for j = sizeValues
                EXX(i) = EXX(i) + data_dic_save.strains(i).plot_exx_cur_formatted(y(j),x(j));
                EYY(i) = EYY(i) + data_dic_save.strains(i).plot_eyy_cur_formatted(y(j),x(j));
                EXY(i) = EXY(i) + data_dic_save.strains(i).plot_exy_cur_formatted(y(j),x(j));
            end
        end
    else
        for i = 1:sizeData
            for j = sizeValues
                EXX(i) = EXX(i) + data_dic_save.strains(i).plot_exx_ref_formatted(y(j),x(j));
                EYY(i) = EYY(i) + data_dic_save.strains(i).plot_eyy_ref_formatted(y(j),x(j));
                EXY(i) = EXY(i) + data_dic_save.strains(i).plot_exy_ref_formatted(y(j),x(j));
            end
        end
    end
    unit = data_dic_save.dispinfo.units;
    unit = strcat(unit,'/',unit);
end