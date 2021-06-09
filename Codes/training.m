input = [0 0 1;0 1 1;1 0 1;1 1 1];
actualoutput = [0 0 1 1];
Weight = 2*rand(1,3) - 1;                           % 3 random values for 3 inputs 0 0 1
for epoch = 1:10000
    Weight = SGD_method(Weight,input,actualoutput);
end
save('Trained_nn.mat')