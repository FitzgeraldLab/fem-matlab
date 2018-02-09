function [EXX,EYY,EXY,unitStrain, arrayTime, unitTime] = plotNcorr(sampleName, sampleNum, x, y, cur, display)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       sampleName is the name ncorr and edgertronic file (with no extention)
%       sampleNum is the test number
%       x, y are the x and y corrdinates of the interested points
%       display is boolean of if figures should show
    %%
    % Create Trackers
    % Flag: 0 is init/restart, 1 is 2 line delay, 2 is start table, 3 is start numbers
    % Index: number of times numbers are saved
    % minguess: guess for minimum array size
    % array*: array of variable   
    %%
    % Get Edgertronic data
    [rate, unitTime] = openEdger(strcat(sampleName,'.txt'));
    %%
    % Get Ncorr Data
    cd(sampleName)
    files = dir(strcat('ncorr',int2str(sampleNum),'*.mat'));
    for i = 1:size(files)
        if (i == 1)
            [EXX,EYY,EXY,unitStrain] = openNcorr(files(i).name, x, y, cur);
        else
            [EXX2,EYY2,EXY2,~] = openNcorr(files(i), x, y, cur);
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
    if display
    figure('Name','Strain','units','normalized','outerposition',[0 0 1 1])
    hold on
    subplot(1,3,1);
    plot(arrayTime,EXX);
    title('Strain EXX Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    
    subplot(1,3,2);
    plot(arrayTime,EYY);
    title('Strain EYY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    
    subplot(1,3,3);
    plot(arrayTime,EXY);
    title('Strain EXY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    hold off
    end
end