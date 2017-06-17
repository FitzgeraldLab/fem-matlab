function vidCellNew = cropImages( vidCell )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    vidCellNew = vidCell;
    [~,~,k] = size(vidCell);
    
    [image,rect] = imcrop(vidCell{1,1,1});
    uiwait
    vidCellNew{1,1,1} = image;    
    
    for count = 2:k
        image = imcrop(vidCell{1,1,count},rect);
        vidCellNew{1,1,count} = image;
    end
end

