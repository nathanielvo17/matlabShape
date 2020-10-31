classdef Group
    %Group: allows for grouping of different components
    %   Detailed explanation goes here
    
    properties
        nameID
        lines = {}
    end
    
    methods
        function obj = Group(name)
            obj.nameID = name;
        end
        
        function obj = addLine(obj,line)
            sizeOfLines = length(obj.lines);
            obj.lines(sizeOfLines + 1) = line;
        end
        
    end
end

