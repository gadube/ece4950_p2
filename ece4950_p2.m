%Griffin Dube
%ece4950_p2

clear;close all;
[cam,background] = setup_camera(2);
% background = bg;
nColors = 4; %Red,Yellow,Green,Blue
nWells = 8;
input("Hit Enter to Begin...");
while 1
    state = get_current_state(cam,background,nColors,nWells);
end