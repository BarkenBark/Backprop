function output = ForwardPropagate(network, input, beta)

nbrOfMatrices = length(network);
output = input;

  for m=1:nbrOfMatrices
    thresholds = network{2,m};
    weights =  network{1,m};
    b = weights'*output-thresholds;
    output = tanh(b*beta);
  end

end

