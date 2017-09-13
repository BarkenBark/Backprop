function network = BackpropStep(network, dataPoint, beta, eta)
%Only accepts one data point

  input = dataPoint(1:2);
  targetOutput = dataPoint(3);

  nbrOfMatrices = size(network,2);
  M = nbrOfMatrices + 1;

  delta = cell(1, nbrOfMatrices + 1);
  b = cell(1, nbrOfMatrices + 1);
  
  %Forward propagate
  output = cell(1, nbrOfMatrices + 1);
  output{1} = input;
  for m=1:nbrOfMatrices
    thresholds = network{2,m};
    weights =  network{1,m};
    b{m+1} = weights'*output{m}-thresholds;
    output{m+1} = tanh(b{m+1}*beta);
  end
  
  
  
  %Note: Don't transpose weight matrices since mapping backwards
  delta{M} = gDerivative(b{M}).*(targetOutput-output{M});
  for m = flip(2:M-1)
    weights = network{1,m};
    thresholds = network{2,m};
    delta{m} = gDerivative(b{m}).*(weights*delta{m+1});
    deltaWeights = eta*output{m}*delta{m+1}';
    deltaThresholds = -eta*delta{m+1};
    updatedWeights = weights + deltaWeights;
    updatedThresholds = thresholds + deltaThresholds;
    network{1,m} = updatedWeights;
    network{2,m} = updatedThresholds;
  end
  
  
  
end

