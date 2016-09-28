function [ prime ] = findPrimeFun( Centroid,Eccentricity,rMean,MajorAxisLength,Orientation,Area )
%findPrimeFun 此处显示有关此函数的摘要
%   此处显示详细说明

prime = [];
index = find(rMean - (Centroid(:,2))' > 8 &...
    Eccentricity> 0.80 & MajorAxisLength < 60 &...
    abs(Orientation) > 30 & Area > 100 & Area < 500);

if 1%length(index) == 1
    prime = index;
end

end

