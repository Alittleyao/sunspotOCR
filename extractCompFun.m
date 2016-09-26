function [ img,rIndex,cIndex ] = extractCompFun( L,index,extend )
%extractCompFun ��ȡͼ���index��ͨ��Ĳ���
%   �˴���ʾ��ϸ˵��
img = L==index(1);
for i = 2:length(index)
    img = img | L==index(i);
end
rIndex = find(any(img,2));
cIndex = find(any(img,1));

img( ~any(img,2), : ) = [];  %rows
img( :, ~any(img,1) ) = [];  %columns
[m,n] = size(img);

if extend == 1
    if n < 50
        extraL = round((50 - n)/2);
        img = [zeros(m,extraL),img,zeros(m,extraL)];
    end
end
end

