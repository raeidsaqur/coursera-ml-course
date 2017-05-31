function loadData()
%Custom function written by Raeid to ease
%loading X, y and m variables with ex1 data.

fprintf('Loading Data ...\n');
data = load('ex1data1.txt');

X = data(:, 1); %population
y = data(:, 2); %profit
m = length(y); 	%number of training examples





end