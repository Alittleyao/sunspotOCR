function [img] = imgNormFun(img)
% ¹éÒ»»¯Í¼Ïñ
[height,width] = size(img);
if height > width
    padWidth = round((height - width)/2);
    img = padarray(img,[0 padWidth]);
elseif width > height
    padHeight = round((width - height)/2);
    img = padarray(img,[padHeight, 0]);
end
img = imresize(img, [28, 28]);
end