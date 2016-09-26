close all
M = randi(60)
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1)
i = randi(N)
img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
% 图像预处理
[ BW,L,CC ] = imgPreprocessFun( img,0 );
figure, imshow(label2rgb(L));
% 上下分区区域
[ k,upImg,downImg ] = splitImgFun( BW,0 );
% 寻找度号
[du] = findSymbolFun(upImg);

[ leftComp ] = splitCharFun( upImg );