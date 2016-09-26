function [ leftComp,charImg ] = splitCharFun( upImg )
%splitCharFun �ָ������ַ�����
%   �˴���ʾ��ϸ˵��

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

% ��ȡ��������
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% Ѱ�ҶȺ�
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);

% ɸ�����С��260 ���᳤����150 ����ͨ��
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

