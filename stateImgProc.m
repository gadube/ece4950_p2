%Griffin Dube
%ECE 4950: Senior Design I
%Project 2
clear;close all;
[cam,background] = setup_camera(2);
% background = bg;
nColors = 4; %Red,Yellow,Green,Blue
nWells = 8;
input("Hit Enter to Begin...");
currentImg = snapshot(cam);
state = create_img_struct(currentImg,background,nWells);
dims = state.img.dims;
[Rmask,Ymask,Gmask,Bmask] = detect_colors(state);
masks = {Rmask,Gmask,Ymask,Bmask};

%find current board state
for i = 1:nColors
%      colored = state.img.ori .* uint8(masks{i});
%      figure();
%      imshow(colored);
    stats = regionprops(masks{i});
    for j = 1:size(stats)
        angle = get_angle([dims(4),dims(5)],stats(j).Centroid);
        fprintf("Color %s at angle = %0.4f\n",state.key{i+1,2},angle);
        for k = 1:length(state.wells)
            lower = (angle - 360/(length(state.wells)*2));
            upper = (angle + 360/(length(state.wells)*2));
            if ((state.wellLocs(k) >= lower) && ...
               (state.wellLocs(k) <= upper))
                 state.wells(k) = i;
            end
        end
    end
end

for i = 1:length(state.wells)
    fprintf("Well %0.0f contains the color %s\n",i,state.key{state.wells(i)+1,2});
end
