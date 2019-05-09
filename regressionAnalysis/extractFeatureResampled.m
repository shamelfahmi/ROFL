function [X,y] = extractFeatureResampled(SIrecon,X11,X12,X21,X22,type)
% THIS FUNCTION TAKES SUBJECT PARAMETERS AS INPUT AND RETURNS THE VARIABLES
% AND TARGETS ACCORDING TO THE TYPE NUMBER.

if   type ==1
    X = X11;
    
elseif  type ==2
    X = X22;
    
    %elseif  type ==3
    %    X = [X22 X11];
    
elseif  type ==3
    X = [X22 X22 X11 X11];
    
elseif  type ==4
    X = [X22.^2 X22 X11.^2 X11];
    
elseif  type ==5
    X = [X22.^2 X22 X11.^2 X11 X11.*X22];
    
elseif  type ==6
    X = [X22.^3 X22.^2 X22 X11.^3 X11.^2 X11];
    
elseif  type ==7
    X = [X22.^4 X22.^3 X22.^2 X22 X11.^4 X11.^3 X11.^2 X11];
    
elseif  type ==8
    X = [X22.^5 X22.^4 X22.^3 X22.^2 X22...
        X11.^5 X11.^4 X11.^3 X11.^2 X11];
    
elseif  type ==9
    X = [X22.^6 X22.^5 X22.^4 X22.^3 X22.^2 X22...
        X11.^6 X11.^5 X11.^4 X11.^3 X11.^2 X11];
end
y=SIrecon;
end