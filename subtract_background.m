function [noBckgrnd,height,width,depth] = subtract_background(origImage,origBckgrnd)
%subtract_background Removes background of an input image
%   Removes background from input image and returns output image

[height,width,depth] = size(origImage);
[heightB,widthB,depthB] = size(origBckgrnd);

noBckgrnd = origBckgrnd - origImage;
% figure();
% imshow(noBckgrnd);
% title('Background Subtraction Image');
end

