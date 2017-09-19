function val = gDerivative(x)

  global beta

  val = beta./(cosh(beta*x).^2);

end

