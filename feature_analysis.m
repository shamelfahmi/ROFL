clear all; clc;% close all
n=9;
for i=1:n
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S1se1X.mat',i,'mvr',1,1);
sseTrain11(i) = sum(abs(yTrain-yEstTrain));
sseTest11(i) = sum(abs(yTest-yEstTest));
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S1se2X.mat',i,'mvr',1,1);
sseTrain12(i) = sum(abs(yTrain-yEstTrain));
sseTest12(i) = sum(abs(yTest-yEstTest));
end
mseTest1 = (sseTest11+sseTest12);
mseTrain1 = (sseTrain11+sseTrain12);
%__________________________________________________________________________
for i=1:n
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S2se1X.mat',i,'mvr',1,1);
sseTrain21(i) = sum(abs(yTrain-yEstTrain));
sseTest21(i) = sum(abs(yTest-yEstTest));
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S2se2X.mat',i,'mvr',1,1);
sseTrain22(i) = sum(abs(yTrain-yEstTrain));
sseTest22(i) = sum(abs(yTest-yEstTest));
end
mseTest2 = (sseTest21+sseTest22);
mseTrain2 = (sseTrain21+sseTrain22);
%__________________________________________________________________________
for i=1:n
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S3se1X.mat',i,'mvr',1,1);
sseTrain31(i) = sum(abs(yTrain-yEstTrain));
sseTest31(i) = sum(abs(yTest-yEstTest));
[yEstTest,yEstTrain,yTest,yTrain] = RMEregress('sameSizeS/S3se2X.mat',i,'mvr',1,1);
sseTrain32(i) = sum(abs(yTrain-yEstTrain));
sseTest32(i) = sum(abs(yTest-yEstTest));
end
mseTest3 = (sseTest31+sseTest32);
mseTrain3 = (sseTrain31+sseTrain32);
%% ________________________________________________________________________
mseTest = mseTest1+mseTest2+mseTest3;
mseTrain = mseTrain1+mseTrain2+mseTrain3;

mseTest = round(mseTest/(6*size(yTest,1)),1);
mseTrain = round(mseTrain/(6*size(yTrain,1)),1);

%subplot(121) %figure;
plot(mseTest/max(mseTest),'-o','LineWidth',2); hold on; 
plot(mseTrain/max(mseTest),'-o','LineWidth',2); grid on; 