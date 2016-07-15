function vidStruct = CornerNumbering( vidStruct )
%The purpose of the function is to display the point number on the images
%This is mainly a test to make sure the corner info works
%   Input:  vidStruct(Structure): Structure to output video in **
%
%   Output: vidStruct(Structure): The same structure as the input
    
    numImage = length(vidStruct);
    elementSize = size(vidStruct(1).cornerInfo);
    
    for i  = 1:numImage
        image = vidStruct(i).image;
        element = vidStruct(i).cornerInfo;
        for m = 1:elementSize(1);
            image = insertText(image,element(m,:),num2str(m),'TextColor','red');
        end
        vidStruct(i).imageNumbered = image;
    end 
end