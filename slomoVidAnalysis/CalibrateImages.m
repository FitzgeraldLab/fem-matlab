function vidStruct = CalibrateImages( vidStruct, cameraParam )
%The purpose of this function is to calibrate each image in the structure
%   Input:  vidStruct(Structure): Structure to output video in *
%           cameraParam(Integer): This is the correction information for the camera
%
%   Output: vidStruct(Structure): The same structure as the input
%
%   *vidStruct must follow conventions listed in instructions

    for i = 1:length(vidStruct)
        image = vidStruct(i).image;
        [image, ~] = undistortImage(image,cameraParam);
        vidStruct(i).image = image;
    end
end
