function [ newImg ] = mergeImageFun( img,type )
%mergeImageFun 此处显示有关此函数的摘要
%   type = 0 横向拼接 type = 1 纵向拼接
N = length(img);
height = zeros(1,N);
width = zeros(1,N);
for i = 1:N
    [height(i), width(i),~] = size(img{i});
end
gap = 20;
if type == 0 % 横向拼接
    maxHeight = max(height);
%     newImg = zeros(maxHeight,sum(width)+2*N*gap,3);
%     currentC = 1;
    for i = 1:N
        extraL = round((maxHeight - height(i))/2);
        if length(size(img{i})) ==3
            temp = cat(1,zeros(extraL,width(i),3),img{i},zeros(maxHeight-height(i)-extraL,width(i),3));
            img{i} = padarray(temp,[0 gap 0]);
        else
            temp = cat(1,zeros(extraL,width(i)),img{i},zeros(maxHeight-height(i)-extraL,width(i)));
            temp = padarray(temp,[0 gap]);
            img{i} = double(cat(3,temp,temp, temp));
        end
        
%         extraL = round((maxHeight - height(i))/2);
%         temp = cat(1,zeros(extraL,width(i),3),img{i},zeros(maxHeight-height(i)-extraL,width(i),3));
%         newImg(1:maxHeight,currentC:currentC+width(i)+2*gap-1,:) = padarray(temp,[0 gap 0]);
%         currentC = currentC+width(i)+2*gap + 1;
    end
    newImg = cat(2,img{:});
else
    maxWidth = max(width);
%     newImg = zeros(sum(height)+2*N*gap,maxWidth,3);
%     currentR = 1;
    for i = 1:N
        extraL = round((maxWidth - width(i))/2);
        if length(size(img{i})) ==3
            temp = cat(2,zeros(height(i),extraL,3),img{i},zeros(height(i),maxWidth -width(i)- extraL,3));
            img{i} = padarray(temp,[gap 0 0]); 
        else
            temp = cat(2,zeros(height(i),extraL),img{i},zeros(height(i),maxWidth -width(i)- extraL));
            temp = padarray(temp,[gap 0]); 
            img{i} = double(cat(3,temp,temp, temp));
        end
%         newImg(currentR:currentR+height(i)+2*gap-1,1:maxWidth,:) =padarray(temp,[gap 0 0]); 
%         currentR = currentR+height(i)+2*gap + 1;
    end
    newImg = cat(1,img{:});
end



end

