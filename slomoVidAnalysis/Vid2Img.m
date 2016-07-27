function vidCell = Vid2Img( vidName)
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidName(String): Name of the interested video
%
%   Output: vidCell(Cell): Cell created to hold all images

    video = vision.VideoFileReader(vidName);
    temp = struct('image',{});

    k = 0;
    while ~isDone(video)
        k = k + 1;
        currentImage = step(video);
        currentImage = rgb2gray(currentImage);
        temp(k).image = currentImage;
    end
    [i,j] = size(currentImage);
    vidCell = cell(i,j,k);
    for count = 1:k
        vidCell(:,:,count) = temp(count).image;
    end
end
