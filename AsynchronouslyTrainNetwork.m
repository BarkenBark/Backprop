function network = AsynchronouslyTrainNetwork(network, trainData, beta, eta, iterations)

  nbrOfDataPoints = size(trainData,1);
  trainData = trainData';
  
  for i = 1:iterations
    iDataPoint = randi(nbrOfDataPoints);
    dataPoint = trainData(:,iDataPoint);
    network = BackpropStep(network, dataPoint, beta, eta);
    if mod(i,100)==0
      fprintf('Iteration %d complete.\n', i);
    end
  end

end

