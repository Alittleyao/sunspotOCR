function [ prime ] = findPrimeFun( Centroid,Eccentricity )
%findPrimeFun �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

prime = [];
index = find((Centroid(:,2))' < 70 & Eccentricity> 0.93);

if length(index) == 1
    prime = index;
end

end

