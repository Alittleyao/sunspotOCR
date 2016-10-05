close all
M = randi(60);
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1);
i = randi(N);

img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
% figure, imshow(img)

% 图像预处理
[ BW,L,CC ] = imgPreprocessFun( img,0 );
% figure, imshow(label2rgb(L));
% 上下区块分区
[ k,upImg,downImg ] = splitImgFun( BW,0 );
%处理上区块
[ aimCharIndex,aimChar,du,minus,plus,RGB,mergedImg ] = splitUpImgCharFun( upImg,0 );
%处理下区块
[ aimCharIndex2,aimChar2,RGB2,mergedImg2 ] = splitDownImgCharFun( downImg,0 );

% figure, imshow(RGB)
% figure, imshow(mergedImg)
% figure, imshow(RGB2)
% figure, imshow(mergedImg2)
 
% 将处理过程和结果拼接显示在一张图像上
[ allImg ] = mergeImageFun( {BW,RGB,mergedImg,RGB2,mergedImg2},1 );
figure, imshow(allImg)
