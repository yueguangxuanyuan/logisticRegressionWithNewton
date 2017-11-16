function [jVal] = jvalLog(theta,x,y,lambda)
  m = size(x,1);
  hypo = hypothesisLog(theta,x);
  
 
  logHypo = log(hypo);
  logNegHypo = log(1-hypo);
  
  theta(1,1) = 0;
  jVal= (logHypo'*y + logNegHypo'*(1-y))/(-m) + theta'*theta*lambda/(2*m);
end
    