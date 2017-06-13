function vidStruct = EdgeInfo( vidStruct, edgeMethod )
%The purpose of this function is take images from a video and put it into a structure
%   Input:  vidStruct(Structure): Structure to output video in *
%           edgeMethod(String): name of method for edge detection (suggest
%               using 'sobel' or 'canny')
%
%   Output: vidStruct(Structure): The same structure as the input
%
%   *vidStruct must follow conventions listed in instructions

    for i = 1:length(vidStruct)
        %First time through the struct
        if i == 1
            Continue = 1;
            image = vidStruct(1).image;
            image = imdilate(image, strel('disk',2));
            cornerLocation = vidStruct(1).cornerInfo;
            imageEdge = edge(image, edgeMethod);
            
            %Create lineEdge which informs which corners go with which line
            [Row,Column] = size(cornerLocation);
            lineEdge = zeros(Row,Column);
            %Keep going till all corneres have been listed
            while Continue == 1
                m = 1;
                location1 = cornerLocation(m,:);
                D1 = bwdistgeodesic(imageEdge,location1(m,1),location1(m,2), 'quasi-euclidean');
                whiteLength = zeros(Row,1);
                %Look at all corner points excluding the one from above
                count = 0;
                for n = 1:Row
                    if n ~= m
                        count = count + 1;
                        location2 = cornerLocation(n,:);
                        D2 = bwdistgeodesic(imageEdge,location2(1,1),location2(1,2),'quasi-euclidean');
                        D = D1 + D2;
                        D = round(D * 8) / 8;
                        D(isnan(D)) = inf;
                        paths = imregionalmin(D);
                        solution_path = bwmorph(paths, 'thin', inf);
                        solution = imdilate(solution_path, ones(3,3));
                        solution = im2bw(solution);
                        [pixelNum, ~] = hist(reshape(solution,prod(size(solution)),1),unique(solution));
                        whiteLength(count) = pixelNum(2);
                    else
                        count = count + 1;
                        whiteLength(count) = -1;
                    end
                end
                m = m + 1;
                
                %Get two sortest paths from one point
                shortest = -1;
                shortestLength = -1;
                shorter = -1;
                shorterLength = -1;
                for n = 1:length(whiteLength)
                    if whiteLength(n) == 1
                        if shortest == -1;
                           shortest = n;
                           shortestLength = whiteLength(n);
                        elseif shorter == -1;
                            if shortest > whiteLength(n)
                                shorterLength = shortestLength;
                                shorter = shortest;
                                shortestLength = whiteLength(n);
                                shortest = n;
                            else
                                shorterLength = whiteLength(n);
                                shorter = n;
                            end
                        else
                            if shortest > whiteLength(n)
                                shorterLength = shortestLength;
                                shorter = shortest;
                                shortestLength = whiteLength(n);
                                shortest = n;
                            elseif shorter > whiteLength(n)
                                shorterLength = whiteLength(n);
                                shorter = n;
                            end
                        end
                    end
                end
                for n = 1:Row
                    
                end
                
                %Check to see if all lines have been matched with a corner
                Continue = 0;
                for n = 1:Row
                    if lineEdge(n,:) == [0,0]
                        Continue = 1;
                    end
                end
            end
        %Other times through struct
        else
            image = vidStruct(i).image;
            image = imdilate(image, strel('disk',2));
            cornerLocation = vidStruct(i).cornerInfo;
            imageEdge = edge(image, edgeMethod);
        end
        
    end
end

