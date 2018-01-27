function [stressvalue, stressunit, arrayStrain, unitStrain, arrayTime, unitTime] = plotHueghs( folder, unitArea, valueArea, display )
%plotHueghs Plots the values from openTensileHueghs
%Uses either given strain or calculates with load and area
%   INPUT:
%       folder is the name of the folder created from openTensileHueghs
%       unitArea is the units for input area
%       valueArea is the value for the input area
%       display is boolean of if figures should show
    %%
    % Get list of files and load each
    files = dir([folder '/*.mat']);
    for i=1:numel(files)
        %%
        % Get proper value for stress
        load(fullfile(folder,files(i).name))
        if(exist('unitArea','var') || exist('valueArea','var'))
            stressvalue = arrayLoad ./ valueArea;
            stressunit = strcat(unitLoad,'/',unitArea);
        else
            stressvalue = arrayStress;
            stressunit = unitStress;
        end
        %%
        % Subplot each
        if display
        figure('Name','Strain and Stress','units','normalized','outerposition',[0 0 1 1])
        hold on
        subplot(1,3,1);
        plot(arrayTime,stressvalue);
        title('Stress Over Time');
        xlabel(unitTime);
        ylabel(stressunit);
        
        subplot(1,3,2);
        plot(arrayTime,arrayStrain);
        title('Strain Over Time');
        xlabel(unitTime);
        ylabel(unitStrain);
        
        subplot(1,3,3);
        plot(arrayStrain,stressvalue);
        title('Stress Over Strain');
        xlabel(unitStrain);
        ylabel(stressunit);
        hold off
        end
    end
end

