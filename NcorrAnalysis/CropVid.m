function lastNum = CropVid( vidName,div )
%CROPVID Summary of this function goes here
%   Detailed explanation goes here

    video = vision.VideoFileReader(vidName);
    frameRate = video.SampleRate;
    
    i = 0;
    lastNum = 1;
    name = 'video' + num2str(lastNum) + '.mov';
    videoWriter = vision.VideoFileWriter(name,'FrameRate',frameRate);
    while ~isDone(video)
        if any(div(:) == i) %check if current frame is in division
            release(videoWriter)
            lastNum = lastNum + 1;
            name = 'video' + num2str(lastNum) + '.mov';
            videoWriter = vision.VideoFileWriter(name,'FrameRate',frameRate);
        end
        i = i + 1;
        image = step(vid);
        step(videoWriter,image);
    end
    release(video);
    release(videoWriter);
end