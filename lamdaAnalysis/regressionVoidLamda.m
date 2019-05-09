clear all; clc; close all
for i = 1:2
if i==1
regAlg = 'ridge';
lamda = 0:0.1:1;
else 
regAlg = 'lasso';
lamda = 0:0.1:1;
end
t = 3; alpha = 1;
subject = 'sameSizeS/S1se1X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest11,seTrain11] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
subject = 'sameSizeS/S1se2X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest12,seTrain12] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
seTest1  = seTest11+seTest12;
seTrain1 = seTrain11+seTrain12;
%__________________________________________________________________________
subject = 'sameSizeS/S2se1X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest21,seTrain21] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
subject = 'sameSizeS/S2se2X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest22,seTrain22] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
seTest2  = seTest21+seTest22;
seTrain2 = seTrain21+seTrain22;
%__________________________________________________________________________
subject = 'sameSizeS/S3se1X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest31,seTrain31] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
subject = 'sameSizeS/S3se2X.mat';
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,t,regAlg,lamda,alpha);
[seTest32,seTrain32] = evaluateLambda(yEstTest, yTest, yEstTrain, yTrain,lamda);
seTest3  = seTest31+seTest32;
seTrain3 = seTrain31+seTrain32;
% ________________________________________________________________________
seTest = seTest1 + seTest2 + seTest3;
seTrain = seTrain1 + seTrain2 + seTrain3;
seTest = round(seTest/(6*size(yTest,1)),1);
seTrain = round(seTrain/(6*size(yTrain,1)),1);

subplot(1,2,i)
plot(lamda,seTest/1.5,'-o','LineWidth',2); hold on; 
plot(lamda,seTrain/1.5,':o','LineWidth',2); hold on; 
grid on; 
end