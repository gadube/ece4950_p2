function [] = print_state(state)
%print_state print the current state
clc;
for i = 1:length(state.wells)
    fprintf("Well %0.0f contains the color %s\n",i,state.key{state.wells(i)+1,2});
end
end

