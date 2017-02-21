function lastNum = CropVid( vidName,div )
%CROPVID Summary of this function goes here
%   Detailed explanation goes here

    video = vision.VideoFileReader(vidName);
    
    sendTo = fullfile(pwd,'finished');
    
    i = 0;
    
    lastNum = 0;
    name = strcat('video', strcat(num2str(lastNum+1), '.avi'));
    videoWriter = vision.VideoFileWriter(fullfile(sendTo,name),'FrameRate',video.info.VideoFrameRate);
    
    while ~isDone(video)
        if any(div(:) == i) %check if current frame is in division
            release(videoWriter)
            lastNum = lastNum + 1;
            name = strcat('video', strcat(num2str(lastNum+1), '.avi'));
            videoWriter = vision.VideoFileWriter(fullfile(sendTo,name),'FrameRate',video.info.VideoFrameRate);
        end
        i = i + 1;
        image = step(video);
        step(videoWriter,image);
    end
    release(video);
    release(videoWriter);
end