function classificationError = ValidateOutput(targetOutput, output )
%Returns the classification error between targetOutput and output, given
%the definition from task PM
  
  p = length(output);
  if length(targetOutput) ~= p
    error('Number of target patterns must equal number of output patterns');
  end
  
  classificationError = 1/(2*p)*sum(abs(targetOutput-sign(output)));
  
end

