%Griffin Dube
%ece4950_p2

clear;close all;
[cam,background] = setup_camera(2);
% background = bg;
nColors = 4; %Red,Yellow,Green,Blue
nWells = 8;
i=1;
wells = zeros(1,nWells);
oldState = get_current_state(cam,background,nColors,nWells);
while 1
    %input("Press Enter to test new state...");
    state = get_current_state(cam,background,nColors,nWells);
    wells(i,:) = state.wells;
    print_state(state,2);
    oldState = state;
     pause(2);
end