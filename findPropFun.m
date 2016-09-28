function [Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area,rMean,Height,Width] = findPropFun(img)
[I,~] = find(img);
rMean = mean(I);
stats = regionprops(img, 'Eccentricity',...
    'ConvexArea','Solidity','Centroid','Orientation',...
    'MajorAxisLength','Area','Image');
Eccentricity = [stats.Eccentricity];
ConvexArea = [stats.ConvexArea];
Solidity = [stats.Solidity];
Centroid = cat(1,stats.Centroid);
Orientation = [stats.Orientation];
MajorAxisLength = [stats.MajorAxisLength];
Area = [stats.Area];
N = length(Area);
Width = zeros(1,N);
Height = zeros(1,N);
for i = 1:N
    [Height(i),Width(i)] = size(stats(i).Image);
end

end