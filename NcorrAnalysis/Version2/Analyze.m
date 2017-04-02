function vidCell = Analyze( vidName,start,stop )
%CROPVID Summary of this function goes here
%   Detailed explanation goes here

    video = vision.VideoFileReader(vidName);
    
    i = 0;
    
    vidCell = cell(1,1,stop-start);
    while ~isDone(video)
        image = step(video);
        
        if (i == start)
            [image,rect] = imcrop(image);
            
            n=0;
            reference = uint8(image);
        elseif (i > start && i < stop)
            image = imcrop(image,rect);
            
            n=n+1;
            vidCell{1,1,n} = image;
        elseif (i >= stop)
            break
        end
        i = i + 1;
    end
    release(video);
    
    handles_ncorr = ncorr;
    handles_ncorr.set_ref(reference);
    handles_ncorr.set_cur(vidCell);
end