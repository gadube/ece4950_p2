function [gameState] = create_img_struct(origImg,backgnd,numWells)
%create_img_struct Create game state struct
SE = strel('disk',20);

imgStruct.ori = origImg;
imgStruct.bg  = backgnd;
imgStruct.sub = subtract_background(imgStruct.ori,imgStruct.bg);
imgStruct.bin = cvt_binary_img(imgStruct.sub);
imgStruct.erode  = imerode(imgStruct.bin,SE);
imgStruct.clean  = uint8(imdilate(imgStruct.erode,SE)) .* imgStruct.ori;

[height,width,depth] = size(imgStruct.ori);
center = [width/2,height/2];
imgStruct.dims = [height,width,depth,center];

gameState.img = imgStruct;

[gameState.angles, gameState.relAngles] = get_all_angles(gameState.img.bin);
% gameState.stats = regionprops(gameState.img.cbin,'all');


gameState.key = {'0','Empty';'1','Red';'2','Green';'3','Yellow';'4','Blue'};
gameState.wellColor = zeros(1,numWells);
gameState.wellLocs = [0 45 90 135 180 -135 -90 -45];
gameState.wells = [0 0 0 0 0 0 0 0];
end

