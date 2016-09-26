function [duIndex] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid )
%findDuFun �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
duIndex = [];
index = find( Eccentricity<=0.904 &...
    ConvexArea >=190 & ConvexArea <=1300 &...
    Solidity >= 0.58);

while length(index) >= 2
    Centroid2 = Centroid(index,:);
    [~,index2] = sort(Centroid2(:,2));
    duIndex = [index(index2(1:2))];
    if abs(diff(Centroid2(index2(1:2),1))) < 40
        index(index2(2)) = [];
    else
        break
    end
end
end