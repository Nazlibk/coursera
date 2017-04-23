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

n = length(theta);
s = 0;
t = 0;
h = 1./(1+exp(-(X*theta)));
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




% =============================================================

end
