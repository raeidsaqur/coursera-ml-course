function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

disp("m = "), disp(m);
disp("num_iters = "), disp(num_iters);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    delta1 = (transpose((X*theta - y)) * X(:,1))/m;
    delta2 = (transpose((X*theta - y)) * X(:, 2))/m;
    delta = [delta1; delta2];
    disp('delta = '), disp(delta);

    theta = theta - (alpha * delta);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    fprintf("J_history(%d) = %d\n", iter, J_history(iter));
end

end
