function y = sigmoid_differential(beta, x)
    y = sigmoid(beta, x).*(1-sigmoid(beta, x));
end