function [yEstTest,yEstTrain,yTest,yTrain] = RMEregress(subject,type,regAlg,lambda,alpha)
% Pre process the data, remove mean, smooth, calibrate
[SIrecon,M1XF,M1YF,M2XF,M2YF] = preProcess(subject);

% Extract features according to the type (8 types available)
[X,y] = extractFeatureResampled(SIrecon,M1XF,M1YF,M2XF,M2YF,type);

% Feature normalization
[Xnorm,~,~] = featureNormalize(X);
Xnorm = [ones(size(Xnorm,1),1) Xnorm];

% Multiple Split Validation
n=size(y,1)/(3/2);
XTrain = Xnorm(1:n,:);
XTest = Xnorm(n+1:end-10,:);
yTrain = y(1:n);
yTest = y(n+1:end-10);

% Compute Regression Coefficients for Beta
if strcmp(regAlg,'mvr')
    beta = mvregress(XTrain,yTrain);
    yEstTest = XTest*beta;
    yEstTrain = XTrain*beta;
    
elseif strcmp(regAlg,'ridge')
    %beta = ridge(yTrain,XTrain,lambda);
    Mdl = fitrlinear(XTrain,yTrain,'Learner','leastsquares','Lambda',lambda,'Regularization','ridge');
    yEstTest = predict(Mdl,XTest);
    yEstTrain = predict(Mdl,XTrain);
    
elseif strcmp(regAlg,'lasso')
    beta = lasso(XTrain,yTrain,'Alpha',alpha,'Lambda',lambda);
    %Mdl = fitrlinear(XTrain,yTrain,'Learner','leastsquares','Lambda',lambda,'Regularization','lasso');
    %yEst = predict(Mdl,XTest);
    yEstTest = XTest*beta;
    yEstTrain = XTrain*beta;
end

end
