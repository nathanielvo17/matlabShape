%% ExDrawLines
% 1)  left click, to close a line or polyline, double click
% 2)  If you double click on same spot without drawing a line it will ask
%     you a question to type a number or not
% 3) if you type a number it will stop and save the data to d.mat
%    else it will continue to let you add more lines
%    * currently original image is hardcoded to 256,256
%
fig=figure(1);
fprintf("left click, then right click\n, double click at a point to stop");

imageLength = 256;
imageWidth = 256;
name = "image123";

imageObj = Image(name,imageLength,imageWidth);
%a=randn(256,256);
a=zeros(imageLength,imageWidth);
imagesc(a);
colormap('gray')

%% loop and draw lines
 
k=0;
while 1
  [x,y] = getline(fig);
  l=rem(k,100); % create a line color
  m1= rem(l,10)/10
  m2= fix(rem(l,100)/10)/10
  m3= fix(l/100)/10
  line(x,y,'Color',[m1 m2 m3]);
  
  % this is 
  if  (length(x)<2) && (length(y)<2)
      a=input("type a number to stop\n");
      
      if ~isnumeric(a)      
         fprintf("continuing\n");
      else
          fprintf("pressed a number\should save and break\n");
          % save all the objects
          d = findobj(gcf,'Type','line')
          save d.mat d;  % this is saving all the lines with properties
          break;
      end
  end
  k=k+1;
end
 
%% to draw lines
for index = 1:1:length(d)
   if (length(d(index).XData) > 1) 
       currGroup = Group(sprintf("group%d",index-1));
       for index2 = 1:1:length(d(index).XData)-1
           currOriginY = d(index).YData(index2);
           currOriginX = d(index).XData(index2);
           currEndY = d(index).YData(index2+1);
           currEndX = d(index).XData(index2+1);
           deltaX = currEndX - currOriginX;
           deltaY = currEndY - currOriginY;
           currAngle = -atan(deltaY/deltaX);
           if(deltaX<0)
              currAngle = currAngle + pi; 
           end
           currMagnitude = sqrt(deltaY .^2 + deltaX .^2);
           currOriginString = sprintf("%f,%f",currOriginX,currOriginY);
           currLine = Line(sprintf("group%d",index), currOriginString, num2str(currAngle), num2str(currMagnitude), "1");
           currGroup = currGroup.addLine({currLine});
       end 
       imageObj = imageObj.addGroup({currGroup});
   end
end

%% QUESTIONS 1/13
%how to determine monte carlo
% how to define "strength of signal"
%line "distribution ins slice"

%what is "levels of response"
% is "residual" the difference between original image and reconstructed
% image?




%%


%add noise
imageObj = imageObj.setNoise(.1);
%monte carlo

%strength of signal compared with amplitude of noise
SNR = 1;

%%
%setThickness of line




%%
image = imageObj.buildImage();
imageMean = mean2(image);
%image = -1*(image - 1); %white to black, black to white
showIm(image);
%colormap('gray');


%%info
imageObj.noise %noise amplitude

%residuals and energy



%build pyramids
%% laplacian pyramid
[image_Lpyr, image_Lpyr_indices] = buildLpyr(image); %pyramid build
figure(2)
showLpyr(image_Lpyr, image_Lpyr_indices); %show Laplacian Pyramid
image_recon_Lpyr = reconLpyr(image_Lpyr, image_Lpyr_indices); %reconstruction

%% steerable pyramid
[image_Spyr, image_Spyr_indices] = buildSpyr(image); %pyramid build
figure(3)
showSpyr(image_Spyr, image_Spyr_indices); %show Steerable Pyramid
image_recon_Spyr = reconSpyr(image_Spyr, image_Spyr_indices); %reconstruction


