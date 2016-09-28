function [ prime ] = findPrimeFun( Centroid,Eccentricity,rMean,MajorAxisLength,Orientation,Area )
%findPrimeFun �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

prime = [];
index = find(rMean - (Centroid(:,2))' > 8 &...
    Eccentricity> 0.80 & MajorAxisLength < 60 &...
    abs(Orientation) > 30 & Area > 100 & Area < 500);

if 1%length(index) == 1
    prime = index;
end

end

