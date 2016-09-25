close all
M = randi(60)
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1)
i = randi(N)
img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
figure
imshow(img)
level = graythresh(img);
BW = im2bw(img,level);
BW = ~BW;
figure
imshow(BW)

se = strel('disk',1);
se2 = strel('disk',2);
BW2 = imopen(BW,se);
figure, imshow(BW2)
BW3 = imclose(BW2,se2);
figure, imshow(BW3)

CC = bwconncomp(BW3);
L = labelmatrix(CC);
% L = bwlabel(BW3,4);
figure, imshow(label2rgb(L));