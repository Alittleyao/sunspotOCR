function [ num ] = digits2numFun( numvec )
%digits2numFun ����������������ת��Ϊ��ֵ
%   �˴���ʾ��ϸ˵��

N = length(numvec);
num = 0;
for i = 1:N
    num = num + numvec(i)*10^(N-i-1);
end

end

