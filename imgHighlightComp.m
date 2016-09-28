function  [RGB] = imgHighlightComp( BW,h,color )
%imgHighlightComp ����ͼ���е�һ����
%   �˴���ʾ��ϸ˵��
if iscell(h)


    % �����ͨ����
    CC = bwconncomp(BW);
    L = labelmatrix(CC);

    R = double(BW);
    G = R;
    B = R;
    for i = 1:length(h)
        switch color{i}
            case 'yellow'
                colorVec = [1 1 0];
            case 'magenta'
                colorVec = [1 0 1];
            case 'cyan'
                colorVec = [0 1 1];
            case 'red'
                colorVec = [1 0 0];
            case 'green'
                colorVec = [0 1 0];
            case 'blue'
                colorVec = [0 0 1];
            case 'white'
                colorVec = [1 1 1];
            case 'black'
                colorVec = [0 0 0];
            otherwise
                colorVec = [1 0 0]; % red
        end
        for j = 1:length(h{i})
            R(L == h{i}(j)) = colorVec(1);
            G(L == h{i}(j)) = colorVec(2);
            B(L == h{i}(j)) = colorVec(3);
        end
    end

    % ת��ΪRGB
    RGB = cat(3, R, G, B);
%     figure,imshow(RGB)

end
end

