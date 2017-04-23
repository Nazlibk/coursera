function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

h = X * theta;
z = h - y;
t = 0;
for j = 2:1:size(theta)
    t = t + theta(j)^2;
end
J = (sum(z.^2) + (lambda * t))/ (2 * m);

for j = 1:1:size(theta)
    for i = 1:1:m
         grad(j) = grad(j) + z(i) * X(i, j);
    end
    if j~= 1
        grad(j) = grad(j) + lambda * theta(j);
    end
end

grad = grad/m;





% =========================================================================

grad = grad(:);

end
