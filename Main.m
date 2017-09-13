%% Main

%Read and normalize data
trainData = dlmread('train_data_2017.txt');
validData = dlmread('valid_data_2017.txt');
trainData = NormalizeData(trainData);
validData = NormalizeData(validData);

input = validData(:,1:2);
targetOutput = validData(:,3); 

ETA = 0.02;
BETA = 0.5;

NUMBER_OF_ITERATIONS = 10^6;

%%

networkDimensions = [2 1];
network = InitializeNetwork(networkDimensions); %Returns cell of random weight matrices
network = AsynchronouslyTrainNetwork(network, trainData, beta, iterations); %Update weight matrices

output = forwardPropagate(network, input);
accuracy = validateOutput(output, targetOutput);

