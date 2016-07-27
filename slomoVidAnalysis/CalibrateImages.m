function vidCell = CalibrateImages( vidCell, cameraParam )
%The purpose of this function is to calibrate each image in the structure
%   Input:  vidCell(Cell): Cell created to hold all images
%           cameraParam(Integer): This is the correction information for the camera
%
%   Output: vidStruct(Cell): Cell created to hold all images

    [~,~,k] = size(vidCell);

    for count = 1:k
        image = vidCell(:,:,count);
        [image, ~] = undistortImage(image,cameraParam);
        vidCell(:,:,count) = image;
    end
end
