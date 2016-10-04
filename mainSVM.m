% trainFolder = 'trainingDigits';
% fileNameList = ls(fullfile(trainFolder,'*.txt'));
% N = size(fileNameList,1);
% trainMat = zeros(N,1024);
% trainLabel = zeros(N,1);
% for i = 1:N
%     trainLabel(i) = str2double(fileNameList(i,1));
%     fileName = fullfile(trainFolder,fileNameList(i,:));
%     fileName = deblank(fileName);
%     trainMat(i,:) = img2vector( fileName );
% end
% 
% testFolder = 'testDigits';
% fileNameList = ls(fullfile(testFolder,'*.txt'));
% N = size(fileNameList,1);
% testMat = zeros(N,1024);
% testLabel = zeros(N,1);
% for i = 1:N
%     testLabel(i) = str2double(fileNameList(i,1));
%     fileName = fullfile(trainFolder,fileNameList(i,:));
%     fileName = deblank(fileName);
%     testMat(i,:) = img2vector( fileName );
% end


trainImages = loadMNISTImages('train-images.idx3-ubyte');
trainLabels = loadMNISTLabels('train-labels.idx1-ubyte');
testImages = loadMNISTImages('t10k-images.idx3-ubyte');
testLabels = loadMNISTLabels('t10k-labels.idx1-ubyte');

model = svmtrain(trainLabels, trainImages','-b 1 -q');
  temp = trainMat(216,:);
temp2 = reshape(temp,32,32)';
figure, imshow(temp2)




