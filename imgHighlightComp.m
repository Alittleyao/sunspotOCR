function  imgHighlightComp( BW,h )
%imgHighlightComp ����ͼ���е�һ����
%   �˴���ʾ��ϸ˵��

% ת��ΪRGB
RGB = double(cat(3, BW, BW, BW));
% �����ͨ����
CC = bwconncomp(BW);
for i = 1:length(h)
    [I,J] = ind2sub(CC.ImageSize,CC.PixelIdxList{h(i)});
    RGB(I,J,2:3) = 0;
end

figure,imshow(RGB)

end

