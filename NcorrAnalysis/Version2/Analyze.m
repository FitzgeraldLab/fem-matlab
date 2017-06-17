function handles_ncorr = Analyze( vidName,start,stop,mode,max )
%CROPVID Summary of this function goes here
%   Detailed explanation goes here
    
    mode = upper(mode);
    if (~strcmp(mode,'SAVE') && ~strcmp(mode,'NCORR'))
        error('Improper mode type')
    end
    if (~exist('max')) %#ok<EXIST>
        max = fix((stop-start),10);
    end
    
    video = vision.VideoFileReader(vidName);
    
    fileName = vidName(1:end-4);
    mkdir(fullfile(pwd,fileName));
    cd(fileName);
    
    i = 0;
    index = 1;
    vidCell = cell(1,1,stop-start-1);
    while ~isDone(video)
        image = step(video);
        image = im2uint8(image);
        if (i == start)
            [image,rect] = imcrop(image);
            
            n=0;
            reference = image;
        elseif (i > start && i < stop)
            image = imcrop(image,rect);
            
            n=n+1;
            vidCell{1,1,n} = image;
            if (strcmp(mode,'SAVE'))
                if(n == max)
                    name = strcat('ready',int2str(index));
                    save(name,'reference','vidCell')
                    
                    index = index + 1;
                    n = 0;
                end
            end
        elseif (i >= stop)
            break
        end
        i = i + 1;
    end
    release(video);
    
    if (strcmp(mode,'NCORR'))
        handles_ncorr = ncorr;
        handles_ncorr.set_ref(reference);
        handles_ncorr.set_cur(vidCell);
    elif(strcmp(mode,'SAVE'))
        cd('..')
        handles_ncorr = 0;
    end
end