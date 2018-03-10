function [EXX,EYY,EXY,polyXX,polyYY,polyXY,unitStrain,stdEXX,stdEYY,stdEXY,mseXX,mseYY,mseXY,arrayTime,unitTime] = plotNcorr_data( Name )
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       sampleName is the name ncorr and edgertronic file (with no extention)
%       sampleNum is the test number
%       x, y are the x and y corrdinates of the interested points
%       display is boolean of if figures should show
    %%
    % Load Data
    load(Name)
    %%
    % Get polyval
    [valXX,sizeXX] = getPolyfit(polyXX,arrayTime,1.01*max(EXX));
    [valYY,sizeYY] = getPolyfit(polyYY,arrayTime,1.01*max(EYY));
    [valXY,sizeXY] = getPolyfit(polyXY,arrayTime,1.01*max(EXY));
    %%
    % Subplot each
    figure('Name','Strain','units','normalized','outerposition',[0 0 1 1])
    subplot(1,3,1);
    scatter(arrayTime,EXX);
    hold on
    plot(arrayTime(1:sizeXX),valXX);
    title('Strain EXX Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    hold off
    
    subplot(1,3,2);
    scatter(arrayTime,EYY);
    hold on
    plot(arrayTime(1:sizeYY),valYY);
    title('Strain EYY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    hold off
    
    subplot(1,3,3);
    scatter(arrayTime,EXY);
    hold on
    plot(arrayTime(1:sizeXY),valXY);
    title('Strain EXY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    hold off
end

function [val,cap] = getPolyfit(poly,x,maximum)
    %getPolyfit returns values for poly at x that are below maximum
    % assuming linear polyfit
    flag = 0;
    for i = length(x):-1:1
        tempVal = polyval(poly,x(i));
        if tempVal < maximum && ~flag
            cap = i;
            val(i) = tempVal;
            flag = 1;
        elseif flag
            val(i) = tempVal;
        end
    end
end