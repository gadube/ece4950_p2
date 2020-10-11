function [relAngle] = get_rel_angle(a1,a2)
%get_rel_angle Find the angle between two wells
%   Returns angle between two centers
    
if (a1 < 0)
    a1 = a1 + 360;
end
if (a2 < 0)
    a2 = a2 + 360;
end

if (a2 > a1)
    relAngle = a2 - a1;
elseif (a1 >= a2)
    relAngle = a1 - a2;
end

if (relAngle > 180)
    relAngle = relAngle - 360;

end

