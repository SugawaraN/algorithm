function [w1, hidden, w2] = BP(input, hidden_number, superviser, learn_number, weight_max, beta, zeta)
    if size(input,1) ~= size(supervised,1)
        error('inputとsupervisedの配列の行数が違います');
    end

    w1 = randi(weight_max, size(input, 2), hidden_number);
    u = zeros(1, hidden_number);
    hidden = zeros(1, hidden_number);
    w2 = randi(weight_max, hidden_number, size(superviser, 1));
    v = zeros(1, size(superviser, 1));
    output = zeros(1, size(superviser, 1));
    
    % BP
    for learning = 1:learn_number
        % 前向き計算
        u = (input*w1).';
        hidden = sigmoid(beta, u);
        v = (hidden*w2).';
        output = sigmoid(beta, v);
        % BP
        w2 = w2 + zeta*hidden.'*(superviser(learning,:) - output).*sigmoid_differential(beta, v);
        buf = w2;
        for j=1:hidden_number
           buf(j,:) = w2(j,:) .* (superviser(learning,:) - output).*sigmoid_differential(beta, v);
        end
        w1 = w1 + zeta* sum(buf,2) .* sigmoid_differential(beta, u)*input;
    end

end



























