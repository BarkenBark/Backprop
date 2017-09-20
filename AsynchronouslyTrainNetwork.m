function [network, energy] = AsynchronouslyTrainNetwork(network, trainData, validData, beta, eta, iterations)

  trainTargetOutput = trainData(:,3);
  trainInputData = trainData(:,1:2);
  energyTrain = zeros(iterations, 1);
  
  validTargetOutput = validData(:,3);
  validInputData = validData(:,1:2);
  energyValid = zeros(iterations, 1);
  
  energy = zeros(iterations, 2);
  
  nbrOfDataPoints = size(trainData,1);
  trainData = trainData';
  
  t = tic;
  for i = 1:iterations
    
    iDataPoint = randi(nbrOfDataPoints);
    dataPoint = trainData(:,iDataPoint);
    network = BackpropStep(network, dataPoint, beta, eta);
    
    if mod(i,iterations/10)==0
      t = toc(t);
      fprintf('Iteration %d complete after %.2f seconds..\n', i, t);
      t = tic;
    end
    
    trainOutput = ForwardPropagate(network, trainInputData, beta)';
    energyTrain(i) = EnergyFunction(trainTargetOutput, trainOutput);
    
    validOutput = ForwardPropagate(network, validInputData, beta)';
    energyValid(i) = EnergyFunction(validTargetOutput, validOutput);
    
    energy(i,:) = [energyTrain(i), energyValid(i)];
    
  end

end

