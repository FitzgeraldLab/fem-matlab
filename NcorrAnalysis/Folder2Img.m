function vidCell = Folder2Img( fileName, vidType )
%The purpose of this function is take images from a series of video in a folder, turn it to uint8,and put it into a structure
%   Input:  fileName(String): Name of the folder with the vid
%           vidType(String): Type of video file that is to be read (ex '.mov')
%
%   Output: vidCell(Cell): Cell created to hold all images

    location = fullfile(fileName,strcat('*',vidType));
    files = dir(location);
    [n,~] = size(files);
    vidCell = cell(1,1,n);
    
    for count = 1:n
        vidName = fullfile(fileName,files(count).name);
        video = vision.VideoFileReader(vidName);
        
        i = 1;
        while ~isDone(video)
            if i == 1
                frame = step(video);
                frame = double(frame);
                vidCell{1,1,count} = frame;
            else
                step(video);
            end
            i = i+1;
        end
        release(video)
    end
end

