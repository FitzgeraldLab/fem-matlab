function [rate, unit] = openEdger(name)
%openTensileHueghs Takes text file from Hueghs and converts to readible file
%   INPUT:
%       name is the file name
    %%
    % Open File
    File = fopen(strcat(name,'.txt'),'r');
    %%
    % Read Line Loop
    count = 1;
    while ~feof(File)
        line = fgetl(File);
        if (count == 4)
            lines = split(line);
            rate = 1 / str2double(lines(3));
            units = split(lines(4),'/');
            unit = units(2);
            break;
        end
        count = count + 1;
    end
    %%
    % Close File
    fclose(File);
end