function [SIrecon,M1XF,M1YF,M2XF,M2YF] = preProcess(subject)
load(subject);

% Assign markers
M12 = M1(:,2);
M12=M12-mean(M12);
SI=interp(si,10);  SI=SI-mean(SI);
M21 = M2(:,2);
M21=M21-mean(M21);

d = designfilt('lowpassiir','FilterOrder',15,'PassbandFrequency',0.5,'PassbandRipple',15,'SampleRate',10);
d3 = designfilt('lowpassiir','FilterOrder',2,'PassbandFrequency',0.6,'PassbandRipple',1,'SampleRate',10);
d2 = designfilt('lowpassiir','FilterOrder',20,'PassbandFrequency',0.5,'PassbandRipple',5,'SampleRate',10);

M12f=filter(d,M12);
SIf=filter(d3,SI);
M21f=filter(d2,M21);


if strcmp(subject,'sameSizeS/S1se1X.mat')
    M12f = M12f(35:end); M21f = M21f(35:end);  SIf = SIf(35:end); % for S1se1
    minP = 2; 
elseif strcmp(subject,'sameSizeS/S1se2X.mat')
    M12f = M12f(45:end); M21f = M21f(45:end); SIf = SIf(40:end); % for S1se2
    minP = 2; 
elseif strcmp(subject,'sameSizeS/S2se1X.mat')
    M12f = M12f(1:end); M21f = M21f(1:end); SIf = SIf(1:end); % for S2se1
    minP = 2; 
elseif strcmp(subject,'sameSizeS/S2se2X.mat')
    M12f = M12f(60:end); M21f = M21f(40:end); SIf = SIf(25:end); % for S2se2
    minP = 2; 
elseif strcmp(subject,'sameSizeS/S3se1X.mat')
    M12f = M12f(35:end); M21f = M21f(35:end); SIf = SIf(35:end); % for S3se1
    minP = 2; 
elseif strcmp(subject,'sameSizeS/S3se2X.mat')
    M12f = M12f(1:end); M21f = M21f(1:end); SIf = SIf(1:end); % for S3se1
    minP = 2.5; 
end



time = 0:1:size(M12f,1)-1; time = 0.1*time';
[pksM,locsM] = findpeaks(M12f,10,'MinPeakHeight',0,'MinPeakDistance',minP);
[pksM2,locsM2] = findpeaks(M21f,10,'MinPeakHeight',0,'MinPeakDistance',minP);
[pksS,locsS] = findpeaks(-SIf,10,'MinPeakHeight',0,'MinPeakDistance',minP);




temp = cell([size(locsS,1)-1 4]);
temp2 = cell([1 4]);
for i= 1:size(locsM)-1
    timeBegin = locsS(i)*10;
    timeEnd = locsS(i+1)*10; % not -1 to also take following peak
    temp{i,1} =  SIf(timeBegin:timeEnd)';
    
    temp{i,3} = locsS(i):0.1:locsS(i+1);
    temp{i,3} = temp{i,3}-ones(size(temp{i,3}))*locsS(i);
    temp{i,3} = temp{i,3}*(10/max(temp{i,3}));
    temp{i,3} = temp{i,3}+ones(size(temp{i,3}))*(i-1)*10;
    
    timeBegin = locsM(i)*10;
    timeEnd = locsM(i+1)*10; % not -1 to also take following peak
    temp{i,2} =  M12f(timeBegin:timeEnd)';
    temp{i,2} = resample(temp{i,2},size(temp{i,1},2),size(temp{i,2},2));
    
    timeBegin = locsM2(i)*10;
    timeEnd = locsM2(i+1)*10; % not -1 to also take following peak
    temp{i,4} =  M21f(timeBegin:timeEnd)';
    temp{i,4} = resample(temp{i,4},size(temp{i,1},2),size(temp{i,4},2));
    
    temp2{1,1} = [temp2{1,1} temp{i,1}];
    temp2{1,2} = [temp2{1,2} temp{i,2}];
    temp2{1,3} = [temp2{1,3} temp{i,3}];
    temp2{1,4} = [temp2{1,4} temp{i,4}];
end

Snew = temp2{1}; Snew = Snew';
Mnew = temp2{2}; Mnew = Mnew';
Tnew = temp2{3}; Tnew = Tnew';
M2new = temp2{4}; Mnew = Mnew';

SIrecon = -Snew;%*1.5;
M1XF = smooth(Mnew,5);%*0.2;
M1YF=[];
M2YF= smooth(M2new,5);%*0.2;
M2XF=[];


end
