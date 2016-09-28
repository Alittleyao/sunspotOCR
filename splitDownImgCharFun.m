function [ aimCharIndex,aimChar,RGB,mergedImg ] = splitDownImgCharFun( downImg,verbose )
%splitDownImgCharFun �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% �����ͨ����
CC = bwconncomp(downImg);
L = labelmatrix(CC);

% �ָ�ճ���ַ�
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 60 % �����ͨ��Ŀ�ȴ���60
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            downImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% �����ͨ����
CC = bwconncomp(downImg);
L = labelmatrix(CC);

% �ָ�ճ���ַ�
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 60 % �����ͨ��Ŀ�ȴ���60
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            downImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% �����ͨ����
CC = bwconncomp(downImg);
L = labelmatrix(CC);

% ��ȡ�����ַ�����
charImg = cell(1,CC.NumObjects);
for i = 1:CC.NumObjects
    charImg{i} = extractCompFun( L,i,1 );
end

% ��ȡ��������
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area,rMean,Height,Width] = findPropFun(downImg);

% Ѱ�ҵȺ�
[equal] = findEqualFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity,rMean,Centroid);
% Ѱ��Ʋ��
[ prime ] = findPrimeFun( Centroid,Eccentricity,rMean,MajorAxisLength,Orientation,Area );

[RGB] = imgHighlightComp( downImg,{equal,prime},{'red','blue'} );
if verbose
    figure,imshow(RGB)
end

% ɸ�����С��250 ���᳤����150 ����ͨ��
leftComp = setdiff(find(Area>250&MajorAxisLength>10&MajorAxisLength<150 &...
    abs(rMean - Centroid(:,2))' < 30 & Height >= 33),[equal,prime]);
leftN = length(leftComp);

aimCharIndex = leftComp;
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

