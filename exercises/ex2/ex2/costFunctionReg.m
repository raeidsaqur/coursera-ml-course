function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


% ------ Calculate Cost Function J ------- %
z = X*theta;
h = sigmoid(z);
%disp(h);

% We wont repeat the same formula, but leverage already 
% solved costFunction.m
%J = ((-y'*log(h)) - ((1-y)'*log(1-h))) / m;

%Multiple ways to grab the J from returned array [J, grad]
%J = costFunction(theta, X, y)(1);  

J = nthargout(1, 2, @costFunction, theta, X, y);
fprintf('J, Cost without regularization: %f\n', J);


%Omit theta 0 from regularization
n = size(theta)(1);
tIdx = theta(2:n);


w = (lambda / (2*m)) * sum(tIdx.^2);
fprintf('w, weight added for regularization: %f\n', w);

J = J + w;
fprintf('J + w, Cost with regularization: %f\n', J);


% ------ Calculate gradient ------- %

grad = (transpose((h-y))*X)/m;
fprintf('grad without regularization =  \n');
disp(grad);

%keyboard

tIdxGrad = (lambda/m) * [0; tIdx];

grad = grad' + tIdxGrad;

fprintf('grad with regularization =  \n');
disp(grad);

% =============================================================

end
