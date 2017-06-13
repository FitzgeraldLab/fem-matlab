function vidCell = FindROI( vidCell, thresh )
%The purpose of this function is to find the region of interest on each frame
%Assumes that background has been subtracted from the image (background is black
%   Input:  vidCell(Cell): Cell created to hold all images
%           thresh(int): the tresh value (0-1) for turning gray scale to bw
%
%   Output: vidCell(Cell): Cell created to hold all images
    
    [~,~,k] = size(vidCell);

    for count = 1:k
        image = vidCell{1,1,count};
        if exist('thresh', 'var') == 0
            thresh = graythresh(image);
        end
        invertbw = im2bw(image, thresh);
        bw = ~invertbw;
        bw = imdilate(bw, strel('disk',2));
        vidCell{1,1,count} = bw;
    end    
end
