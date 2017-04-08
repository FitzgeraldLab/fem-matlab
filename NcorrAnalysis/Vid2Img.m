function vidCell = Vid2Img( vidName, div, lastNum)
%The purpose of this function is take images from a video, turn it to uint8,and put it into a structure
%   Input:  vidName(String): Name of the interested video
%           div(int): Save frame if its number is divisible by this number
%           lastNum(int): The number of the last frame you wish to look at
%
%   Output: vidCell(Cell): Cell created to hold all images

    video = vision.VideoFileReader(vidName);
    
    %If div and lastNum are not state when calling the function
    if exist('div', 'var') == 0
        div = 1;
    end
    if exist('lastNum', 'var') == 0
        lastNum = -1;
    end
    
    %Runs the first time to see how many frames it has
    count = 0;
    while ~isDone(video)
        count = count + 1;
        step(video);
    end
    
    %Create a cell for holding images
    vidCell = cell(1,1,count/div);
    reset(video)
    
    %Reread video
    i = 0;
    while ~isDone(video)
        i = i + 1;
        currentImage = step(video);
        if rem(i,div) == 0
            currentImage = uint8(currentImage);
            whos currentImage
            vidCell{1,1,(i/div)} = currentImage;
        end
        if i == lastNum
            release(video)
            return
        end
    end
    release(video)
end
