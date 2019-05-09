function [meanT, SDT] = preProcessAnalyzeMotionData(subject)
%clear all; close all; clc;
load(subject)
% Assign markers
M11 = M1(:,1); M11=M11-mean(M11);
M12 = M1(:,2); M12=M12-mean(M12);
M21 = M2(:,1); M21=M21-mean(M21);
M22 = M2(:,2); M22=M22-mean(M22);
SI=interp(si,10);  SI=SI-mean(SI);

d = designfilt('lowpassiir','FilterOrder',15,'PassbandFrequency',0.5,'PassbandRipple',15,'SampleRate',10);
d3 = designfilt('lowpassiir','FilterOrder',2,'PassbandFrequency',0.6,'PassbandRipple',1,'SampleRate',10);
d2 = designfilt('lowpassiir','FilterOrder',20,'PassbandFrequency',0.5,'PassbandRipple',5,'SampleRate',10);
SIf=filter(d3,SI); SIf =-SIf;
M12f=filter(d2,M12); M11f=filter(d2,M11);
M21f=filter(d2,M21); M22f=filter(d2,M22);

SIf = SIf*1.5;
M11f = M11f*0.2; M12f = M12f*0.2; 
M21f = M21f*0.2; M22f = M22f*0.2;

%[range(SIf) range(M11f) range(M12f) range(M21f) range(M22f)]

[pks1S,locs1S] = findpeaks(SIf,10,'MinPeakDistance',1);
[pks2S,locs2S] = findpeaks(-SIf,10,'MinPeakDistance',1);
[pks1M11,locs1M11] = findpeaks(M11f,10,'MinPeakDistance',1);
[pks2M11,locs2M11] = findpeaks(-M11f,10,'MinPeakDistance',1);
[pks1M12,locs1M12] = findpeaks(M12f,10,'MinPeakDistance',1);
[pks2M12,locs2M12] = findpeaks(-M12f,10,'MinPeakDistance',1);
[pks1M21,locs1M21] = findpeaks(M21f,10,'MinPeakDistance',1);
[pks2M21,locs2M21] = findpeaks(-M21f,10,'MinPeakDistance',1);
[pks1M22,locs1M22] = findpeaks(M22f,10,'MinPeakDistance',1);
[pks2M22,locs2M22] = findpeaks(-M22f,10,'MinPeakDistance',1);


meanS = mean(abs(pks1S))+mean(abs(pks2S));
meanM11 = mean(abs(pks1M11))+mean(abs(pks2M11));
meanM12 = mean(abs(pks1M12))+mean(abs(pks2M12));
meanM21 = mean(abs(pks1M21))+mean(abs(pks2M21));
meanM22 = mean(abs(pks1M22))+mean(abs(pks2M22));
meanT = [meanS;meanM11;meanM12;meanM21;meanM22];

SDS   = sqrt(0.5*(var(abs(pks1S))+var(abs(pks2S))));
SDM11 = sqrt(0.5*(var(abs(pks1M11))+var(abs(pks2M11))));
SDM12 = sqrt(0.5*(var(abs(pks1M12))+var(abs(pks2M12))));
SDM21 = sqrt(0.5*(var(abs(pks1M21))+var(abs(pks2M21))));
SDM22 = sqrt(0.5*(var(abs(pks1M22))+var(abs(pks2M22))));
SDT = [SDS;SDM11;SDM12;SDM21;SDM22];


end