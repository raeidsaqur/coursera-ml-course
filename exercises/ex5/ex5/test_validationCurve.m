
%% Initialization
clear ; close all; clc



% Load from ex5data1: 
% You will have X, y, Xval, yval, Xtest, ytest in your environment
%load ('ex5data1.mat');


%Load from submit.m:
X = [ones(10,1) sin(1:1.5:15)' cos(1:1.5:15)'];
y = sin(1:3:30)';
Xval = [ones(10,1) sin(0:1.5:14)' cos(0:1.5:14)'];
yval = sin(1:10)';

[X_poly] = polyFeatures(X(2,:)', 8);


% m = Number of examples
m = size(X, 1);
p = 8;

% Map X onto Polynomial Features and Normalize
% X_poly = polyFeatures(X, p);
% [X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
% X_poly = [ones(m, 1), X_poly];                   % Add Ones

% % Map X_poly_test and normalize (using mu and sigma)
% X_poly_test = polyFeatures(Xtest, p);
% X_poly_test = bsxfun(@minus, X_poly_test, mu);
% X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
% X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% % Map X_poly_val and normalize (using mu and sigma)
% X_poly_val = polyFeatures(Xval, p);
% X_poly_val = bsxfun(@minus, X_poly_val, mu);
% X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
% X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];           % Add Ones

% fprintf('Normalized Training Example 1:\n');
% fprintf('  %f  \n', X_poly(1, :));



%% =========== Part 8: Validation for Selecting Lambda =============
%  You will now implement validationCurve to test various values of 
%  lambda on a validation set. You will then use this to select the
%  "best" lambda value.
%

[lambda_vec, error_train, error_val] = ...
        validationCurve(X, y, Xval, yval);


% [lambda_vec, error_train, error_val] = ...
%     validationCurve(X_poly, y, X_poly_val, yval);

close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end
