function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;
Cv = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmav = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


for i = 1:length(Cv)
    for j = 1:length(sigmav)
        model= svmTrain(X, y, Cv(i), @(x1, x2) gaussianKernel(x1, x2, sigmav(j)));
        predictions = svmPredict(model, Xval);
        error(i, j) = mean(double(predictions ~=yval));
    end
end

min = error(1, 1);
mini = 1;
minj = 1;
for i = 1:size(error, 1)
    for j = 1:size(error, 2)
        if error(i, j) < min
            min = error(i, j);
            mini = i;
            minj = j;
        end
    end
end

C = Cv(mini);
sigma = sigmav(minj);

% =========================================================================

end