function vidStruct = CornerInfo( cornerNum, vidStruct )
%The purpose of the function is to extact information about the corners of
%objects in the images and puts into the structure
%   Input:  cornerNum(int): Number of corners on the object
%           vidStruct(Structure): Structure to output video in **
%
%
%   Output: vidStruct(Structure): The same structure as the input

    for n = 1:length(vidStruct)
        cornerPoints = corner(vidStruct(n).image);
        points = zeros(cornerNum,2);
        %First iteration needs to determine corner order
        if n ==1
            for m = 1:(cornerNum) %Loop for number of corners
                %Initialize first slot each rotation
                x = cornerPoints(1,1);
                y = cornerPoints(1,2);
                distance = sqrt(x^2 + y^2);
                location = 1;
            
                for i = 1:(cornerNum-m) %Loop for number of leftover corners
                    %Replaces slots if new distance is less than the previous
                    newDistance = sqrt((cornerPoints(i+1,1))^2 + (cornerPoints(i+1,2)^2));
                    if distance > newDistance
                        distance = newDistance;
                        x = cornerPoints(i+1,1);
                        y = cornerPoints(i+1,2);
                        location = i+1;
                
                    elseif distance == newDistance
                    
                        if x < cornerPoints(i+1,1)
                            distance = newDistance;
                            x = cornerPoints(i+1,1);
                            y = cornerPoints(i+1,2);
                            location = i+1;
                        end
                    end
                end
                points(m,1) = x;
                points(m,2) = y;
                cornerPoints(location,:) = [];
            end
        
        %Later iternation need to follow mattern of first iteration
        else
            cPrev  = vidStruct(n-1).cornerInfo;
        
            for m = 1:cornerNum %Loops for number of initial corners
                %Initialize first slot each rotation
                x = cornerPoints(1,1);
                y = cornerPoints(1,2);
                distance = sqrt((x-cPrev(m,1))^2 + (y-cPrev(m,2))^2);
                location = 1;
            
                for i = 1:(cornerNum-m) %Loop for number of new corners
                    x2 = cornerPoints(i+1,1);
                    y2 = cornerPoints(i+1,2);
                    distance2 = sqrt((x2-cPrev(m,1))^2 + (y2-cPrev(m,2))^2);
                    %Replaces slots if new distance is less than the previous
                
                    if distance > distance2
                        x = x2;
                        y = y2;
                        distance = distance2;
                        location = i+1; 
                
                    elseif distance == distance2
                    
                        if x > x2
                            x = x2;
                            y = y2;
                            distance = distance2;
                            location = i+1;
                        end
                    end
                end
                points(m,1) = x;
                points(m,2) = y;
                cornerPoints(location,:) = [];
            end
        end
        vidStruct(n).cornerInfo = points;
    end
end

