function output = ForwardPropagate(network, input)

nbrOfMatrices = size(network,2);
input = input';
output = input;

  for m=1:nbrOfMatrices
    thresholds = network{2,m};
    weights =  network{1,m};
    b = weights*output-thresholds;
    output = g(b);
  end
  
end

