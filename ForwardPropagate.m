function output = ForwardPropagate(network, input,beta)

nbrOfMatrixes = length(network);
output = input;

  for i=1:nbrOfMatrixes
    thresholds = network{2,i};
    weights =  network{1,i};
    b = weights'*output-thresholds;
    output = tanh(b*beta);
  end

end

