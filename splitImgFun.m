function [ k ] = splitImgFun( img,verbose )
%splitImgFun �������Ϊ����, ���طָ��ߵ�����
%   
[i,~] = find(img==1);
[~,c] = kmeans(i,2);
k = round((c(1,:)+c(2,:))/2);
if verbose
    img(k,:) = 1;
    figure;imshow(img)
end
end

