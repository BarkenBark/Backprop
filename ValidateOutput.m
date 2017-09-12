function accuracy = ValidateOutput( output, targetOutput )
% Calculates the accuracy of network  output

  accuracyVector = [output'.*targetOutput]==1; %gives vector of agreeing elements
  accuracy = sum( accuracyVector )/length(output); %fraction of agreeing elements

end

