function openTensileHueghs(fileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %%
    % Create Trackers
    % Flag: 0 is init/restart, 1 is 2 line delay, 2 is start table, 3 is start numbers
    % Index: number of times numbers are saved
    % minguess: guess for minimum array size
    % array*: array of variable
    Flag = 0;
    Index = 0;
    minguess = 200;
    countFlag = 0;
    
    arrayStrain = zeros(1,minguess);
    arrayStress = zeros(1,minguess);
    arrayLoad = zeros(1,minguess);
    arrayExtension = zeros(1,minguess);
    arrayTime = zeros(1,minguess);
    %%
    % Open File
    File = fopen(fileName,'r');
    %%
    % Create and open new file
    fileName = fileName(1:end-4);
    mkdir(fullfile(pwd,fileName));
    cd(fileName);
    %%
    % Read Line Loop
    while ~feof(File)
        line = fgets(File);
        countFlag = countFlag +1;
        if (countFlag > 231)
            display(line);
            display('pause');
        end
        if (Flag == 0)
            if(strcmp('"Channel Data"',line))
                Flag = 1;
                n = 2;
            end
        elseif (Flag == 1)
            if n
                n = n - 1;
            else
                Flag = 2;
            end
        elseif (Flag == 2)
            Array = strsplit(line,',');
            unitStrain = Array(1);
            unitStress = Array(2);
            unitLoad = Array(3);
            unitExtension = Array(4);
            unitTime = Array(5);
            
            Flag = 3;
            n = 0;
        elseif (Flag == 3)
            if (strcmp('',line))
                Flag = 0;
                fileName = strcat('TensileTest',num2str(Index));
                save(fileName, 'unitStrain', 'unitStress', 'unitLoad', 'unitExtension', ...
                'unitTime', 'arrayStrain', 'arrayStress', 'arrayLoad','arrayExtension','arrayTime');
            else
                n = n + 1;
                Array = strsplit(line,',');
                arrayStrain(n) = str2double(Array(1));
                arrayStress(n) = str2double(Array(2));
                arrayLoad(n) = str2double(Array(3));
                arrayExtension(n) = str2double(Array(4));
                arrayTime(n) = str2double(Array(5));
            end
        end
    end
    %%
    % Close File
    fclose(File);
end

