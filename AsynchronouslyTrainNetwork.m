function network = AsynchronouslyTrainNetwork(network, trainData, iterations)

  nbrOfDataPoints = size(trainData,1);
  trainData = trainData';
  
  t = tic;
  for i = 1:iterations
    iDataPoint = randi(nbrOfDataPoints);
    dataPoint = trainData(:,iDataPoint);
    network = BackpropStep(network, dataPoint);
    if mod(i,iterations/10)==0
      t = toc(t);
      fprintf('Iteration %d complete after %.2f seconds..\n', i, t);
      t = tic;
    end
  end

end

