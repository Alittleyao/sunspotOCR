function [du,minus] = findSymbolFun(upImg)
[Eccentricity,ConvexArea,Solidity,Centroid,Orientation,MajorAxisLength,Area] = findPropFun(upImg);
[du] = findDuFun( Eccentricity,ConvexArea,Solidity,Centroid );
% imgHighlightComp( upImg,du,'red' )
[minus] = findMinusFun(Eccentricity, Orientation,MajorAxisLength,Area,Solidity);
% imgHighlightComp( upImg,minus,'blue' )
imgHighlightComp( upImg,[du,minus],'red' )
end