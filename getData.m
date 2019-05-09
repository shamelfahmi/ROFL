clear all; clc; close all
addpath(genpath('./dependencies')) % adding the dependensies folder to path
subject = 'sameSizeS/S1se1X.mat'; % choose the subjects and session here
[liver_si,marker1_y,~,~,marker2_y] = preProcess(subject); % get the liver and marker preprocessed data