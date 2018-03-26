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
    for i = length(polyXX(:,1)):-1:1
        valXX(i,:) = getPolyfit(polyXX(i,:),arrayTime);
        valYY(i,:) = getPolyfit(polyYY(i,:),arrayTime);
        valXY(i,:) = getPolyfit(polyXY(i,:),arrayTime);
    
        valXXLim = [0,max(EXX)*1.01];
        valYYLim = [0,max(EYY)*1.01];
        valXYLim = [0,max(EXY)*1.01];
    end
    %%
    % Subplot each
    figure('Name','Strain','units','normalized','outerposition',[0 0 1 1])
    subplot(1,3,1);
    scatter(arrayTime,EXX);
    hold on
    plot(arrayTime,valXX);
    title('Strain EXX Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valXXLim)
    hold off
    
    subplot(1,3,2);
    scatter(arrayTime,EYY);
    hold on
    plot(arrayTime,valYY);
    title('Strain EYY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valYYLim)
    hold off
    
    subplot(1,3,3);
    scatter(arrayTime,EXY);
    hold on
    plot(arrayTime,valXY);
    title('Strain EXY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valXYLim)
    hold off
end

function [val] = getPolyfit(poly,x)
    %getPolyfit returns values for poly at x
    % assuming linear rising polyfit
    flag = 0;
    for i = length(x):-1:1
        val(:,i) = polyval(poly,x(i));
    end
end