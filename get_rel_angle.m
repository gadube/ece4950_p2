function [angle] = get_rel_angle(center,centroid1,centroid2)
%get_rel_angle Find the angle between two wells
%   Returns clockwise angle between two centers
 P_1 = [centroid1(1),centroid1(2)];
 P_2 = [centroid2(1),centroid2(2)];
 radius = centroid1(1) - center(1);
 
 dist = pdist([P_1;P_2],'euclidean');
 cosFormula = (2*(radius)^2 - dist^2)/(2*(radius)^2);
 
 angleRad = acos(cosFormula);
 angle = rad2deg(angleRad);
end

