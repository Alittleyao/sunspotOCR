function [duIndex] = findDuFun( upImg )
%findDuFun 此处显示有关此函数的摘要
%   此处显示详细说明
duIndex = [];
stats = regionprops(upImg, 'Eccentricity','ConvexArea','Solidity','Centroid');
temp1 = [stats.Eccentricity];
temp2 = [stats.ConvexArea];
temp3 = [stats.Solidity];
index = find( temp1<=0.904 &...
    temp2 >=190 & temp2 <=1300 &...
    temp3 >= 0.61);

if length(index) >= 2
    temp4 = cat(1,stats.Centroid);
    temp4 = temp4(index,:);
    [~,index2] = sort(temp4(:,2));
    duIndex = [index(index2(1:2))];
    imgHighlightComp( upImg,duIndex )
end
end

