function network = InitializeNetwork(networkDimensions, weightInterval, thresholdInterval)

%Returns the weights and thresholds corresponding to the feedforward
%network defined by networkDimensions. 
%The weight matrices corresponding to mapping of layer i to layer i+1 are
%accessed by calling network{1,i}.
%The threshold weights to subtract layer i+1 with are accessed by calling
%network{2,i}.

  nbrOfLayers = length(networkDimensions);
  network = cell(2, nbrOfLayers-1);
  
  nbrOfMatrices = size(network, 2);
  
  %Initialize weight matrices and threshold vectors
  for i = 1:nbrOfMatrices
    dim = [networkDimensions(i), networkDimensions(i+1)];
    network{1,i} = zeros(dim(2), dim(1));
    network{2,i} = zeros(dim(2),1);
  end

  %Assign random values to weight matrices and threshold vectors
  for i = 1:nbrOfMatrices
    weights = network{1,i};
    thresholds = network{2,i};
    
    a = weightInterval(1); b = weightInterval(2);
    network{1,i} = a + (b-a).*rand(size(weights));
    
    a = thresholdInterval(1); b = thresholdInterval(2);
    network{2,i} = a + (b-a).*rand(length(thresholds),1);
  end
  
end

