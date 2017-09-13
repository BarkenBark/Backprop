%% Main
clear all; clc;

%Read and normalize data
trainData = dlmread('train_data_2017.txt');
validData = dlmread('valid_data_2017.txt');
trainData(:,1:2) = NormalizeData(trainData(:,1:2));
validDataInput(:,1:2) = NormalizeData(validData(:,1:2));

input = validData(:,1:2);
targetOutput = validData(:,3); 

eta = 0.02;
beta = 0.5;

weightInterval = [-.2 .2];
thresholdInterval = [-1 1];

NUMBER_OF_ITERATIONS = 10^3;

%%

networkDimensions = [2 1];
network = InitializeNetwork(networkDimensions, weightInterval, thresholdInterval); %Returns cell of random weight matrices
output = ForwardPropagate(network, input, beta)';
accuracy = ValidateOutput(output, targetOutput)

newNetwork = AsynchronouslyTrainNetwork(network, trainData, beta, eta, ...
  NUMBER_OF_ITERATIONS); %Update weight matrices
output = ForwardPropagate(newNetwork, input, beta)';
accuracy = ValidateOutput(output, targetOutput)


