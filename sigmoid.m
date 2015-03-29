function value = sigmoid(beta, x)
    value = 1/(1+exp(-beta*x));
end