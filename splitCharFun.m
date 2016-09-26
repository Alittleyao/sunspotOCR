function [ leftComp ] = splitCharFun( upImg )
%splitCharFun �ָ������ַ�����
%   �˴���ʾ��ϸ˵��

% �����ͨ����
CC = bwconncomp(upImg);
L = labelmatrix(CC);

% ��ȡ��������
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);

% Ѱ�ҶȺ�
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);

% ɸ�����С��260 ���᳤����150 ����ͨ��
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

