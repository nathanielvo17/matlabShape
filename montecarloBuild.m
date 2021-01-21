%%monte carlo make image
function [outputImage] = montecarloBuild(size, number)
image = Image("image",size,size);
imageGroup = Group("Group");
for index = 1:1:number
    currOriginX = round(rand*size);
    currOriginY = round(rand*size);
    currOrigin = sprintf("%d,%d",currOriginX,currOriginY);
    currAngle = round(2*pi*rand);
    currMagnitude = round(rand*sqrt(2*size.^2));
    currLine = Line(sprintf("group%d",index), currOrigin, num2str(currAngle), num2str(currMagnitude), "1");
    imageGroup = imageGroup.addLine({currLine});
end
image = image.addGroup({imageGroup});
outputImage = image.buildImage();
end