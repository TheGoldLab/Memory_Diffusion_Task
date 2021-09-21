function [ pdfy ] = MLEAtD( responses,  time, intercept, slope  )
% Produces the probability density of responses assuming a mean error of 0
% with a diffusion noise of "slope" and an encoding noise of "intercept".

%Used by LL functions to calculate Log Likelihood..

pdfy=-sum(log((normpdf(responses,0,sqrt((time*slope)+intercept)))));

end