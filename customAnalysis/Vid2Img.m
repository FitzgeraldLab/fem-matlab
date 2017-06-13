function vidStruct = Vid2Img( vidName, vidStruct)
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           vidStruct(Structure): Structure to output video in **
%
%   Output: vidStruct(Structure): The same structure as the input
%
%   *vidStruct must follow conventions listed in instructions

    video = vision.VideoFileReader(vidName);

    n = 1;
    while ~isDone(video)
        currentImage = step(video);
        currentImage = rgb2gray(currentImage);
        vidStruct(n).image = currentImage;
        n = n + 1;
    end
end