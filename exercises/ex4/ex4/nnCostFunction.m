function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf("Size of Theta1 = %7.2f%7.2f\n", size(Theta1));
fprintf("Size of Theta2 = %7.2f%7.2f\n", size(Theta2));

% Setup some useful variables
m = size(X, 1);
K = num_labels;
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1)); % 25 by 401 
Theta2_grad = zeros(size(Theta2)); % 10 by 26 

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.

%

% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%

%keyboard()

L = 3; %total number of layers

% Add (bias unit)ones to the X data matrix
X = [ones(m, 1) X];
a1 = X; 

z2 = a1 * transpose(Theta1);
a2 = sigmoid(z2); % size(a2) = 5000 by 25;


%Add bias unit to a2
a2 = [ones(m, 1) a2]; %size(a2) = 5000 by 26;

z3 = a2 * transpose(Theta2);
a3 = sigmoid(z3); %size(a3) = 5000 by 10 i.e. m by k

h = a3;
fprintf("size of output h = %7.2f%7.2f\n", size(h));

%keyboard()

% Mapping y for neural training
Y = zeros(m, K);
for i=1:m
	yi = Y(i, :);
	yi(y(i)) = 1;
	Y(i, :) = yi;
end

fprintf("size of vectorized Y = %7.2f%7.2f\n", size(Y));

%J = ((-y'*log(h)) - ((1-y)'*log(1-h))) / m;

for i=1:m

	Yi = Y(i, :);
	Hi = h(i, :);
	
	for k=1:K
		Yik =  Yi(k);
		Hik = Hi(k);
		Jik = (-Yik .* log(Hik)) - ((1-Yik).*log(1-Hik));

		J = J + Jik;
	end
end

J = J ./ m;

fprintf('J, Cost without regularization (vectorized): %f\n', J);

%keyboard()

%% =============== Part 1b: Implement Regularization ===============

%Omit the first column (bias units) of both thetas
t1_xbias = Theta1(:, 2:end);
t2_xbias = Theta2(:, 2:end);

%All the following are equivalent ways:
%sum(sum(t1_xbias.^2, 1), 2);
%sum(sum(t1_xbias.^2));
%sum(t2_xbias(:).^2);

reg_cost = (lambda/(2*m)) * (sum(sum(t1_xbias.^2)) + sum(t2_xbias(:).^2));
fprintf('reg_cost, cost added by regularization: %f\n', reg_cost);

J = J + reg_cost;
fprintf('J, Cost with regularization (vectorized): %f\n', J);


% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

delta3 = a3 - Y;
delta2 = (delta3*t2_xbias) .* sigmoidGradient(z2);

% Commenting out iterative approach, as vectorized approach is 
% much simpler.

%d3 = zeros(m, num_labels);
% for t=1:m
% Y_t = Y(t, :);
% a3_t = a3(t, :);
% delta2_t = delta2(t, :);
% delta3_t = delta3(t, :);
% %keyboard()
% % d3_t = a3_t - Y_t;
% % d3(t, :) = d3_t;
% end


Theta2_grad = (delta3'*a2)/m; 
Theta1_grad = (delta2'*a1)/m; 

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Note: Do not regularize the first column of Theta1,2 which is the bias term.

theta2_grad_reg_cost = (lambda/m).* [zeros(num_labels,1), t2_xbias];
theta1_grad_reg_cost = (lambda/m).* [zeros(hidden_layer_size,1), t1_xbias];

Theta2_grad = Theta2_grad + theta2_grad_reg_cost;
Theta1_grad = Theta1_grad + theta1_grad_reg_cost;

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
