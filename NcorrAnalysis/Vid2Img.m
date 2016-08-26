function vidCell = Vid2Img( vidName, div, lastNum)
%The purpose of this function is take images from a video, turn it to uint8,and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           div(int): Save frame if its number is divisible by this number
%           lastNum(int): The number of the last frame you wish to look at
%
%   Output: vidCell(Cell): Cell created to hold all images

    video = vision.VideoFileReader(vidName);
    
    if exist('div', 'var') == 0
        div = 1;
    end
    if exist('lastNum', 'var') == 0
        lastNum = -1;
    end
    
    count = 0;
    while ~isDone(video)
        count = count + 1;
        currentImage = step(video);
        if rem(count,div) == 0
            currentImage = uint8(currentImage);
            vidCell{1,1,(count/div)} = currentImage;
        end
        if count == lastNum
            display('Ending')
            return
            displaying('Did not stop properly')
        end
        display(count);
    end
end
