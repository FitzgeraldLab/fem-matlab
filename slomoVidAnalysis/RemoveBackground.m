function vidCell = RemoveBackground( vidCell, backName )
%The purpose of this function is remove the background from an image
%   Input:  vidCell(Cell): Cell created to hold all images
%           backName(String): Name of the image used to remove the background
%
%   Output: vidCell(Cell): Cell created to hold all images

    background = imread(backName);
    [i,j,k] = size(vidCell);
    [x,y] = size(background);
    
    if (i == x && j == y)
        for count = 1:k
            image = vidCell(:,:,count);
            image = image - background;
            vidCell(:,:,count) = image;
        end
    else
        error('Size of background image must be same as images in cell')
    end
end