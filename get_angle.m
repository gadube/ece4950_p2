function [angle] = get_angle(center,centroid)
%get_rel_angle Find the angle between well and X axis
%   Returns angle relative to -X axis.
 diff = center - centroid;

 angleRad = atan2(diff(2),diff(1));
 angle = rad2deg(angleRad);
 angle = round(angle,0);
 angle = angle - 90;
%  if (angle < 0)
%      angle = angle + 360;
%  end
 if (angle <= -180)
     angle = angle + 360;
 elseif (angle > 180)
     angle = angle - 360;
 end
end

