function val = gDerivative(x, beta)

  val = beta./(cosh(beta*x).^2);

end

