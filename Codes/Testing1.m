load('Trained_nn.mat');
input = [0 0 1;0 1 1;1 0 1;1 1 1];
n = 4;
for k = 1:n
    transpose = input(k,:)';
    weightedsum = Weight*transpose;
    output = Sigmoid(weightedsum)
end