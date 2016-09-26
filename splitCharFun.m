function [ leftComp ] = splitCharFun( upImg )
%splitCharFun 分割区块字符函数
%   此处显示详细说明

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 提取区块属性
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% 寻找度号
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);

% 筛掉面积小于260 主轴长大于150 的连通块
leftComp = setdiff(find(Area>260&MajorAxisLength<150 &...
    [CC.ImageSize(1)-Centroid(:,2)]' > 25),union(du,minus));
leftN = length(leftComp);
figure
for i = 1:leftN
    subplot(1,leftN,i)
    [ img ] = extractCompFun( L,leftComp(i) );
    imshow(img)
end

end

