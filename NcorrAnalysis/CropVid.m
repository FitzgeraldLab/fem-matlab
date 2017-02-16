function vidNames = CropVid( vidName,div )
%CROPVID Summary of this function goes here
%   Detailed explanation goes here

    video = vision.VideoFileReader(vidName);
    i = 0;
    n = 0;
    while ~isDone(video)
        i = i + 1;
        image = step(vid);
        if any(div(:) == i) %check if current frame is in division
            n = n + 1;
            name = 'video' + num2str(n) + '.mov';
        end
    end
    release(video)
end