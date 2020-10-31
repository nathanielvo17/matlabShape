function [image,data] = readShapeFile(inputFile)
%readShapeFile Summary of this function goes here
%   Detailed explanation goes here

%% read JSON
fileName = inputFile; % filename in JSON extension
fid = fopen(fileName); % Opening the file
raw = fread(fid,inf); % Reading the contents
str = char(raw'); % Transformation
fclose(fid); % Closing the file
data = jsondecode(str); % Using the jsondecode function to parse JSON from string

%% build image dims
image = Image(data.Attributes.nameID, str2double(data.Attributes.size.imLength), str2double(data.Attributes.size.imWidth));
%% add groups and lines
groups = struct2cell(data.Groups);
for index = 1:1:length(groups)
    currGroupData = groups{index};
    currGroupName = currGroupData.nameID;
    currGroup = Group(currGroupName);
    
    currComponents = struct2cell(currGroupData.components);
    for index2 = 1:1:length(currComponents)
        currComponent = currComponents{index2};
        nameID = currComponent.nameID;
        origin = currComponent.origin;
        angle = currComponent.angle;
        magnitude = currComponent.magnitude;
        thickness = currComponent.thickness;
        
        currLine = Line(nameID,origin,angle,magnitude,thickness);
        currGroup = currGroup.addLine({currLine});
    end
    image = image.addGroup({currGroup});
end

end
