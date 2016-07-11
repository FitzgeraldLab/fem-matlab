function Vid2Img( vidName, vidStruct, backName, calParam)
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           vidStruct(Structure): Structure to output video in **
%           backName(String): Name of background image
%           calParam(int): Parameters of for camera calibration
%
%   Output: No output, but adds to structures
%
%   *vidStruct must follow conventions listed in instructions

    video = vision.VideoFileReader(vidName);

    if ~isempty(backName)
        background = imread(backName);
    end

    n = 1;
    while ~isDone(video)
        currentImage = step(video);
        if ~isempty(calParam)
            [currentImage,~] = undistortImage(currentImage,calParam);
        end
        currentImage = rgb2gray(currentImage);
        if ~isempty(backName)
            currentImage = currentImage - background;
        end
        vidStruct(n).image = currentImage;
        n = n + 1;
    end
end