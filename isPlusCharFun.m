function [ plus ] = isPlusCharFun( img, verbose  )
%isPlusCharFun 判断img是否是'+'字符
%   此处显示详细说明
plus = 0;

% 垂直方向开运算
se = strel('line',15,90);
temp1 = imopen(img,se);
CC1 = bwconncomp(temp1);
% 水平方向开运算
se2 = strel('line',15,0);
temp2 = imopen(img,se2);
CC2 = bwconncomp(temp2);


if CC1.NumObjects == 1 && CC2.NumObjects == 1
    stats1 = regionprops(temp1,'Eccentricity','Orientation','Centroid');
    stats2 = regionprops(temp2,'Eccentricity','Orientation','Centroid');
    if abs(stats1.Orientation(1)) > 80 && abs(stats2.Orientation(1)) < 10 &&...
            stats1.Eccentricity(1) > 0.8 && stats2.Eccentricity(1) > 0.8 &&...
            abs(stats1.Centroid(1,2)-stats2.Centroid(1,2))<15
        plus = 1;
    end
end


% 画图
if verbose
    figure, imshow(img)
    figure, imshow(temp1)
    figure, imshow(temp2)
end

end

