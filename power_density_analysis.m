clear all; close all; clc;
addpath(genpath('./dependencies')) % adding the dependensies folder to path
%_%_%_%_%_%_%_%_%_%_%_%__Periodogram Plots___%_%_%_%_%_%_%_%_%_%_%_%_%_%_%_%
% Periodogram Plots
[SI,M1,M2] = preProcessAnalyze('sameSizeS/S1se1X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(321);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
xmax = 2;
ylim([0 1])
xlim([0 xmax])

%%
[SI,M1,M2] = preProcessAnalyze('sameSizeS/S1se2X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(322);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
ylim([0 1])
xlim([0 xmax])

%%
[SI,M1,M2] = preProcessAnalyze('sameSizeS/S2se1X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(323);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
ylim([0 1])
xlim([0 xmax])

[SI,M1,M2] = preProcessAnalyze('sameSizeS/S2se2X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(324);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
ylim([0 1])
xlim([0 xmax])
%%
[SI,M1,M2] = preProcessAnalyze('sameSizeS/S3se1X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
%[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(325);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
ylim([0 1])
xlim([0 xmax])

[SI,M1,M2] = preProcessAnalyze('sameSizeS/S3se2X.mat');
[P1,f1] = periodogram(SI,[],[],10,'power');
[P2,f2] = periodogram(M1,[],[],10,'power');
%[P3,f3] = periodogram(M2,[],[],10,'power');
P1 = P1/max(P1); P2 = P2/max(P2); P3 = P3/max(P3);

subplot(326);
plot(f1,P1,'LineWidth',2); hold on;
plot(f2,P2,'-.','LineWidth',2); hold on; 
%plot(f3,P3,':','LineWidth',2); 
grid
title('Power Spectrum')
ylabel('Power')
xlabel('Frequency (Hz)')
ylim([0 1])
xlim([0 xmax])















