function [binImg] = cvt_binary_img(img,height,width)
%cvt_binary_img Summary of this function goes here
%   Detailed explanation goes here
img2 = img;
for i=1:height
    for j=1:width
        if (img(i,j,1) > 2) || ...
           (img(i,j,2) > 2) || ...
           (img(i,j,3) > 2)
            
            %Will Show in Green
            img2(i,j,:) = [175,200,175];
        end
    end
end

binImg = im2bw(img2);
figure();
imshow(binImg);
title('Binary Image');
end

