function Weight = SGD_method(Weight,input,actualoutput)
alpha = 0.91;
n = 4;
for k = 1:n
    transposedin = input(k,:)';
    d = actualoutput(k);
    weighted_sum = Weight*transposedin;     %else would have done dotproduct
    output = Sigmoid(weighted_sum);
    error = d - output;
    delta = output*(1-output)*error;
    newWeight = alpha*delta*transposedin;
    Weight(1) = Weight(1) + newWeight(1);
    Weight(2) = Weight(2) + newWeight(2);
    Weight(3) = Weight(3) + newWeight(3);
end
end