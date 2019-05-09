function [maeTest maeTrain] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda)

yTest = repmat(yTest,1,size(lamda,2));
yTrain = repmat(yTrain,1,size(lamda,2));

seTrain = sum(abs(yTrain-yEstTrain));
seTest = sum(abs(yTest-yEstTest));
maeTrain = seTrain;
maeTest = seTest;

end