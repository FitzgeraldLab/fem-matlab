%% Introduction

%% Variables
videoname = ''; % Name of the video
CalVideo = ''; % Name of the video for the calibration images
backname = ''; % Name of the image that contains only the background
radius = 21; % Subset Radius (default is 21)
spacing = 1; % Subset Spacing (default is 1)
diffNorm = 1e-06; % Cutoff for the norm of difference vector (default is 1e-06)
iterations = 50; % Cutoff for the number of IC-GN iterations (default is 50)
totalThreads = 1; % Total number of threads (default is 1)
stepAnalysis = false; % if true, then process as many seeds as possible. If false, process all the seeds(default is false)
subsetRunc = false; % if true, then subset truncation is enabled (default is false)

%% Setup
current = pwd;
addpath('C:\Users\Matthew\Documents\MATLAB\Calibration Methods')
addpath(fullfile(current, 'Images'));
background = imread(backname);
background = RGB2gray(background);

%% Calibration
% Use one of the two functions:

% params = CameraParamsImage(ImageFolder, SquareSize);
% params = CameraParamsVideo(VidName, SquareSize, units, n);
showReprojectionErrors(params);

%% Image Analysis
vidReader = vision.VideoFileReader(fullfile(current, CalVideo));
prevImage = [];
reference = struct('imginfo',{},'roi',{});
images = struct('imginfo', {}, 'roi', {});
n = 0;

while ~isDone(vidReader)
    currImage = step(vidReader);
    [currImage,newOrigin] = undistortImage(currImage,params);
    currImage = RGB2gray(currImage);
    rioImage = currImage - background;
    rioImage = im2bw(rioImage);
    
    if (prevImage == [])
        reference(1).imginfo = ncorr_class_img;
        reference(1).imginfo.set_img('load',struct('img',currImage,'name','reference','path',''));
        reference(1).roi = rioImage;
    
    else
        images(n).imginfo = ncorr_class_img;
        images(n).imginfo.set_img('load',struct('img',currImage,'name',['current_' num2str(n)],'path',''));
        images(n).roi = rioImage;
    end
    
    prevImage = currImage;
    n=n+1;
    
end
refnum = 1

imgs = [reference images];
displacements_prelim = struct('plot_u',{},'plot_v',{},'plot_corrcoef',{},'plot_validpoints',{});
imgcorr_prelim = struct('idx_ref',{},'idx_cur',{});
initParams = struct('paramvector',{},'num_region',{},'num_thread',{},'computepoints',{});

[displacements_buffer,rois_dic_buffer,seedinfo_buffer,outstate_dic] = ncorr_alg_dicanalysis( imgs, ...
                                                                                             radius, ...
                                                                                             spacing, ...
                                                                                             diffNorm, ...
                                                                                             iterations, ...
                                                                                             totalThreads, ...
                                                                                             stepAnalysis, ...
                                                                                             subsetRunc, ...
                                                                                             [0,0], ...
                                                                                             initParams);
