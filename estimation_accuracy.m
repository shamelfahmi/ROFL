clear all; clc; close all
addpath(genpath('.'))
par=[];
t=4;
E = [];
for x=1:3:18;
    if (x==1)
        subject = 'sameSizeS/S1se1X.mat';
    elseif (x==4)
        subject = 'sameSizeS/S1se2X.mat';
    elseif (x==7)
        subject = 'sameSizeS/S2se1X.mat';
    elseif (x==10)
        subject = 'sameSizeS/S2se2X.mat';
    elseif (x==13)
        subject = 'sameSizeS/S3se1X.mat';
    elseif (x==16)
        subject = 'sameSizeS/S3se2X.mat';
    end
    
    [yEst1,yTest1]  = RMEregress2(subject,t,'mvregress',0,0);
    [MAE1,STD1,AdjR1] = evaluatePerformance(yEst1,yTest1,5);
    %eM = downsample(yTest1(1:600),10)-downsample(yEst1(1:600),10);
    eM = yTest1(400:460) - yEst1(400:460);
    
    [yEstR1,~] = RMEregress2(subject,t,'ridge',0.1,0);
    [MAER1,STDR1,AdjRR1] = evaluatePerformance(yEstR1,yTest1,5);
    %eR = downsample(yTest1(1:600),10)-downsample(yEstR1(1:600),10);
    eR = yTest1(400:460) - yEstR1(400:460);
    
    [yEstL1,~] = RMEregress2(subject,t,'lasso',0.2,1);
    [MAEL1,STDL1,AdjRL1] = evaluatePerformance(yEstL1,yTest1,5);
    %eL = downsample(yTest1(1:600),10)-downsample(yEstL1(1:600),10);
    eL = yTest1(400:460) - yEstL1(400:460);
    
    eT = [eM eR eL];
    E = [E eT];
    ptemp = [MAE1 STD1 AdjR1 MAER1 STDR1 AdjRR1 MAEL1 STDL1 AdjRL1];
    par = [par;ptemp];
    %___________________________________________________________________________
    testtime = 0:1:size(yTest1,1)-1; testtime=testtime*0.1;
    esttime = 0:1:size(yEst1,1)-1; esttime=esttime*0.1;
    %___________________________________________________________________________
    subplot(6,3,x)
    plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
    plot(esttime,yEst1,'LineWidth',2); hold on;
    xlim([0 70]); ylim([-10 10]); grid on; ylabel('SI [mm]'); 
    if(x==1)
    title('MVR')  
    legend('actual','estimated')
    end
     if(x==16)
    xlabel('Time [s]');
    end
    %___________________________________________________________________________
    subplot(6,3,x+1)
    plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
    plot(esttime,yEstR1,'LineWidth',2); hold on;
    xlim([0 70]); ylim([-10 10]); grid on;
    title('Ridge') ;xlabel('Time [s]'); ylabel('SI [mm]');% legend('yTest','yEst')
    %___________________________________________________________________________
    subplot(6,3,x+2)
    plot(testtime,yTest1,':','MarkerSize', 2,'LineWidth',2); hold on;
    plot(esttime,yEstL1,'LineWidth',2); hold on;
    xlim([0 70]); ylim([-10 10]); grid on;
    title('Lasso') ;xlabel('Time [s]'); ylabel('SI [mm]'); %legend('yTest','yEst')
%     whos
end
par=round(par,1)