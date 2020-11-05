function [outputImage] = addLineToImage(line,inputImage)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

outputImage = inputImage;
origin = strsplit(line.origin,',');
originRow = str2double(origin{1});
originCol = str2double(origin{2});
row = originRow;
col = originCol;
angle = str2num(line.angle);
delX = cos(angle);
delY = sin(angle);
imageDims = size(inputImage);
%boundary and magnitude check
while( (row <= imageDims(1))&(col <= imageDims(2))&(row >= 1)&(col >= 1)& ...
        (sqrt((row-originRow).^2 + (col-originCol).^2)) <= str2double(line.magnitude) )
    outputImage(round(row),round(col)) = 1;
    %todo thickness
    %for index = 0:1:str2double(line.thickness)
     %   outputImage(roundedRow+index,roundedCol+index) = 1;
    %end
    row = row - delY;
    col = col + delX;
end

