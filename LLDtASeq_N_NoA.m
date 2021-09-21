%%DtA unused variant
function [ negLLAtD, AtDParam ] = LLDtASeq_N_NoA(PtsErr, AvgSeq, PtsErrEarly, PtsErrLate, N  )
% This DtA variant does not assume a set relationship between set size and
% diffusion constant, (A in the modeling).  It instead allows the diffusion
% constant for set size N and N-1 to be independent of the diffusion
% constant for a single point.  

%This model was not actually used in the paper and was used when
%considering alternatives. 

%B(1)=Diff of 1 point
%B(2)= encoding noise of the average of N points
%B(3)= encoding noise for Early n-1 points 
%B(4)= encoding noise for late Nth point
%B(5)= encoding of a single point
%B(6)= diffusion for N-1 Early points
%B(7)= diffusion of Nth Late point

options = optimset('Display','off','MaxFunEvals',5000);

[AtDParam, negLLAtD]= fminsearch(@(B) (MLEAtD(PtsErr{1,1}(:,end)',0,B(1),B(5)) + ...
                     MLEAtD(PtsErr{2,1}(:,end)',1,B(1),B(5)) + ...
                     MLEAtD(PtsErr{3,1}(:,end)',6,B(1),B(5)) + ...
                     -sum(log((normpdf(AvgSeq{1,1}(:,end)',mean(AvgSeq{1,1}(:,end)'),sqrt( B(2)+ (.5*B(7)+(N-1)*B(6))/N^2 )))))+...             
                     -sum(log((normpdf(AvgSeq{2,1}(:,end)',mean(AvgSeq{2,1}(:,end)'),sqrt( B(2)+ ( 3*B(7)+(N-1)*6*B(6))/N^2 )))))+...             
                     -sum(log((normpdf(PtsErrEarly{1,1}(:,end)',mean(PtsErrEarly{1,1}(:,end)'),sqrt( B(3)+ B(6) )))))+...             
                     -sum(log((normpdf(PtsErrEarly{2,1}(:,end)',mean(PtsErrEarly{2,1}(:,end)'),sqrt( B(3)+6*B(6)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{1,1}(:,end)',mean(PtsErrLate{1,1}(:,end)'),sqrt( B(4)+.5*B(7)  )))))+...             
                     -sum(log((normpdf(PtsErrLate{2,1}(:,end)',mean(PtsErrLate{2,1}(:,end)'),sqrt( B(4)+3*B(7) )))))), [10,20,20,20,3, 3,3],options);


