function [EXX,EYY,EXY,unit,stdEXX,stdEYY,stdEXY] = openNcorr_Image(name, cur, timeStart, timeEnd, rect)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       name is the file name
%       cur boolean if should use cur (otherwise, use ref)
%       timeStart, timeEnd are the range of frames to grab
%       rect is the interested grab area from an imcrop
%   OUTPUT:
%       EXX, EYY, EXY the average strains of x,y
%       units the ncorr strain units
    %%
    % Open Files
    load(name);
    %%
    % Format inputs
    img = imread('reference.jpeg');
    if ~exist('rect','var')
        [~,rect] = imcrop(img);
        close
    elseif length(rect) ~= 4
        fprintf('rect input must contain four inputs')
        [~,rect] = imcrop(img);
        close
    end
    [ynew,xnew] = size(data_dic_save.strains(1).plot_exx_cur_formatted);
    [y,x,~] = size(img);
    
    rect(1) = rect(1) * xnew / x;
    rect(2) = rect(2) * ynew / y;
    rect(3) = rect(3) * xnew / x;
    rect(4) = rect(4) * ynew / y;
    
    rect = round(rect);
    sizeValues = (rect(3) + 1) * (rect(4) + 1);
    
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
    stdEXX = zeros(1,sizeData);
    stdEYY = zeros(1,sizeData);
    stdEXY = zeros(1,sizeData);
    counter = 0;
    %%
    % Get strains
    if cur
        for t = timeStart:timeEnd
            counter = counter+1;    
            EXX(counter) = mean2(abs(data_dic_save.strains(t).plot_exx_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            EYY(counter) = mean2(abs(data_dic_save.strains(t).plot_eyy_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            EXY(counter) = mean2(abs(data_dic_save.strains(t).plot_exy_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEXX(counter) = std2(abs(data_dic_save.strains(t).plot_exx_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEYY(counter) = std2(abs(data_dic_save.strains(t).plot_eyy_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEXY(counter) = std2(abs(data_dic_save.strains(t).plot_exy_cur_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
        end
    else
        for t = timeStart:timeEnd
            counter = counter+1;    
            EXX(counter) = mean2(abs(data_dic_save.strains(t).plot_exx_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            EYY(counter) = mean2(abs(data_dic_save.strains(t).plot_eyy_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            EXY(counter) = mean2(abs(data_dic_save.strains(t).plot_exy_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEXX(counter) = std2(abs(data_dic_save.strains(t).plot_exx_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEYY(counter) = std2(abs(data_dic_save.strains(t).plot_eyy_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
            stdEXY(counter) = std2(abs(data_dic_save.strains(t).plot_exy_ref_formatted(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3))));
        end
    end
    EXX = EXX / sizeValues;
    EYY = EYY / sizeValues;
    EXY = EXY / sizeValues;
    
    unit = data_dic_save.dispinfo.units;
    unit = strcat(unit,'/',unit);
end