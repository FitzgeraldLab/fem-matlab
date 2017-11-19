function [J1, J2] = StereoCalibration(ImagesR, ImagesL, squareSize)

  % Dected Checkerboard in all images
  [imagePoints, boardSize] = detectCheckerboardPoints(ImagesL,ImagesR);

  % Convert from pixel lengths to real lengths
  worldPoints = generateCheckerboardPoints(boardSize, squareSize);

  % Get image size
  imageSize = [size(I1,1), size(I1,2)];

  % Get parameters of the camera and images
  stereoParams = estimateCameraParameters(imagePoints, worldPoints, 'ImageSize', imageSize);

  % Get rectified images
  [J1, J2] = rectifiedStereoImages(ImagesL, ImagesR, stereoParams, 'OutputView', 'full');
  figure;
  imshow(stereoAnaglyph(J1,J2));

end
