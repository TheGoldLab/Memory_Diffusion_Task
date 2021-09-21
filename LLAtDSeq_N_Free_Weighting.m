%%AtD Sequential assuming that you don't have arithmatic weighting
function [ negLLAtD, AtDParam ] = LLAtDSeq_N_Free_Weighting(PtsErr, AvgSeq, PtsErrEarly, PtsErrLate, N  )
% This function takes the response errors from the Sequential block at
% set size N and finds the best fit parameters for the AtD model, assuming
% that the mean error is the empirical mean of the individual subject.
% It also does not assume that the early average and the late point are
% averaged arithmatically.  

%This model was ultimately not considered in our paper.

% It returns the likelihood associated with these parameters and the MLE
% parameters, as well as the Hessian based SEM for these parameter
% estimates
%B(1)= Diff of 1 point
%B(2)= encoding noise of 1 pt
%B(3)= encoding noise for average of N points
%B(4)= encoding noise for Early N-1 points
%B(5)= relationship between slope of 1 and slope of N
%B(6)= encoding nose for Late Nth point.
%B(7)= weight given to the avg of the early N-1 points when the Nth point
%is presented and the two are averaged into the grand mean that will
%diffuse til the end of the trial.
options = optimset('Display','off','MaxFunEvals',5000);
lb=[0,0,0,0,-8,0,0];
ub=[20,180,180,180,10,180,1];
[AtDParam, negLLAtD]= fmincon(@(B) (MLEAtD(PtsErr{1,1}(:,end)',0,B(2),B(1)) + ...
                     MLEAtD(PtsErr{2,1}(:,end)',1,B(2),B(1)) + ...
                     MLEAtD(PtsErr{3,1}(:,end)',6,B(2),B(1)) + ...
                     -sum(log((normpdf(AvgSeq{1,1}(:,end)',mean(AvgSeq{1,1}(:,end)'),sqrt( B(3)  +  B(7)^2*(.5*B(1))   +.5*B(1) )))))+...             
                     -sum(log((normpdf(AvgSeq{2,1}(:,end)',mean(AvgSeq{2,1}(:,end)'),sqrt( B(3)   +  B(7)^2*(3*B(1))    + 3*B(1) )))))+...             
                     -sum(log((normpdf(PtsErrEarly{1,1}(:,end)',mean(PtsErrEarly{1,1}(:,end)'),sqrt( B(4) + .5*B(1)*(N-1)^B(5)  +.5*B(1)*(N)^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrEarly{2,1}(:,end)',mean(PtsErrEarly{2,1}(:,end)'),sqrt( B(4) +  3*B(1)*(N-1)^B(5)  +3*B(1)*(N)^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{1,1}(:,end)',mean(PtsErrLate{1,1}(:,end)'),sqrt( B(6)+  .5*B(1)*(N)^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{2,1}(:,end)',mean(PtsErrLate{2,1}(:,end)'),sqrt( B(6)+  3*B(1)*(N)^B(5)  )))))), [3,10,20,20,.6,30,(N-1)/N],[],[],[],[],lb,ub,[],options);


