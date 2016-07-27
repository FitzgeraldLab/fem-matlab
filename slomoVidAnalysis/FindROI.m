function vidCell = FindROI( vidCell, thresh )
%The purpose of this function is to find the region of interest on each frame
%Assumes that background has been subtracted from the image (background is black
%   Input:  vidCell(Cell): Cell created to hold all images
%           thresh(int): the tresh value (0-1) for turning gray scale to bw
%
%   Output: vidCell(Cell): Cell created to hold all images
    
    [~,~,k] = size(vidCell);

    for count = 1:k
        image = vidCell(:,:,count);
        if exist('thresh', 'var') == 0
            thresh = graythresh(image);
        end
        bw = im2bw(image, thresh);
        bw = imdilate(bw, strel('disk',2));
        vidCell(:,:,count) = bw;
    end    
end
