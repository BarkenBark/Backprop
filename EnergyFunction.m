function energy = EnergyFunction(targetOutput, output)
%Returns the energy of the current output

  energy = 1/2 * sum((targetOutput - output).^2);

end

