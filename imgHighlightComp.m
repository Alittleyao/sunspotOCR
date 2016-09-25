function  imgHighlightComp( BW,h )
%imgHighlightComp 高亮图像中的一部分
%   此处显示详细说明

% 转换为RGB
RGB = double(cat(3, BW, BW, BW));
% 标记连通区域
CC = bwconncomp(BW);
for i = 1:length(h)
    [I,J] = ind2sub(CC.ImageSize,CC.PixelIdxList{h(i)});
    RGB(I,J,2:3) = 0;
end

figure,imshow(RGB)

end

