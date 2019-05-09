clear all; clc; close all
subject = 'sameSizeS/S1se1X.mat';

t1=2; t2=3; t3=4; t4=5;
d1=3; d2=3; d3=5; d4=6; % including intercept
%___________________________________________________________________________
[yEst1,yTest1]  = RMEregress2(subject,t1,'mvregress',0,0);
[yEst2,~]       = RMEregress2(subject,t2,'mvregress',0,0);
[yEst3,~]       = RMEregress2(subject,t3,'mvregress',0,0);
[yEst4,~]       = RMEregress2(subject,t4,'mvregress',0,0);

[MAE1 STD1 AdjR1] = evaluatePerformance(yEst1,yTest1,d1);
[MAE2 STD2 AdjR2] = evaluatePerformance(yEst2,yTest1,d1);
[MAE3 STD3 AdjR3] = evaluatePerformance(yEst3,yTest1,d3);
[MAE4 STD4 AdjR4] = evaluatePerformance(yEst4,yTest1,d4);
%___________________________________________________________________________
[yEstR1,~] = RMEregress2(subject,t1,'ridge',1,0);
[yEstR2,~] = RMEregress2(subject,t2,'ridge',1,0);
[yEstR3,~] = RMEregress2(subject,t3,'ridge',1,0);
[yEstR4,~] = RMEregress2(subject,t4,'ridge',1,0);

[MAER1 STDR1 AdjRR1] = evaluatePerformance(yEstR1,yTest1,d1);
[MAER2 STDR2 AdjRR2] = evaluatePerformance(yEstR2,yTest1,d2);
[MAER3 STDR3 AdjRR3] = evaluatePerformance(yEstR3,yTest1,d3);
[MAER4 STDR4 AdjRR4] = evaluatePerformance(yEstR4,yTest1,d4);
%___________________________________________________________________________
[yEstL1,~] = RMEregress2(subject,t1,'lasso',0.1,1);
[yEstL2,~] = RMEregress2(subject,t2,'lasso',0.1,1);
[yEstL3,~] = RMEregress2(subject,t3,'lasso',0.1,1);
[yEstL4,~] = RMEregress2(subject,t4,'lasso',0.1,1);

[MAEL1 STDL1 AdjRL1] = evaluatePerformance(yEstL1,yTest1,d1);
[MAEL2 STDL2 AdjRL2] = evaluatePerformance(yEstL2,yTest1,d2);
[MAEL3 STDL3 AdjRL3] = evaluatePerformance(yEstL3,yTest1,d3);
[MAEL4 STDL4 AdjRL4] = evaluatePerformance(yEstL4,yTest1,d4);
%___________________________________________________________________________
[yEstS1,~] = RMEregress2(subject,t1,'svr',0.01,1);
[yEstS2,~] = RMEregress2(subject,t2,'svr',0.01,1);
[yEstS3,~] = RMEregress2(subject,t3,'svr',0.01,1);
[yEstS4,~] = RMEregress2(subject,t4,'svr',0.01,1);

[MAES1 STDS1 AdjRS1] = evaluatePerformance(yEstS1,yTest1,d1);
[MAES2 STDS2 AdjRS2] = evaluatePerformance(yEstS2,yTest1,d2);
[MAES3 STDS3 AdjRS3] = evaluatePerformance(yEstS3,yTest1,d3);
[MAES4 STDS4 AdjRS4] = evaluatePerformance(yEstS4,yTest1,d4);
%%___________________________________________________________________________

close all
testtime = 0:1:size(yTest1,1)-1; testtime=testtime*0.1;
esttime = 0:1:size(yEst1,1)-1; esttime=esttime*0.1;

subplot(221)
plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
plot(esttime,yEst1,'LineWidth',2); hold on;
plot(esttime,yEst2,'LineWidth',2); hold on;
plot(esttime,yEst3,'LineWidth',2); hold on;
plot(esttime,yEst4,'LineWidth',2); hold on;

xlim([0 70]); ylim([-10 10]); grid on;
title('MVR') ;xlabel('Time [s]'); ylabel('SI [mm]')
legend('yTest','Type #1','Type #2','Type #3','Type #4')

descr = {'Performance Measures';
    strcat('#1:',num2str(MAE1),setstr(177),num2str(STD1),'...',num2str(AdjR1));
    strcat('#2:',num2str(MAE2),setstr(177),num2str(STD2),'...',num2str(AdjR2));
    strcat('#3:',num2str(MAE3),setstr(177),num2str(STD3),'...',num2str(AdjR3));
    strcat('#4:',num2str(MAE4),setstr(177),num2str(STD4),'...',num2str(AdjR4));
    };
t = text(50,-7,descr,'FontSize',10,'Clipping','on','EdgeColor','b');
%___________________________________________________________________________
subplot(222)
plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
plot(esttime,yEstR1,'LineWidth',2); hold on;
plot(esttime,yEstR2,'LineWidth',2); hold on;
plot(esttime,yEstR3,'LineWidth',2); hold on;
plot(esttime,yEstR4,'LineWidth',2); hold on;

xlim([0 70]); ylim([-10 10]); grid on;
title('Ridge') ;xlabel('Time [s]'); ylabel('SI [mm]')
legend('yTest','Type #1','Type #2','Type #3','Type #4')

descr = {'Performance Measures';
    strcat('#1:',num2str(MAER1),setstr(177),num2str(STDR1),'...',num2str(AdjRR1));
    strcat('#2:',num2str(MAER2),setstr(177),num2str(STDR2),'...',num2str(AdjRR2));
    strcat('#3:',num2str(MAER3),setstr(177),num2str(STDR3),'...',num2str(AdjRR3));
    strcat('#4:',num2str(MAER4),setstr(177),num2str(STDR4),'...',num2str(AdjRR4));
    };
t = text(50,-7,descr,'FontSize',10,'Clipping','on','EdgeColor','b');
%___________________________________________________________________________
subplot(223)
plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
plot(esttime,yEstL1,'LineWidth',2); hold on;
plot(esttime,yEstL2,'LineWidth',2); hold on;
plot(esttime,yEstL3,'LineWidth',2); hold on;
plot(esttime,yEstL4,'LineWidth',2); hold on;

xlim([0 70]); ylim([-10 10]); grid on;
title('Lasso') ;xlabel('Time [s]'); ylabel('SI [mm]')
legend('yTest','Type #1','Type #2','Type #3','Type #4')

descr = {'Performance Measures';
    strcat('#1:',num2str(MAEL1),setstr(177),num2str(STDL1),'...',num2str(AdjRL1));
    strcat('#2:',num2str(MAEL2),setstr(177),num2str(STDL2),'...',num2str(AdjRL2));
    strcat('#3:',num2str(MAEL3),setstr(177),num2str(STDL3),'...',num2str(AdjRL3));
    strcat('#4:',num2str(MAEL4),setstr(177),num2str(STDL4),'...',num2str(AdjRL4));
    };
t = text(50,-7,descr,'FontSize',10,'Clipping','on','EdgeColor','b');
%___________________________________________________________________________
subplot(224)
plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
plot(esttime,yEstS1,'LineWidth',2); hold on;
plot(esttime,yEstS2,'LineWidth',2); hold on;
plot(esttime,yEstS3,'LineWidth',2); hold on;
plot(esttime,yEstS4,'LineWidth',2); hold on;

xlim([0 70]); ylim([-10 10]); grid on;
title('SVR') ;xlabel('Time [s]'); ylabel('SI [mm]')
legend('yTest','Type #1','Type #2','Type #3','Type #4')

descr = {'Performance Measures';
    strcat('#1:',num2str(MAES1),setstr(177),num2str(STDS1),'...',num2str(AdjRS1));
    strcat('#2:',num2str(MAES2),setstr(177),num2str(STDS2),'...',num2str(AdjRS2));
    strcat('#3:',num2str(MAES3),setstr(177),num2str(STDS3),'...',num2str(AdjRS3));
    strcat('#4:',num2str(MAES4),setstr(177),num2str(STDS4),'...',num2str(AdjRS4));
    };
t = text(50,-7,descr,'FontSize',10,'Clipping','on','EdgeColor','b');