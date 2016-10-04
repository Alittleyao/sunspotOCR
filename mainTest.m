close all
% 随机选取图片
M = randi(60)
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1)
i = randi(N)

% 读取图片
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
% 图片预处理
[ BW,L,CC ] = imgPreprocessFun( img,0 );
% 上下分区区域
[ k,upImg,downImg ] = splitImgFun( BW,0 );
[ aimCharIndex,aimChar,du,minus,plus,RGB,mergedImg ] = splitUpImgCharFun( upImg,0 );
[ aimCharIndex2,aimChar2,RGB2,mergedImg2 ] = splitDownImgCharFun( downImg,0 );
[ allImg ] = mergeImageFun( {BW,RGB,mergedImg,RGB2,mergedImg2},1 );
figure, imshow(allImg)


[ data ] = readDataFun( img,model )
[ num,prob ] = recognizeDigitFun( aimChar2{8},model,1 )
% prob _ 0 4 1 5 2 3 6 7 8

figure, imshow(aimChar{1})
for i = 1:9
    [ num(i),prob ] = recognizeDigitFun( aimChar2{i},model,0 );
    fprintf('%d:\n',i)
    disp(prob)
end