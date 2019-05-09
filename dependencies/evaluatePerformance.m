function [MAE STD AdjR] = evaluatePerformance(yEst,yTest,d)

n = size(yEst,1); % number of samples

E = yEst - yTest; % error

AE = abs(E); % absolute error

MAE = mean(AE); % mean of absolute error

STD = std(AE); % standard deviation of error


RSS = sum(E.^2); % risidual sum of squared error

TSS = sum((yTest-mean(yTest)).^2); % total sum of squares

%AdjR = 1 - (RSS*(n-1))/(TSS*(n-d-1));
AdjR = 1 - (RSS*(n-1))/(TSS*(n-d));
end