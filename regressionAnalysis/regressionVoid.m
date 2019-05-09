clear all; clc; close all
subject = 'sameSizeS\S1se1X.mat';

type =22;

%[yEst,yTest]  = RMEregress(subject,type,'mvregress',0,0);
lamda = 0:0.5:5;
[yEstR,yTestR] = RMEregress(subject,2,'ridge',3,0);
[yEstR2,yTestR2] = RMEregress(subject,5,'ridge',3,0);
%[0.01,0.03,0.07]
%[yEstL,yTestL] = RMEregress(subject,type,'lasso',[0.07,0.1,0.15],1);
%[yEstS,yTestS] = RMEregressV3noFolds(subject,type,'svr',[0.02,0.03,0.01],1,sampled);
whos
% mean(sum(abs(yTest)))/size(yTest,1)
% mean(sum(abs(-yTestR-yEstR(:,3))))/size(yTestR,1)
% mean(sum(abs(-yTestL-yEstL(:,3))))/size(yTestL,1)
% mean(sum(abs(-yTestS-yEstS(:,1))))/size(yTestL,1)
%
testtime = 0:1:size(yTestR,1)-1; testtime=testtime*0.1;
esttime = 0:1:size(yEstR,1)-1; esttime=esttime*0.1;

%figure('Name',subject);
plot(testtime,yTestR,':','MarkerSize', 2,'LineWidth',2); hold on; 
plot(esttime,yEstR,'LineWidth',2); hold on;
plot(esttime,yEstR2,'LineWidth',2); hold on;
%plot(esttime,yEst,'LineWidth',2); hold on;
xlim([0 70]); ylim([-10 10]); grid on;
title('MVR')
xlabel('Time [sec]')
%legend('yTest','yEst')
[MAE STD AdjR] = evaluatePerformance(yEstR,yTestR,2)
[MAE STD AdjR] = evaluatePerformance(yEstR2,yTestR2,12)
%[MAE STD AdjR] = evaluatePerformance(yEstL(:,1),yTestL,5)
%[MAE STD AdjR] = evaluatePerformance(yEstL(:,2),yTestL,5)
%[MAE STD AdjR] = evaluatePerformance(yEstL(:,3),yTestL,5)

%%
bamda = 3;

testtime = 0:1:size(yTest,1)-1; testtime=testtime*0.1;
esttime = 0:1:size(yEst,1)-1; esttime=esttime*0.1;

%figure('Name',subject);
subplot(2,2,1)
plot(testtime,yTest,':','MarkerSize', 2,'LineWidth',2); hold on; 
plot(esttime,yEst,'LineWidth',2); hold on;
xlim([0 70]); ylim([-10 10]); grid on;
title('MVR')
xlabel('Time [sec]')
legend('yTest','yEst')
%
subplot(2,2,2)
plot(testtime,yTestR,':','MarkerSize', 2,'LineWidth',2); hold on; 
plot(esttime,yEstR(:,bamda),'LineWidth',2); hold on;
xlim([0 70]); ylim([-10 10]); grid on;
title('Ridge')
xlabel('Time [sec]')
legend('yTest','yEst')

subplot(2,2,3)
plot(testtime,yTestL,':','MarkerSize', 2,'LineWidth',2); hold on; 
plot(esttime,yEstL(:,bamda),'LineWidth',2); hold on;
xlim([0 70]); ylim([-10 10]); grid on;
title('Lasso')
xlabel('Time [sec]')
legend('yTest','yEst')

subplot(2,2,4)
plot(testtime,yTestS,':','MarkerSize', 2,'LineWidth',2); hold on; 
plot(esttime,yEstS(:,bamda),'LineWidth',2); hold on;
xlim([0 70]); ylim([-10 10]); grid on;
title('SVR')
xlabel('Time [sec]')
legend('yTest','yEst')

%%
mean(sum(abs(yTest)))/size(yTest,1)
mean(sum(abs(yTest-yEst)))/size(yTest,1)
mean(sum(abs(yTestR-yEstR(:,3))))/size(yTestR,1)
mean(sum(abs(yTestL-yEstL(:,3))))/size(yTestL,1)
mean(sum(abs(yTestS-yEstS(:,3))))/size(yTestL,1)

