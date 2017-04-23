function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

n = length(theta);
s = 0;
t = 0;
h = sigmoid(X*theta);
for i=1:1:m
    s = s + ((-y(i)*log(h(i)) - (1 - y(i))*log(1 - h(i))));
end

for i = 2:1:n
    t = t + theta(i)^2;
end
J = s/m + (lambda*t)/(2*m);

p = 0;
for i = 1:1:m
    p = p + (h(i) - y(i))*X(i, 1);
end
grad(1) = p/m;

for j = 2:1:n
    p = 0;
    for i = 1:1:m
        p = p + (h(i) - y(i))*X(i, j);
    end
grad(j) = p/m + (lambda * theta(j))/m;
end

% grad = (1/m)*transpose(X)*(h - y) + (lambda/m).*theta;
% 
% grad(1) = (1/m)*transpose(X)*(h - y);



% =============================================================

grad = grad(:);

end
