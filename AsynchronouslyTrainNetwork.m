function network = AsynchronouslyTrainNetwork(network, trainData, beta, iterations)

  nbrOfDataPoints = size(trainData,1);
  
  for i = 1:iterations
    iDataPoint = randi(nbrOfDataPoints);
    dataPoint = trainData(iDataPoint,:);
    network = Backpropstep(network, dataPoint, beta);
  end

end

