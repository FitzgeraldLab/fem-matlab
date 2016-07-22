function [ params, lengthConvert ] = GetCalibration( calibrateName, checkerLength, boardLength )
%The purpose of this function is to get the information to undistort images
%   Input:  calibrateName(String): name of the video used to get calibration parameters
%           checkerLength(int): the length of the sides of the squares in the checker pattern
%           boardLength(int Array): the total height then wide of the checker pattern
%
%   Output: params(int): the information to undistort images
%           lengthConvert(int): multiply to pixel distance to get world distance
%               becomes array if height and width conversion are not the same

    video = vision.VideoFileReader(calibrateName);
    images = struct('images',{});
    n = 0;
    while ~isDone(video)
        n = n + 1;
        currentImage = step(video);
        currentImage = rgb2gray(currentImage);
        images(n).images = currentImage;
    end
    [imagePoints, boardSize] = detectCheckerboardPoints(images.images);
    worldPoints = generateCheckerboardPoints(boardSize, checkerLength);
    params = estimageCameraParameters(imagePoints, worldPoints);
    deltaY = boardLength(1)/boardSize(1);
    deltaX = boardLength(2)/boardSize(2);
    if round(deltaY,-2) == round(deltaX,-2)
        lengthConvert = round(deltaX,-2);
    else
        lengthConvert = [deltaY,deltaX];
    end
end

