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
    numSize = length(polyXX(:,1));
    for i = numSize:-1:1
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
    scatter(arrayTime,EXX,'DisplayName','Strain Points');
    hold on
    for i = numSize:-1:1
        name = [num2str(polyXX(i,1)) '*t + ' num2str(polyXX(i,2))];
        plot(arrayTime,valXX(i,:),'DisplayName',name);
    end
    title('Strain EXX Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valXXLim)
    legend('show','Location','southeast')
    hold off
    
    subplot(1,3,2);
    scatter(arrayTime,EYY,'DisplayName','Strain Points');
    hold on
    for i = numSize:-1:1
        name = [num2str(polyYY(i,1)) '*t + ' num2str(polyYY(i,2))];
        plot(arrayTime,valYY(i,:),'DisplayName',name);
    end
    title('Strain EYY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valYYLim)
    legend('show','Location','southeast')
    hold off
    
    subplot(1,3,3);
    scatter(arrayTime,EXY,'DisplayName','Strain Points');
    hold on
    for i = numSize:-1:1
        name = [num2str(polyXY(i,1)) '*t + ' num2str(polyXY(i,2))];
        plot(arrayTime,valXY(i,:),'DisplayName',name);
    end
    title('Strain EXY Over Time');
    xlabel(unitTime);
    ylabel(unitStrain);
    ylim(valXYLim)
    legend('show','Location','southeast')
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