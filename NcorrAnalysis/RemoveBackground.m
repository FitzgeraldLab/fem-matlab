function vidCell = RemoveBackground( vidCell, backName )
%The purpose of this function is remove the background from an image
%   Input:  vidCell(Cell): Cell created to hold all images
%           backName(String): Name of the image used to remove the background
%
%   Output: vidCell(Cell): Cell created to hold all images

    background = imread(backName);
    background = uint8(background);
    
    [~,~,k] = size(vidCell);
    [i,j,~] = size(vidCell{1,1,1});
    [x,y] = size(background);
    
    if (i == x && j == y)
        for count = 1:k
            image = vidCell{1,1,count};
            image = image - background;
            vidCell{1,1,count} = image;
        end
    else
        fprintf('%i does not equal %i and %i does not equal %i \n',i,x,j,y)
        error('Size of background image must be same as images in cell.')
    end
end