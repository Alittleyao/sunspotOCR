function [ num,prob ] = recognizeDigitFun( img,model,verbose )
%recognizeDigitFun ʶ������
%   �˴���ʾ��ϸ˵��

% ��һ��ͼ��
[img] = imgNormFun(img);
if verbose
    figure, imshow(img)
end
vec = reshape(img,1,28*28);

[num,~,prob] = svmpredict(0, double(vec), model,'-b 1 -q' );

end

