function [ num,prob ] = recognizeDigitFun( img,model,verbose )
%recognizeDigitFun 识别数字
%   此处显示详细说明

% 归一化图像
[img] = imgNormFun(img);
if verbose
    figure, imshow(img)
end
vec = reshape(img,1,28*28);

[num,~,prob] = svmpredict(0, double(vec), model,'-b 1 -q' );

end

