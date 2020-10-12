function [R,Y,G,B] = detect_colors(gameState)
%detect_colors Determines colors masks for image
%   Detect colors and return colors from list
image = gameState.img.clean;

R = image(:,:,1) >= 80 & image(:,:,2) < 135 & image(:,:,3) < 170;
G = image(:,:,1) < 120 & image(:,:,2) >= 45 & image(:,:,3) < 150;
Y = image(:,:,1) >= 210 & image(:,:,2) >= 50 & image(:,:,3) < 190;
B = image(:,:,1) < 120 & image(:,:,2) < 135 & image(:,:,3) >= 120;

%clean up masks
junksize = 300;
R = bwareaopen(R,junksize);
Y = bwareaopen(Y,junksize);
G = bwareaopen(G,junksize);
B = bwareaopen(B,junksize);

R = imfill(R,'holes');
G = imfill(G,'holes');
Y = imfill(Y,'holes');
B = imfill(B,'holes');

% figure();
% imshow(gameState.img.clean);
% title("CLEANED");
% figure();
% imshow(R);
% title("RED MASK");
% figure();
% imshow(G);
% title("GREEN MASK");
% figure();
% imshow(B);
% title("BLUE MASK");
% figure();
% imshow(Y);
% title("YELLOW MASK");


end

