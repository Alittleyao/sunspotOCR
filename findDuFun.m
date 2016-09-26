function [duIndex] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid )
%findDuFun 此处显示有关此函数的摘要
%   此处显示详细说明
duIndex = [];
index = find( Eccentricity<=0.904 &...
    ConvexArea >=190 & ConvexArea <=1300 &...
    Solidity >= 0.58);

if length(index) >= 2
    Centroid = Centroid(index,:);
    [~,index2] = sort(Centroid(:,2));
    duIndex = [index(index2(1:2))];
end
end