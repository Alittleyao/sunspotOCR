function [ k,upImg,downImg ] = splitImgFun( img,verbose )
%splitImgFun 将区块分为两行, 返回分割线的行数，上部分图像，下部分图像
% 对所有为1的像素所对应的行数聚成两类，
% 两个聚类中心点的平均值即为分割线的行数  
[i,~] = find(img==1);
[~,c] = kmeans(i,2);
k = round((c(1,:)+c(2,:))/2);
upImg = img(1:k,:);
downImg = img(k:end,:);
if verbose
    img(k,:) = 1;
    figure;imshow(img)
    figure;imshow(upImg)
    figure;imshow(downImg)
end
end

