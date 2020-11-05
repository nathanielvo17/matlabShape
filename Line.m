classdef Line
    %Line: component that resembles straight line
    %   input params:
    %       nameID: name ID of component
    %       origin: beginning coordinates for line
    %       angle: angular direction of line from the horizontal
    %       magnitude: magnitude of length of line from origin to desired direction
    %       thickness: thickness of line component
    
    properties
        nameID
        origin
        angle
        magnitude
        thickness
    end
    
    methods
        function obj = Line(name,origin,angle,magnitude,thickness)
            obj.nameID = name;
            obj.origin = origin;
            obj.angle = angle;
            obj.magnitude = magnitude;
            obj.thickness = thickness;
        end
    end
end

