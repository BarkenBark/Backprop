function output = ForwardPropagate(network, input, beta)

nbrOfMatrices = size(network,2);
input = input';
output = input;

  for m=1:nbrOfMatrices
    thresholds = network{2,m};
    weights =  network{1,m};
    b = weights'*output-thresholds;
    output = g(b*beta);
  end

  output = sign(output);
  
end

