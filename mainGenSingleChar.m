endFolder = 'singleChar';
mkdir(endFolder)

charIndex = 0;
for M = 1:60
    imgName = ls(fullfile('qukuaitu3',int2str(M),'*.jpg'));
    N = size(imgName,1);
        for i = 1:N
            img = imread(fullfile('qukuaitu3',int2str(M),imgName(i,:)));
            % 图像预处理
            [ BW,L,CC ] = imgPreprocessFun( img,0 );
            % 上下分区区域
            [ k,upImg,downImg ] = splitImgFun( BW,0 );
            [ aimCharIndex,aimChar,du,minus,plus,RGB,mergedImg ] = splitUpImgCharFun( upImg,0 );
            [ aimCharIndex2,aimChar2,RGB2,mergedImg2 ] = splitDownImgCharFun( downImg,0 );
            for j = 1:length(aimChar)
                temp = imgNormFun(aimChar{j});
                charIndex = charIndex + 1;
                imwrite(temp,fullfile(endFolder,['char',int2str(charIndex),'.jpg']))
            end
            for j = 1:length(aimChar2)
                temp = imgNormFun(aimChar2{j});
                charIndex = charIndex + 1;
                imwrite(temp,fullfile(endFolder,['char',int2str(charIndex),'.jpg']))
            end
%             [ allImg ] = mergeImageFun( {BW,RGB,mergedImg,RGB2,mergedImg2},1 );
%             imwrite(allImg,fullfile(endFolder,deblank(imgName(i,:))))
%             figure, imshow(allImg)
        end
end
