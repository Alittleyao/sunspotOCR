function [ num ] = digits2numFun( numvec )
%digits2numFun 将单个的数字向量转换为数值
%   此处显示详细说明

N = length(numvec);
num = 0;
for i = 1:N
    num = num + numvec(i)*10^(N-i-1);
end

end

