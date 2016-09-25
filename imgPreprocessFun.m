function [ BW,L ] = imgPreprocessFun( imgDir,verbose )
%imgPreprocessFun 对图像进行预处理
%   预处理过程:
%   1. 二值化
%   2. 取反
%   3. 图形开运算
%   4. 图形闭运算
%   5. 提取连通部分

% 读取图片
if ischar(imgDir)
    img = imread(imgDir);
else
    img = imgDir;
end
if verbose
    figure, imshow(img)
end
% 二值化
level = graythresh(img);
BW = im2bw(img,level+0.01);

% 取反
BW = ~BW;
if verbose
    figure, imshow(BW)
end
% 开运算
se = strel('disk',1);
BW = imopen(BW,se);
if verbose
    figure, imshow(BW)
end
% 闭运算
se2 = strel('disk',2);
BW = imclose(BW,se2);
if verbose
    figure, imshow(BW)
end
% 标记连通区域
CC = bwconncomp(BW);
L = labelmatrix(CC);

end

