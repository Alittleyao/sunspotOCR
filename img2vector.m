function [ vec ] = img2vector( filename )
%img2vector 此处显示有关此函数的摘要
%   此处显示详细说明
fileID = fopen(filename);
C = textscan(fileID,'%1u8');
vec = transpose(logical(C{1}));
fclose(fileID);

end

