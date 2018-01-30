function PreAnalyze( vidName, times, fileName, Name, Value )
%PREANALYZE This function loads the vidName video to prep it under times
%with a cell length of max.
%   INPUT:
%       vidName is the file name of the video
%       times is a n by 2 array of start and stop times
%       fileName is the name of the save folder
%       Name is the type of splitting
%       Value is the value for the splitting
%   OUTPUT:
    %%
    % Get size n from times
    [length,~] = size(times);
    start = times(1,1);
    stop = times(1,2);
    %%
    % Checks Name and Value
    if (strcmpi(Name,'fraction'))
        max = ceil((stop-start)/Value);
    elseif (strcmpi(Name,'step'))
        max = Value;
    end
    if (max > stop - start)
        vidCell = cell(1,1,stop - start);
    else
        vidCell = cell(1,1,max);
    end
    %%
    % Open video
    video = vision.VideoFileReader(vidName);
    %%
    % Create and open new file
    mkdir(fullfile(pwd,fileName));
    cd(fileName);
    %%
    % Initialize variable for video loop
    frame = 0;
    index = 1;
    pointer = 1;
    %%
    % Get video frame in loop
    while ~isDone(video)
        dif = stop-frame;
        image = step(video);
        image = im2uint8(image);
        %%
        % Check if frame number is start and is the first time appeared
        % Make that image the reference frame
        if ((frame == start) && (index == 1))
            [image,rect] = imcrop(image);
            n=0;
            reference = image;
            imwrite(reference,'reference.jpeg')
            close
        %%
        % If frame between start and stop, add to vidCell
        elseif (frame >= start && frame <= stop)
            image = imcrop(image,rect);
            n=n+1;
            vidCell{1,1,n} = image;
            %%
            % If vidCell fills to max size, save file and start again
            if((n == max) || (dif == 0))
                name = strcat('ready',int2str(pointer),'_',int2str(index));
                save(name,'reference','vidCell')
                index = index + 1;
                n = 0;
                if (dif > max)
                    vidCell = cell(1,1,max);
                else
                    vidCell = cell(1,1,dif);
                end
            end
        %%
        % If frame exends stop, get next times until reach end
        elseif (frame > stop)
            pointer = pointer + 1;
            if (pointer < length + 1)
                start = times(pointer,1);
                stop = times(pointer,2);
                if (strcmpi(Name,'fraction'))
                    max = ceil((stop-start)/Value)
                end
                if (max > stop - start)
                    vidCell = cell(1,1,stop - start);
                else
                    vidCell = cell(1,1,max);
                end
            else
                break;
            end
        end
        frame = frame + 1;
    end
    %%
    % Close and release video
    release(video);
    cd('..');
end

