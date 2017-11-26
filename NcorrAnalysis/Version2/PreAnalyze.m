function PreAnalyze( vidName, times, max )
%PREANALYZE This function loads the vidName video to prep it under times
%with a cell length of max.
%   INPUT:
%       vidName is the file name of the video
%       times is a n by 2 array of start and stop times
%       max is the max number of frames per section
%   OUTPUT:
    %%
    % Get size n from times
    [length,~] = size(times);
    start = times(1,1);
    stop = times(1,2);
    %%
    % Give value for max if not exist
    if (~exist('max')) %#ok<EXIST>
        max = fix((stop-start),10);
    elseif (max > stop - start)
        max = stop - start - 1;
    end
    %%
    % Open video
    video = vision.VideoFileReader(vidName);
    %%
    % Create and open new file
    fileName = vidName(1:end-4);
    mkdir(fullfile(pwd,fileName));
    cd(fileName);
    %%
    % Initialize variable for video loop
    frame = 0;
    index = 1;
    pointer = 1;
    vidCell = cell(1,1,max);
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
        %%
        % If frame between start and stop, add to vidCell
        elseif (frame >= start && frame <= stop)
            image = imcrop(image,rect);
            n=n+1;
            vidCell{1,1,n} = image;
            %%
            % If vidCell fills to max size, save file and start again
            if((n == max) || (dif == 0))
                name = strcat('ready',int2str(index));
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
        elseif (frame >= stop)
            pointer = pointer + 1;
            if (pointer < length)
                start = times(pointer,1);
                stop = times(pointer,2);
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

