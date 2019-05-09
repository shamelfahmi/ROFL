clear all; close all; clc;

%_%_%_%_%_%_%_%_%_%_%_%__Motion Plots___%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%

[mT11, SD11] = preProcessAnalyzeMotionData( 'sameSizeS/S1se1X.mat');
[mT12, SD12] = preProcessAnalyzeMotionData( 'sameSizeS/S1se2X.mat');

[mT21, SD21] = preProcessAnalyzeMotionData( 'sameSizeS/S2se1X.mat');
[mT22, SD22] = preProcessAnalyzeMotionData( 'sameSizeS/S2se2X.mat');

[mT31, SD31] = preProcessAnalyzeMotionData( 'sameSizeS/S3se1X.mat');
[mT32, SD32] = preProcessAnalyzeMotionData( 'sameSizeS/S3se2X.mat');

mT = [mT11 mT12 mT21 mT22 mT31 mT32];
SDT = [SD11 SD12 SD21 SD22 SD31 SD32];

x = [0.9 1.1 1.9 2.1 2.9 3.1];
subplot(321); 
bar(x,mT(1,:),'g'); hold on;
errorbar(x,mT(1,:),SDT(1,:),'.','MarkerSize',1,'LineWidth',2); hold on;
%grid on
ylabel('Motion')
title('SI')
xlim([0.5 3.5])
ylim([5 25])

subplot(323);
bar(x,mT(2,:),'g'); hold on;
errorbar(x,mT(2,:),SDT(2,:),'x','MarkerSize',5,'LineWidth',2); hold on;
%grid on
ylabel('Motion')
title('M11')
ylim([0 4])
xlim([0.5 3.5])

subplot(324);
bar(x,mT(4,:),'g'); hold on;
errorbar(x,mT(4,:),SDT(4,:),'x','MarkerSize',5,'LineWidth',2); hold on;
%grid on
ylabel('Motion')
title('M21')
ylim([0 4])
xlim([0.5 3.5])

subplot(325);
bar(x,mT(3,:),'g'); hold on;
errorbar(x,mT(3,:),SDT(3,:),'x','MarkerSize',5,'LineWidth',2); hold on;
%grid on
ylabel('Motion')
title('M12')
ylim([0 20])
xlim([0.5 3.5])

subplot(326);
bar(x,mT(5,:),'g'); hold on;
errorbar(x,mT(5,:),SDT(5,:),'x','MarkerSize',5,'LineWidth',2); hold on;
%grid on
ylabel('Motion')
title('M22')
ylim([0 20])
xlim([0.5 3.5])


mT = round(mT',1);
SDT = round(SDT',1);
