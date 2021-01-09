classdef Image
    %Image Object that holds all of the different components and allows to
    %build an image
    %   input params:
    %       nameID: nameID of the Image
    %       length: length of image to be built
    %       width: width of image to be built
    %   methods:
    %       Image(): Constructor for Image Class
    %       addGroup(): Adds component Group to image
    %       removeGroup(): Removes component Group from image
    %       buildImage(): Builds image from Image object details
    
    properties
        imLength
        imWidth
        nameID
        noise
        groups = {}
    end
    
    methods
        function obj = Image(nameID,length,width)
            obj.imLength = length;
            obj.imWidth = width;
            obj.nameID =  nameID;
            obj.noise = 0;
        end
        
        function obj = addGroup(obj,group)
            sizeOfGroups = length(obj.groups);
            obj.groups(sizeOfGroups + 1) = group;
        end
        
        function obj = setNoise(obj,noise)
            obj.noise = noise;
        end
        %todo
        %remove group by nameID
        function obj = removeGroup(obj,nameID)
            %search for group
            for index = 1:1:length(obj.groups)
                if (nameID == obj.groups{index}.nameID)
                    obj.groups{index} = [];
                end
            end
            obj.groups = obj.groups(~cellfun('isempty',obj.groups));
        end
        
        function outputImage = buildImage(obj)
            outputImage = zeros(obj.imLength,obj.imWidth);
            for index = 1:1:length(obj.groups)
                currGroup = obj.groups{index};
                for index2 = 1:1:length(currGroup.lines)
                    outputImage = addLineToImage(currGroup.lines{index2},outputImage);
                end
            end
            outputImage = addNoise(outputImage,obj.noise);
        end
    end
end

