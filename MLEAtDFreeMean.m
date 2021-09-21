
                  
                  
function [ pdfy ] = MLEAtDFreeMean( responses,  time, intercept, slope  )
% Produces the probability density of responses assuming a mean error of
% the empirial mean of the data with a diffusion noise of "slope" and an encoding noise of "intercept".

pdfy=-sum(log((normpdf(responses,mean(responses),sqrt((time*slope)+intercept)))));

end





