function [minusIndex] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity)
minusIndex = [];
index = find(Eccentricity >= 0.9 & ...
    Orientation >=-16.5 & Orientation <= 16.5 &...
    MajorAxisLength <= 100&...
    Area >= 120 &...
    Solidity >= 0.72 );
N = length(index);
if N >=1 && N <= 2
    minusIndex = index;
end
end