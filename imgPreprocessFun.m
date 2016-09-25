function [ BW,L ] = imgPreprocessFun( imgDir,verbose )
%imgPreprocessFun ��ͼ�����Ԥ����
%   Ԥ�������:
%   1. ��ֵ��
%   2. ȡ��
%   3. ͼ�ο�����
%   4. ͼ�α�����
%   5. ��ȡ��ͨ����

% ��ȡͼƬ
if ischar(imgDir)
    img = imread(imgDir);
else
    img = imgDir;
end
if verbose
    figure, imshow(img)
end
% ��ֵ��
level = graythresh(img);
BW = im2bw(img,level+0.01);

% ȡ��
BW = ~BW;
if verbose
    figure, imshow(BW)
end
% ������
se = strel('disk',1);
BW = imopen(BW,se);
if verbose
    figure, imshow(BW)
end
% ������
se2 = strel('disk',2);
BW = imclose(BW,se2);
if verbose
    figure, imshow(BW)
end
% �����ͨ����
CC = bwconncomp(BW);
L = labelmatrix(CC);

end

