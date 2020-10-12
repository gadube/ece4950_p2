%Griffin Dube
%ece4950_p2

clear;close all;
[cam,background] = setup_camera(2);
% background = bg;
nColors = 4; %Red,Yellow,Green,Blue
nWells = 8;
input("Hit Enter to Begin...");
i=1;
wells = zeros(1,nWells);
while 1
    state = get_current_state(cam,background,nColors,nWells);
    wells(i,:) = state.wells;
    state.wells = mode(wells);
    print_state(state);
    i = mod((i + 1),3)+1;
end