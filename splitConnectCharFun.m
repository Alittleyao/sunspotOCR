function [ newImg,charImg ] = splitConnectCharFun( img,verbose )
%splitConnectCharFun 分割粘连在一起的字符
%   此处显示详细说明
% 标记连通区域
charImg = {};
for i = 1:4
    se = strel('disk', i);
    newImg = imerode(img, se);
    CC = bwconncomp(newImg);
    if CC.NumObjects == 2
        charImg = cell(1,CC.NumObjects);
        L = labelmatrix(CC);
        se2 = strel('disk',i-1);
        newImg = imdilate(newImg,se2);
        for j = 1:CC.NumObjects
            charImg{j} = extractCompFun( L,j,1 );
            if verbose
                figure, imshow(charImg{j})
            end
        end
        return
    end
end

newImg = img;
end

