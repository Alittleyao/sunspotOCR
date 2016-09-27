function [ aimCharIndex,aimChar,du,minus,plus ] = splitUpImgCharFun( upImg,verbose )
%splitCharFun �ָ������ַ�����
%   �˴���ʾ��ϸ˵��

% �����ͨ����
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% �ָ�ճ���ַ�
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 80 % �����ͨ��Ŀ�ȴ���80
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            upImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% �����ͨ����
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% �ָ�ճ���ַ�
for i = 1:CC.NumObjects
    if sum(any(L==i)) > 63 % �����ͨ��Ŀ�ȴ���80
        [img,rIndex,cIndex] = extractCompFun( L,i,0 );
        [ newImg,splitCharImg ] = splitConnectCharFun( img,0 );
        if ~isempty(splitCharImg)
            upImg(rIndex,cIndex) = newImg | (L(rIndex,cIndex) ~= i & L(rIndex,cIndex)~=0 );
        end
    end
end

% �����ͨ����
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% ��ȡ�����ַ�����
charImg = cell(1,CC.NumObjects);
for i = 1:CC.NumObjects
    charImg{i} = extractCompFun( L,i,1 );
end


% ��ȡ��������
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% Ѱ�ҶȺ�
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );

% Ѱ�Ҽ���
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);


% ɸ�����С��200 ���᳤����150 ����ͨ��
leftComp = setdiff(find(Area>200&MajorAxisLength>30&MajorAxisLength<150 &...
    (CC.ImageSize(1)-Centroid(:,2))' > 25),union(du,minus));
leftN = length(leftComp);

% Ѱ�ҼӺ�
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

