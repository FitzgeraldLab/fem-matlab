function vidStruct = RemoveBackground( vidStruct, backName )
%The purpose of this function is remove the background from an image
%   Input:  vidStruct(Structure): Structure to output video in *
%           backName(String): Name of the image used to remove the background
%
%   Output: vidStruct(Structure): The same structure as the input
%
%   *vidStruct must follow conventions listed in instructions

    background = imread(backName);
    
    for i = 1:length(vidStruct)
        image = vidStruct(i).image;
        image = image - background;
        vidStruct(i).image = image;
    end
end

