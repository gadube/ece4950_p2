function [] = print_state(state,version)
%print_state print the current state
%version 1 prints well location, others print color location
clc;close all;
if (version == 1)
    for i = 1:length(state.wells)
        fprintf("Well %0.0f contains the color %s\n",i,state.key{state.wells(i)+1,2});
    end
else
    figure();
    imshow(state.img.clean);
    hold on;
    for i = 1:4
        stats = regionprops(state.masks{i});
        for j = 1:size(stats)
            fprintf("Color %s at position (%0.0f,%0.0f)\n",state.key{i+1,2},...
                    stats(j).Centroid(1),stats(j).Centroid(2));
            plot(stats(j).Centroid(1),stats(j).Centroid(2),'kO');
        end
    end
end

end

