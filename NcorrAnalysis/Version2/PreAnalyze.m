function PreAnalyze( vidName, times, max )
%PreAnalyze This function loads the vidName video to prep it under times
%with a cell length of max.
%   Detailed explanation goes here
    
    [length,~] = size(times);
    start = times(1,1);
    stop = times(1,2);

    if (~exist('max')) %#ok<EXIST>
        max = fix((stop-start),10);
    end
    
    video = vision.VideoFileReader(vidName);
    
    fileName = vidName(1:end-4);
    mkdir(fullfile(pwd,fileName));
    cd(fileName);
    
    frame = 0;
    index = 1;
    pointer = 1;
    vidCell = cell(1,1,max);
    while ~isDone(video)
        dif = stop-frame;
        image = step(video);
        image = im2uint8(image);
        if ((frame == start) && (index == 1))
            [image,rect] = imcrop(image);
            
            n=0;
            reference = image;
            imwrite(reference,'reference.jpeg')
        elseif (frame >= start && frame <= stop)
            image = imcrop(image,rect);
            
            n=n+1;
            vidCell{1,1,n} = image;
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
        elseif (frame >= stop)
            pointer = pointer + 1;
            if (pointer < length)
                start = times(pointer,1);
                stop = times(pointer,2);
            end
        end
        frame = frame + 1;
    end
    release(video);
    ch('..');

end

