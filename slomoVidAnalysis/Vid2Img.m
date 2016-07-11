function Vid2Img( vidName, vidStruct, placeName, backName, calParam)
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           vidStruct(Structure): Structure to output video in
%           placeName(String): Location in the Structure to save the images
%           backName(String): Name of background image
%           calParam(int): Parameters of for camera calibration
%
%   Output: No output, but adds to structures

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
    vidStruct(placeName) = currentImage;
end
end

