function  imgHighlightComp( BW,h,color )
%imgHighlightComp 高亮图像中的一部分
%   此处显示详细说明
switch color
    case 'yellow'
        colorVec = [1 1 0];
    case 'magenta'
        colorVec = [1 0 1];
    case 'cyan'
        colorVec = [0 1 1];
    case 'red'
        colorVec = [1 0 0];
    case 'green'
        colorVec = [0 1 0];
    case 'blue'
        colorVec = [0 0 1];
    case 'white'
        colorVec = [1 1 1];
    case 'black'
        colorVec = [0 0 0];
    otherwise
        colorVec = [1 0 0]; % red
end
% 转换为RGB
RGB = double(cat(3, BW, BW, BW));
% 标记连通区域
CC = bwconncomp(BW);
for i = 1:length(h)
    [I,J] = ind2sub(CC.ImageSize,CC.PixelIdxList{h(i)});
    RGB(I,J,2:3) = 0;
%     RGB(I,J,1) = colorVec(1);
%     RGB(I,J,2) = colorVec(2);
%     RGB(I,J,3) = colorVec(3);
end

figure,imshow(RGB)

end

