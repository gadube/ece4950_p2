function [outImage] = cleanup_image(inImage)
%cleanup_image Remove noise and 
%   Detailed explanation goes here
[height,width,depth] = size(inImage);
binIm = cvt_binary_img(inImage,height,width);

SE = strel('disk',20);
eroded = imerode(binIm,SE);
mask = imdilate(eroded,SE);
outImage = inImage .* uint8(mask);

end

