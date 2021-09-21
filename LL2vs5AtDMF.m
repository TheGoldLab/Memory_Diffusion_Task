%%AtD true version
function [ negLLAtD, AtDParam,SEMS_ ] = LL2vs5AtDMF(PtsErr, Block3, N  )
% This function takes the response errors from the simultaneous block at
% set size N and finds the best fit parameters for the AtD model, assuming
% that the mean error is the empirical mean of the individual subject.  It
% returns the likelihood associated with these parameters and the MLE
% parameters, as well as the Hessian based SEM for these parameter
% estimates
%B(1)= Diff of 1 point and Average of N points
%B(2)= encoding noise of 1 pt
%B(3)= encoding noise for N points
%B(4)= encoding noise for average of N points
%B(5)= relationship between slope of 1 and slope of N



options=optimset('Display','off');
[AtDParam, negLLAtD,~,~,~,~,HESSIAN]= fmincon(@(B) (MLEAtDFreeMean(PtsErr{1,1}(1,:),0,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{2,1}(1,:),1,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{3,1}(1,:),6,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{1,2}(1,:),0,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{2,2}(1,:),1,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{3,2}(1,:),6,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(Block3{1,1}(:,end)',0,B(4),B(1)) + ...
                     MLEAtDFreeMean(Block3{2,1}(:,end)',1,B(4),B(1)) + ...
                     MLEAtDFreeMean(Block3{3,1}(:,end)',6,B(4),B(1))), [3,10,10,10,.25],[],[],[],[],[],[],[],options);
      SEMS_=sqrt(diag(-((-HESSIAN)^(-1))));
           


                 


