%Griffin Dube
%ECE 4950
%Project 2: Image Processing
%For angles: negative means cw, positive means ccw
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
angles = zeros(items);
ang = zeros(items);
for i = 1:items
    plot(STATS(i).Centroid(1),STATS(i).Centroid(2),'yO','MarkerFaceColor','y');
    text(STATS(i).Centroid(1),STATS(i).Centroid(2),sprintf("%0.0f",i))
    ang(i) = get_angle([height/2,width/2],STATS(i).Centroid);
end
for i = 1:items
    for j = 1:items
        angles(i,j) = get_rel_angle(ang(i),ang(j));
    end
end
plot(height/2,width/2,'yO','MarkerFaceColor','y');
fprintf("%f %f\n",angles,ang);
hold off;

w1 = input("Input Well 1: ");
w2 = input("Input Well 2: ");
fprintf("The angle between these wells is:  %0.0f\n",angles(w1,w2));
