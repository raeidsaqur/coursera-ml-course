
%% Initialization
clear ; close all; clc

p = 8;

% From submit.m
X = [ones(10,1) sin(1:1.5:15)' cos(1:1.5:15)'];
y = sin(1:3:30)';
Xval = [ones(10,1) sin(0:1.5:14)' cos(0:1.5:14)'];
yval = sin(1:10)';

% From ex5

%% =========== Part 6: Feature Mapping for Polynomial Regression =============
%  One solution to this is to use polynomial regression. You should now
%  complete polyFeatures to map each example into its powers

[X_poly] = polyFeatures(X(2,:)', p);




