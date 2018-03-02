function [EXX,EYY,EXY,unitStrain, arrayTime, unitTime] = plotNcorr(sampleName, sampleNum, cur, timeStart, timeEnd, rect)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       sampleName is the name ncorr and edgertronic file (with no extention)
%       sampleNum is the test number
%       x, y are the x and y corrdinates of the interested points
%       display is boolean of if figures should show
    %%
    % Get Edgertronic data
    [rate, unitTime] = openEdger(strcat(sampleName,'.txt'));
    %%
    % Get Ncorr Data
    cd(sampleName)
    files = dir(strcat('ncorr',int2str(sampleNum),'*.mat'));
    for i = 1:size(files)
        if (i == 1)
            if~exist('cur','var')
                [EXX,EYY,EXY,unitStrain] = openNcorr_Image(files(i).name);
            elseif~exist('timeEnd','var')
                [EXX,EYY,EXY,unitStrain] = openNcorr_Image(files(i).name, cur);
            elseif~exist('rect','var')
                [EXX,EYY,EXY,unitStrain] = openNcorr_Image(files(i).name, cur, timeStart, timeEnd);
            else
                [EXX,EYY,EXY,unitStrain] = openNcorr_Image(files(i).name, cur, timeStart, timeEnd, rect);
            end
        else
            if~exist('cur','var')
                [EXX2,EYY2,EXY2,~] = openNcorr(files(i).name, x, y);
            elseif~exist('timeStart','var')
                [EXX2,EYY2,EXY2,~] = openNcorr(files(i).name, x, y, cur);
            else
                [EXX2,EYY2,EXY2,~] = openNcorr(files(i).name, x, y, cur, timeStart, timeEnd);
            end
            EXX = [EXX EXX2];
            EYY = [EYY EYY2];
            EXY = [EXY EXY2];
        end
    end
    cd('..')
    %%
    % Make Time Array
    arrayTime = 0:rate:((length(EXX)-1)*rate);
    %%
    % Subplot each
    figure('Name','Strain','units','normalized','outerposition',[0 0 1 1])
    hold on
    subplot(1,3,1);
    scatter(arrayTime,EXX);
    title('Strain EXX Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    
    subplot(1,3,2);
    scatter(arrayTime,EYY);
    title('Strain EYY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    
    subplot(1,3,3);
    scatter(arrayTime,EXY);
    title('Strain EXY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    hold off
end