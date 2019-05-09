clear all; close all; clc;
addpath(genpath('./dependencies')) % adding the dependensies folder to path
%_%_%_%_%_%_%_%_%_%_%_%__Correlation Plots___%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%

[SI,M1,M2] = preProcessAnalyze('sameSizeS/S1se1X.mat');
[C1,lag1] = xcorr(M1,SI);
[C2,lag2] = xcorr(M2,SI);        
[C3,lag3] = xcorr(M1);
[C4,lag4] = xcorr(M2); 
[C5,lag5] = xcorr(SI);

C1 = C1./max(abs(C1(:))); C2 = C2./max(abs(C2(:)));
C3 = C3./max(abs(C3(:))); C4 = C4./max(abs(C4(:)));
C5 = C5./max(abs(C5(:)));

figure
subplot(3,2,[1 3 5]); 
plot(lag1/10,C1,'LineWidth',2); hold on
plot(lag2/10,C2,'--','LineWidth',2);
ylabel('Amplitude')
grid on
title('Cross-correlation: M1 & SI and M2 & SI')
xlabel('Lag(secs)') 
xlim([-200 200])
legend('M1 and SI','M2 and SI')


subplot(3,2,2); 
plot(lag5/10,C5,'LineWidth',2);hold on;
ylabel('Amplitude') 
grid on
title('Auto-correlation: SI, M1 and M2')
xlabel('Lag(secs)') 
xlim([-200 200])
legend('SI')

subplot(3,2,4); 
plot(lag3/10,C3,'LineWidth',2); hold on; 
ylabel('Amplitude') 
grid on
title('Auto-correlation: SI, M1 and M2')
xlabel('Lag(secs)') 
xlim([-200 200])
legend('M1')

subplot(3,2,6); 
plot(lag4/10,C4,'LineWidth',2);hold on;
ylabel('Amplitude') 
grid on
title('Auto-correlation: SI, M1 and M2')
xlabel('Lag(secs)') 
xlim([-200 200])
legend('M2')
