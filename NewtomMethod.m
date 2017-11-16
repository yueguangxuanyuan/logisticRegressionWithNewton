function [theta] = NewtomMethod(lambda,x,y)
  [m,n] = size(x);
  %theta = rand(n,1);
  theta = zeros(n,1);
  
  intialJval = jvalLog(theta,x,y,lambda);
  
  constMOnes = ones(1,m);
  constDiagMetric = eye(n);
  constDiagMetric(1,1) = 0;
  
  currentJval = intialJval;
  preJval = currentJval + 1;  % intialize to run algorithm
  while (abs(currentJval - preJval) > 1e-10)
    preJval = currentJval;
    hypo = hypothesisLog(theta,x);
    %calculate deltaJ

    tmp = theta; 
    tmp(1,1) = 0;
    tmp = tmp *(lambda/m);

    deltaJ = (x'*(hypo-y))/m + tmp;

    %calculate H
   
    H = 0;
    for index = 1:m
      xi = x(index,:);
      H += hypo(index)*(1-hypo(index))*(xi')*xi;
    end
    H = H/m + (lambda/m)*constDiagMetric;
    %H = ((1/m).*x' * diag(hypo) * diag(1-hypo) * x) + (lambda/m)*constDiagMetric;
    
    %recalculate theta  then update Jvalue
    theta = theta - pinv(H)*deltaJ;
    
    currentJval = jvalLog(theta,x,y,lambda);
  end
end