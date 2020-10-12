function [cam,bg] = setup_camera(i)
%setup_camera Script to set up camera
%   Sets up first webcam from position "i" in the webcamlist
cam_list = webcamlist;
cam_name = cam_list{i};
cam = webcam(cam_name);
preview(cam);
%Setup bg
input("Capturing Snapshot of Background (Remove all stickers)...");
bg = snapshot(cam);

% figure();
% imshow(bg);
closePreview(cam);
end

