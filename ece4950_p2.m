%Griffin Dube
%ECE 4950
%Project 2: Image Processing
clear; clc; close all; clear('cam');

% cam = setup_camera(1);

%get background and image
bg  = imread('washersbgnd.png');
img = imread('washers.png');%snapshot(cam);

[nobg,height,width,depth] = subtract_background(img,bg);
bin = cvt_binary_img(nobg,height,width);

STATS = regionprops(bin, 'all');
figure();
imshow(img)
hold on;

items = size(STATS);
for i = 1:3:4
    plot(STATS(i).Centroid(1),STATS(i).Centroid(2),'yO','MarkerFaceColor','y');
end
plot(height/2,width/2,'yO','MarkerFaceColor','y');
angle = get_rel_angle([height/2,width/2],STATS(1).Centroid,STATS(4).Centroid);
hold off;