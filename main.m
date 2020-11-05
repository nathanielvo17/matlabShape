[output,data] = readShapeFile("input.json");

%output = output.removeGroup("Group2");


image = output.buildImage();
image = -1*(image - 1); %white to black, black to white
imagesc(image);
colormap('gray');