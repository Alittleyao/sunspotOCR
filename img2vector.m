function [ vec ] = img2vector( filename )
%img2vector �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
fileID = fopen(filename);
C = textscan(fileID,'%1u8');
vec = transpose(logical(C{1}));
fclose(fileID);

end

