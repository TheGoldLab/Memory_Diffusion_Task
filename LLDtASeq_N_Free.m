%%DtA Sequentail version
function [ negLLAtD, AtDParam, SEMS_ ] = LLDtASeq_N_Free(PtsErr, AvgSeq, PtsErrEarly, PtsErrLate, N  )
% This function takes the response errors from the Sequential block at
% set size N and finds the best fit parameters for the DtA model, assuming
% that the mean error is the empirical mean of the individual subject.  It
% returns the likelihood associated with these parameters and the MLE
% parameters, as well as the Hessian based SEM for these parameter
% estimates

%B(1)= Diff of 1 point
%B(2)= encoding noise of 1 pt
%B(3)= encoding noise for the avg of N points 
%B(4)= encoding noise N-1 Early points
%B(5)=  relationship between slope of 1 and slope of N
%B(6)= encoding noise of the Late point
options = optimset('Display','off','MaxFunEvals',5000);

[AtDParam, negLLAtD,~,~,~,~,HESSIAN]= fmincon(@(B) (MLEAtD(PtsErr{1,1}(:,end)',0,B(2),B(1)) + ...
                     MLEAtD(PtsErr{2,1}(:,end)',1,B(2),B(1)) + ...
                     MLEAtD(PtsErr{3,1}(:,end)',6,B(2),B(1)) + ...
                     -sum(log((normpdf(AvgSeq{1,1}(:,end)',mean(AvgSeq{1,1}(:,end)'),sqrt( B(3)+ (.5*B(1)*N^B(5)+(N-1)*(.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5)))/N^2 )))))+...             
                     -sum(log((normpdf(AvgSeq{2,1}(:,end)',mean(AvgSeq{2,1}(:,end)'),sqrt( B(3)+ ( 3*B(1)*N^B(5)+(N-1)*( 3*B(1)*(N-1)^B(5)+ 3*B(1)*N^B(5)))/N^2 )))))+...             
                     -sum(log((normpdf(PtsErrEarly{1,1}(:,end)',mean(PtsErrEarly{1,1}(:,end)'),sqrt( B(4)+.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrEarly{2,1}(:,end)',mean(PtsErrEarly{2,1}(:,end)'),sqrt( B(4)+3*B(1)*(N-1)^B(5)+3*B(1)*N^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{1,1}(:,end)',mean(PtsErrLate{1,1}(:,end)'),sqrt( B(6)+.5*B(1)*N^B(5)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{2,1}(:,end)',mean(PtsErrLate{2,1}(:,end)'),sqrt( B(6)+3*B(1)*N^B(5)  )))))), [3,10,20,80,.25, 30],[],[],[],[],[],[],[], options);
SEMS_=sqrt(diag(-((-HESSIAN)^(-1))));

