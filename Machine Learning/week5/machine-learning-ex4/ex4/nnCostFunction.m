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

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
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
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


X = [ones(m, 1) X];

z2 = X * transpose(Theta1);
a2 = sigmoid(z2);
a2 = [ones(m, 1) a2];

z3 = a2 * transpose(Theta2);
h = sigmoid(z3);

K = size(Theta2, 1);
Y = zeros(length(y), K);
for i = 1:1:length(y)
    Y(i, y(i)) = 1;
end


s = 0;
for i=1:1:m
    for k=1:1:K
        s = s + ((-Y(i, k)*log(h(i, k)) - (1 - Y(i, k))*log(1 - h(i, k))));
    end
end
t = 0;
p = 0;
for j = 1:1:size(Theta1, 1)
    for k = 2:1:size(Theta1, 2)
        t = t + Theta1(j, k)^2;
    end
end
for j = 1:1:size(Theta2, 1)
    for k = 2:1:size(Theta2, 2)
        p = p + Theta2(j, k)^2;
    end
end
J = s/m + ((lambda * (t + p))/(2 * m));

z2 = [ones(m, 1) z2];
delta3 = h - Y;
delta2 = (delta3 * Theta2) .* sigmoidGradient(z2);
delta2 = delta2(:, 2:end);

Delta1 = zeros(size(Theta1_grad));
Delta2 = zeros(size(Theta2_grad));

a1 = X;
Delta1 = Delta1 + transpose(delta2) * a1;
Delta2 = Delta2 + transpose(delta3) * a2;

for i = 1:1:size(Delta1, 1)
    for j = 1:1:size(Delta1, 2)
        if j == 1
            Theta1_grad(i, j) = Delta1(i, j)/m;
        else
            Theta1_grad(i, j) = (Delta1(i, j)/m) + (lambda*Theta1(i, j)/m);
        end 
    end
end

for i = 1:1:size(Delta2, 1)
    for j = 1:1:size(Delta2, 2)
        if j == 1
            Theta2_grad(i, j) = Delta2(i, j)/m;
        else
            Theta2_grad(i, j) = (Delta2(i, j)/m) + (lambda*Theta2(i, j)/m);
        end 
    end
end

% Theta1_grad = Delta1/m;
% for i=1:1:size(Theta1_grad)
%     Theta1_grad(i, 1) = (Delta1(i, 1)/m) + (lambda*Theta1(i, 2)/m);
% end
% Theta2_grad = Delta2/m;
% for i=1:1:size(Theta2_grad)
%     Theta2_grad(i, 1) = (Delta2(i, 1)/m) + (lambda*Theta2(i, 2)/m);
% end






% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
