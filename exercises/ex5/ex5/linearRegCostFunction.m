function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


hx = X*theta;
J = 1/(2*m) * (sum((hx-y).^2));
%fprintf('J, Cost without regularization (vectorized): %f\n', J);

% Add Regularization Cost

% Skip theta 0 for regularization
theta_xbias = theta(2:n);
regularization_cost = sum(theta_xbias.^2) * (lambda/(2*m));
%fprintf('regularization_cost = %f\n', regularization_cost);

J = J + regularization_cost;
%fprintf('J, Cost with regularization (vectorized): %f\n', J);



% =========================================================================


% --------- Calculated regularized linear regression gradient ----------- %

grad = grad(:);


%Omit regularizing theta_0, hence replace theta vector with 0 in the 1st pos
reg_weight_grad = (lambda/m) * [0;theta_xbias];

grad = (transpose(hx - y) * X) / m;
disp(grad)
%fprintf('grad without regularization =  %f\n', grad);

%keyboard();

grad = grad' + reg_weight_grad;

end
