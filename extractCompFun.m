function [ img ] = extractCompFun( L,index )
%extractCompFun ��ȡͼ���index��ͨ��Ĳ���
%   �˴���ʾ��ϸ˵��
img = L==index(1);
for i = 2:length(index)
    img = img | L==index(i);
end
img( ~any(img,2), : ) = [];  %rows
img( :, ~any(img,1) ) = [];  %columns
[m,n] = size(img);
if n < 50
    extraL = round((50 - n)/2);
    img = [zeros(m,extraL),img,zeros(m,extraL)];
end
end

