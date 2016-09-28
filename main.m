close all
M = randi(60)
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1)
i = randi(N)

% M = 38, N = 5, i = 1
% M = 41, N = 5, i = 2

img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
% 图像预处理
[ BW,L,CC ] = imgPreprocessFun( img,0 );
figure, imshow(label2rgb(L));
% 上下分区区域
[ k,upImg,downImg ] = splitImgFun( BW,0 );
[ aimCharIndex,aimChar,du,minus,plus ] = splitUpImgCharFun( upImg,1 );
[ aimCharIndex2,aimChar2 ] = splitDownImgCharFun( downImg,1 );
%imgHighlightComp( upImg,[du,minus,plus],'red' )

% [ plus ] = isPlusCharFun( aimChar{4}, 1  )
% i = 1;
% figure, imshow(charImg{i})
% se = strel('line',15,90);
% temp = imopen(charImg{i},se);
% figure, imshow(temp)
% se2 = strel('line',15,0);
% temp2 = imopen(charImg{i},se2);
% figure, imshow(temp2)