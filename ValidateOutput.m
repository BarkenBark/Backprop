function classificationError = ValidateOutput( output, targetOutput )
% Calculates the accuracy of network  output

  %accuracyVector = [output'.*targetOutput]==1; %gives vector of agreeing elements
  %accuracy = sum( accuracyVector )/length(output); %fraction of agreeing elements

  %accuracy = length(find(output==targetOutput))/length(output);
  
  p = length(output);
  if length(targetOutput) ~= p
    error('Number of target patterns must equal number of output patterns');
  end
  
  classificationError = 1/(2*p)*sum(abs(targetOutput-sign(output)));
  
end

