function [ data ] = readDataFun( img,model )
%readDataFun 从区块图片读取数据
%   此处显示详细说明
data = zeros(1,5);
% 图片预处理
[ BW,L,CC ] = imgPreprocessFun( img,0 );
% 上下分区区域
[ k,upImg,downImg ] = splitImgFun( BW,0 );
% 分割上区块
[ aimCharIndex,aimChar,du,minus,plus,RGB,mergedImg ] = splitUpImgCharFun( upImg,0 );
% 分割下区块
[ aimCharIndex2,aimChar2,RGB2,mergedImg2 ] = splitDownImgCharFun( downImg,0 );

% 读取上区块
Nup = length(aimCharIndex);
if length(du) == 2
    index1 = sum(du(1)>aimCharIndex);
    index2 = sum(du(2)>aimCharIndex);
    if index2 + 1 < Nup && index1 + 1 < index2
        numUp = zeros(1,index2+1);
        for i = 1:index2+1
            [ numUp(i),~ ] = recognizeDigitFun( aimChar{i},model,0 );
        end
        data(1) = digits2numFun(numUp(1:(index1+1)));
        data(2) = digits2numFun(numUp((index1+2):(index2+1)));
    else
        data(1) = nan;
        data(2) = nan;
    end
else
    data(1) = nan;
    data(2) = nan;
end

% 读取下区块
Ndown = length(aimCharIndex2);
if Ndown == 9
    digitsIndex = [2 3 5 6 8 9];
    numDown = zeros(1,6);
    for i = 1:6
        [numDown(i), ~] = recognizeDigitFun(aimChar2{digitsIndex(i)},model,0);
    end
    data(3) = digits2numFun(numDown(1:2));
    data(4) = digits2numFun(numDown(3:4));
    data(5) = digits2numFun([numDown(5:6),0]);
else
    data(3:5) = nan;
end


end

