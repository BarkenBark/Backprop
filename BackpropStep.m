function newNetwork = BackpropStep(network, dataPoint, beta, eta)
%Only accepts one data point

  newNetwork = cell(size(network));

  input = dataPoint(1:2);
  targetOutput = dataPoint(3);

  nbrOfMatrices = size(network,2);
  M = nbrOfMatrices + 1;

  delta = cell(1, nbrOfMatrices + 1);
  b = cell(1, nbrOfMatrices + 1); %Note: b{1} never used
  output = cell(1, nbrOfMatrices + 1);
  
  %Forward propagate
  output{1} = input;
  for m=1:nbrOfMatrices
    thresholds = network{2,m};
    weights =  network{1,m};
    b{m+1} = weights*output{m}-thresholds;
    output{m+1} = g(b{m+1}, beta);
  end
  
  %Backpropagate
  %Note: Don't transpose weight matrices since mapping backwards
  delta{M} = -gDerivative(b{M}, beta).*(targetOutput-output{M});
  for m = flip(1:M-1)
    weights = network{1,m};
    thresholds = network{2,m};
    
    deltaWeights = -eta*delta{m+1}*output{m}';
    deltaThresholds = eta*delta{m+1}; %(- times - equals +)
    updatedWeights = weights + deltaWeights;
    updatedThresholds = thresholds + deltaThresholds;
    
    newNetwork{1,m} = updatedWeights;
    newNetwork{2,m} = updatedThresholds;
    
    if m>=2
      delta{m} = gDerivative(b{m}, beta).*(weights'*delta{m+1});
    end
  end
  
end

