close all
M = randi(60)
imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
N = size(imgName,1)
i = randi(N)
img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
% ͼ��Ԥ����
[ BW,L ] = imgPreprocessFun( img,1 );
figure, imshow(label2rgb(L));
% ���·�������
[ k,upImg,downImg ] = splitImgFun( BW,0 );
% Ѱ�ҶȺ�
[duIndex] = findDuFun( upImg );
