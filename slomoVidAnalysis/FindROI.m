function vidStruct = FindROI( vidStruct, thresh )
%The purpose of this function is to find the region of interest on each frame
%Assumes that background has been subtracted from the image (background is black
%   Input:  vidStruct(Structure): Structure to output video in **
%           thresh(int): the tresh value (0-1) for turning gray scale to bw
%
%   Output: vidStruct(Structure): The same structure as the input
    
    for i = 1:length(vidStruct)
        image = vidStruct(i).image;
        if exist('thresh', 'var') == 0
            thresh = graythresh(image);
        end
        bw = im2bw(image, thresh);
        bw = imdilate(bw, strel('disk',2));
        vidStruct(i).roi = bw;
    end    
end

