function [ aimCharIndex,aimChar,du,minus,plus ] = splitUpImgCharFun( upImg,verbose )
%splitCharFun 分割区块字符函数
%   此处显示详细说明

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 分割粘连字符
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 80 % 如果连通块的宽度大于80
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

% 提取单个字符矩阵
charImg = cell(1,CC.NumObjects);
for i = 1:CC.NumObjects
    charImg{i} = extractCompFun( L,i,1 );
end


% 提取区块属性
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% 寻找度号
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );

% 寻找减号
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);


% 筛掉面积小于200 主轴长大于150 的连通块
leftComp = setdiff(find(Area>200&MajorAxisLength>30&MajorAxisLength<150 &...
    (CC.ImageSize(1)-Centroid(:,2))' > 25),union(du,minus));
leftN = length(leftComp);

% 寻找加号
plus = [];
for i = 1:leftN
    if isPlusCharFun( charImg{leftComp(i)}, 0  );
        plus = [plus,leftComp(i)];
    end
end

if verbose 
    imgHighlightComp( upImg,[du,minus,plus],'red' )
end


aimCharIndex = setdiff(leftComp,plus);
aimN = length(aimCharIndex);
if verbose
    figure
    for i = 1:aimN
        subplot(1,aimN,i)
        imshow(charImg{aimCharIndex(i)})
    end
end

aimChar = cell(1,aimN);
for i = 1:aimN
    aimChar{i} = charImg{aimCharIndex(i)};
end

end

