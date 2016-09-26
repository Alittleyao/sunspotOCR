function [ leftComp,charImg ] = splitCharFun( upImg )
%splitCharFun 分割区块字符函数
%   此处显示详细说明

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 分割粘连字符
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 63 % 如果连通块的宽度大于80
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            upImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 分割粘连字符
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 63 % 如果连通块的宽度大于80
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            upImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 提取区块属性
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% 寻找度号
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);

% 筛掉面积小于260 主轴长大于150 的连通块
leftComp = setdiff(find(Area>200&MajorAxisLength>30&MajorAxisLength<150 &...
    [CC.ImageSize(1)-Centroid(:,2)]' > 25),union(du,minus));
leftN = length(leftComp);
charImg = cell(1,leftN);
figure
for i = 1:leftN
    subplot(1,leftN,i)
    charImg{i} = extractCompFun( L,leftComp(i),1 );
    [~,n] = size(charImg{i});
    if n > 120
        disp(i)
        disp(n)
    end
    imshow(charImg{i})
end

end

