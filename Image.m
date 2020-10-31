classdef Image
    %Image Summary of this class goes here
    %   Detailed explanation goes here
    properties
        imLength
        imWidth
        nameID
        groups = {}
    end
    
    methods
        function obj = Image(nameID,length,width)
            obj.imLength = length;
            obj.imWidth = width;
            obj.nameID =  nameID;
        end
        
        function obj = addGroup(obj,group)
            sizeOfGroups = length(obj.groups);
            obj.groups(sizeOfGroups + 1) = group;
        end
        
        %todo
        function outputImage = buildImage(obj)
            outputImage = zeros(obj.imLength,obj.imWidth);
        end
        
    end
end

