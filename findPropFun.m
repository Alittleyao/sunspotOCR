function [Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg)
stats = regionprops(upImg, 'Eccentricity',...
    'ConvexArea','Solidity','Centroid','Orientation',...
    'MajorAxisLength','Area');
Eccentricity = [stats.Eccentricity];
ConvexArea = [stats.ConvexArea];
Solidity = [stats.Solidity];
Centroid = cat(1,stats.Centroid);
Orientation = [stats.Orientation];
MajorAxisLength = [stats.MajorAxisLength];
Area = [stats.Area];
end