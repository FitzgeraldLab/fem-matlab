function [ params, lengthConvert ] = GetCalibration( calibrateName, checkerLength, boardLength, current, div )
%The purpose of this function is to get the information to undistort images
%   Input:  calibrateName(String): name of the video used to get calibration parameters
%           checkerLength(int): the length of the sides of the squares in the checker pattern
%           boardLength(int Array): the total height then wide of the checker pattern
%           current(string): location of the file you are using this program in
%           div(string): if frame number is divisible by that number, use that frame
%
%   Output: params(int): the information to undistort images
%           lengthConvert(int): multiply to pixel distance to get world distance
%               becomes array if height and width conversion are not the same
%
%   Need to have folder CalImages in your current folder

    calLocation = fullfile(current,'CalImages');
    video = vision.VideoFileReader(calibrateName);
    count = 0;
    cd(calLocation);
    delete(calLocation)
    while ~isDone(video)
        count = count + 1;
        currentImage = step(video);
        % Only saves so many images based on the number in i
        if rem(count,div) == 0
            num = count/div;
            currentImage = rgb2gray(currentImage);
            filename = sprintf('image%d.jpg',num);
            fullfilenames{num} = fullfile(calLocation,filename);
            imwrite(currentImage,filename,'jpg');
        end
    end
    [imagePoints, boardSize] = detectCheckerboardPoints(fullfilenames);
    deltaY = boardLength(1)/boardSize(1);
    deltaX = boardLength(2)/boardSize(2);
    if round(deltaY,2) == round(deltaX,2)
        lengthConvert = round(deltaX,2);
    else
        lengthConvert = [deltaY,deltaX];
    end
    worldPoints = generateCheckerboardPoints(boardSize, checkerLength);
    params = estimateCameraParameters(imagePoints, worldPoints);
    cd(current)
end

