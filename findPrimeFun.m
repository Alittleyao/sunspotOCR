function [ prime ] = findPrimeFun( Centroid,Eccentricity )
%findPrimeFun 此处显示有关此函数的摘要
%   此处显示详细说明

prime = [];
index = find((Centroid(:,2))' < 70 & Eccentricity> 0.93);

if length(index) == 1
    prime = index;
end

end

