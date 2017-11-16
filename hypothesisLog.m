function [hypo] = hypothesisLog(theta,x)
    hypo = (exp(x*theta*-1)+1).^(-1);
end