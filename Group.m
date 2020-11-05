classdef Group
    %Group: allows for grouping of different components
    %   input params:
    %       nameID: nameID of the group
    %   methods:
    %       Group(): Constructor for Group Class
    %       addLine(): Adds line component to image
    %       removeLine(): Removes line component from image
    properties
        nameID
        lines = {}
    end
    
    methods
        function obj = Group(nameID)
            obj.nameID = nameID;
        end
        
        function obj = addLine(obj,line)
            sizeOfLines = length(obj.lines);
            obj.lines(sizeOfLines + 1) = line;
        end
        
        %todo
        function obj = removeLine(obj,line)
            
        end
        
    end
end

