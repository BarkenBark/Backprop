%% Main
clear all; clc;

%Read and normalize data
trainData = dlmread('train_data_2017.txt');
validData = dlmread('valid_data_2017.txt');
nbrOfTrainingPoints = length(trainData);
allData = [trainData; validData];
allData = [NormalizeData(allData(:,1:2)), allData(:,3)];
trainData = allData(1:nbrOfTrainingPoints,:);
validData = allData((nbrOfTrainingPoints+1):end,:);

input = validData(:,1:2);
targetOutput = validData(:,3); 

eta = 0.02;
beta = 1;

weightInterval = [-.2 .2];
thresholdInterval = [-1 1];

NUMBER_OF_ITERATIONS = 10^5;

%%

networkDimensions = [2 4 1];
network = InitializeNetwork(networkDimensions, weightInterval, thresholdInterval); %Returns cell of random weight matrices
output = ForwardPropagate(network, input, beta)'
%accuracy = ValidateOutput(output, targetOutput)

newNetwork = AsynchronouslyTrainNetwork(network, trainData, beta, eta, ...
  NUMBER_OF_ITERATIONS); %Update weight matrices
output = ForwardPropagate(newNetwork, input, beta)'
%accuracy = ValidateOutput(output, targetOutput)


