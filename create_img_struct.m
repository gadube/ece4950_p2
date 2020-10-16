function [gameState] = create_img_struct(origImg,backgnd,numWells)
%create_img_struct Create game state struct
SE = strel('disk',10);

imgStruct.ori = origImg;
imgStruct.bg  = backgnd;
imgStruct.sub = subtract_background(imgStruct.ori,imgStruct.bg);
imgStruct.bin = cvt_binary_img(imgStruct.sub);
imgStruct.erode  = imerode(imgStruct.bin,SE);
imgStruct.clean  = uint8(imdilate(imgStruct.erode,SE)) .* imgStruct.ori;
imgStruct.cbin   = cvt_binary_img(imgStruct.clean);
[height,width,depth] = size(imgStruct.ori);
center = [width/2,height/2];
imgStruct.dims = [height,width,depth,center];

gameState.img = imgStruct;

[gameState.angles, gameState.relAngles] = get_all_angles(gameState.img.cbin);
% gameState.stats = regionprops(gameState.img.cbin,'all');


gameState.key = {'0','Empty';'1','Red';'2','Green';'3','Yellow';'4','Blue'};
gameState.wellColor = zeros(1,numWells);
gameState.wellBins = rad2deg(linspace(0,2*pi,numWells*2)) - 180;
wellLocs = rad2deg(linspace(0,2*pi,numWells+1));
wellLocs = wellLocs(1:numWells);
gameState.wellLocs = wellLocs - (wellLocs > 180)*360;
gameState.wells = zeros(1,numWells);
end

