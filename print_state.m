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
    height = state.img.dims(2);
    width = state.img.dims(1);
    for i = 1:4
        stats = regionprops(state.masks{i});
        for j = 1:size(stats)
            center = [stats(j).Centroid(1)-height/2 width/2-stats(j).Centroid(2)];
            fprintf("Color %s at position (%0.0f,%0.0f)\n",state.key{i+1,2},...
                    center(1),center(2));
                plot(height/2,width/2,'w+','MarkerFaceColor','w');
            plot(stats(j).Centroid(1),stats(j).Centroid(2),'wO','MarkerFaceColor','w');
        end
    end
end

end

