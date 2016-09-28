function [ aimCharIndex,aimChar,du,minus,plus,RGB,mergedImg ] = splitUpImgCharFun( upImg,verbose )
%splitCharFun 分割区块字符函数
%   此处显示详细说明

% 标记连通区域
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% 分割粘连字符
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 60 % 如果连通块的宽度大于60
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
    if sum(any(L==i)) > 60 % 如果连通块的宽度大于60
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
[RGB] = imgHighlightComp( upImg,{du,minus,plus},{'red','blue','green'} ); 
if verbose
    figure, imshow(RGB)
end


aimCharIndex = setdiff(leftComp,plus);
aimN = length(aimCharIndex);


aimChar = cell(1,aimN);
for i = 1:aimN
    aimChar{i} = charImg{aimCharIndex(i)};
end

[ mergedImg ] = mergeImageFun( aimChar,0 );
if verbose
    figure
    imshow(mergedImg)
end
end

