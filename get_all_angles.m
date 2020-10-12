function [ang,relAngs] = get_all_angles(binImg)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[height,width,depth] = size(binImg);
STATS = regionprops(binImg,'all');
items = size(STATS);
relAngs = zeros(items);
ang = zeros(items);
for i = 1:items
    ang(i) = get_angle([height/2,width/2],STATS(i).Centroid);
end
for i = 1:items
    for j = 1:items
        relAngs(i,j) = get_rel_angle(ang(i),ang(j));
    end
end
end

