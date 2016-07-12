function vidStruct = Vid2Img( vidName, vidStruct, backName, calParam)
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           vidStruct(Structure): Structure to output video in **
%           backName(String): Name of background image
%           calParam(int): Parameters of for camera calibration
%
%   Output: vidStruct(Structure): The same structure as the input
%
%   *vidStruct must follow conventions listed in instructions

    video = vision.VideoFileReader(vidName);
    
    if exist('backName','var') == 1
        background = imread(backName);
    end

    n = 1;
    while ~isDone(video)
        currentImage = step(video);
        if exist('calParam','var') == 1
            [currentImage,~] = undistortImage(currentImage,calParam);
        end
        currentImage = rgb2gray(currentImage);
        if exist('backName','var') == 1
            currentImage = currentImage - background;
        end
        vidStruct(n).image = currentImage;
        n = n + 1;
    end
end