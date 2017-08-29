function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


for k=1:K
    num_points_in_Ck = sum(idx==k)
    if num_points_in_Ck == 0
        continue;
    end
    sum_points_in_Ck = zeros(1, n)
    
    %Get sum of all training samples in that centroid k 
    for i=1:m
        if idx(i)==k
            sum_points_in_Ck = sum_points_in_Ck + X(i, :)
        end
    end
    
    Ck_mean = (1/num_points_in_Ck) * sum_points_in_Ck
    fprintf('\nCk_mean = %f', Ck_mean)
    centroids(k, :) = Ck_mean
    
end


% =============================================================


end

