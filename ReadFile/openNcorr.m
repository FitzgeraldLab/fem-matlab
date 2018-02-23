function [EXX,EYY,EXY,unit] = openNcorr(name, x, y, cur, timeStart, timeEnd)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       name is the file name
%       x, y interested x and y coordinate
%       cur boolean if should use cur (otherwise, use ref)
%       timeStart, timeEnd are the range of frames to grab
%   OUTPUT:
%       EXX, EYY, EXY the average strains of x,y
%       units the ncorr strain units
    %%
    % Open Files
    load(name);
    %%
    % Format inputs
    if length(x) < length(y)
        sizeValues = length(x);
    else        sizeValues = length(y);
        sizeValues = length(y);
    end
    
    if ~exist('cur','var')
        cur = 0;
    end
    %%
    % Get gathering info
    if~exist('timeEnd','var')
        timeStart = 1;
        timeEnd = length(data_dic_save.strains);
    end
    sizeData = timeEnd-timeStart + 1;
    EXX = zeros(1,sizeData);
    EYY = zeros(1,sizeData);
    EXY = zeros(1,sizeData);
    counter = 0;
    %%
    % Get strains
    if cur
        for i = timeStart:timeEnd
            counter = counter+1;
            for j = 1:sizeValues
                EXX(counter) = EXX(counter) + data_dic_save.strains(i).plot_exx_cur_formatted(y(j),x(j));
                EYY(counter) = EYY(counter) + data_dic_save.strains(i).plot_eyy_cur_formatted(y(j),x(j));
                EXY(counter) = EXY(counter) + data_dic_save.strains(i).plot_exy_cur_formatted(y(j),x(j));
            end
        end
    else
        for i = timeStart:timeEnd
            counter = counter+1;
            for j = sizeValues
                EXX(counter) = EXX(counter) + data_dic_save.strains(i).plot_exx_ref_formatted(y(j),x(j));
                EYY(counter) = EYY(counter) + data_dic_save.strains(i).plot_eyy_ref_formatted(y(j),x(j));
                EXY(counter) = EXY(counter) + data_dic_save.strains(i).plot_exy_ref_formatted(y(j),x(j));
            end
        end
    end
    EXX = EXX / sizeValues;
    EYY = EYY / sizeValues;
    EXY = EXY / sizeValues;
    
    unit = data_dic_save.dispinfo.units;
    unit = strcat(unit,'/',unit);
end