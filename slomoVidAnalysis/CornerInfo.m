function CornerInfo( cornerNum, vidStruct )
%The purpose of the function is to extact information about the corners of
%objects in the images and puts into the structure
%   Input:  cornerNum(int): Number of corners on the object
%           vidStruct
%
%   Output: No output, but adds to structures

    for n = 1:length(vidStruct)
        cornerPoints = corner(vidStruct(n).image);
    
        %First iteration needs to determine corner order
        if n ==1
            for m = 1:(cornerNum) %Loop for number of corners
                %Initialize first slot each rotation
                distance = d(1,3);
                x = d(1,1);
                y = d(1,2);
                location = 1;
            
                for i = 1:(cornerNum-m) %Loop for number of leftover corners
                    %Replaces slots if new distance is less than the previous
                
                    if distance > d(i+1,3)
                        distance = d(i+1,3);
                        x = d(i+1,1);
                        y = d(i+1,2);
                        location = i+1;
                
                    elseif distance == d(i+1,3)
                    
                        if x < d(i+1,1)
                            distance = d(i+1,3);
                            x = d(i+1,1);
                            y = d(i+1,2);
                            location = i+1;
                        end
                    end
                end
                cornerPoints(m+1) = [x, y];
                d(location,:) = [];
            end
        
        %Later iternation need to follow mattern of first iteration
        else
            cPrev  = vidStruct(n-1).cornerInfo;
        
            for m = 1:cornerNum %Loops for number of initial corners
                %Initialize first slot each rotation
                x = d(1,1);
                y = d(1,2);
                distance = sqrt((x-cPrev(m,1))^2 + (y-cPrev(m,2))^2);
                location = 1;
            
                for i = 1:(cornerNum-m) %Loop for number of new corners
                    x2 = d(i+1,1);
                    y2 = d(i+1,2);
                    distance2 = sqrt((x2-cPrev(m,1))^2 + (y2-cPrev(m,2))^2);
                    %Replaces slots if new distance is less than the previous
                
                    if distance > distance2
                        x = d(i+1,1);
                        y = d(i+1,2);
                        distance = sqrt((x-cPrev(m,1))^2 + (y-cPrev(m,2))^2);
                        location = i+1; 
                
                    elseif distance == distance2
                    
                        if x > x2
                            x = d(i+1,1);
                            y = d(i+1,2);
                            distance = sqrt((x-cPrev(m,1))^2 + (y-cPrev(m,2))^2);
                            location = i+1;
                        end
                    end
                end
                cornerPoints(m) = [x,y];
                d(location,:) = [];
            end
        end
        vidStruct(n).cornerInfo = cornerPoints;
    end
end

