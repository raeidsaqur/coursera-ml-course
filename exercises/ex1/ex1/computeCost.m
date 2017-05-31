function J = computeCost(X, y, theta)

%fprintf("X = \n"), disp(X);
%disp("y = "), disp(y);
%disp("theta = "), disp(theta);

%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


%Assuming that X has been prepended with '1' column vector 
%to account for theta(0)

	J = sum((X*theta - y).^2)/(2*m)

return;

% =========================================================================

endfunction
