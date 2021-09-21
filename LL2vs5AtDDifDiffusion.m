%%AtD Loose Version
function [ negLLAtD, AtDParam ] = LL2vs5AtDDifDiffusion(PtsErr, Block3, N  )
% This fuction feeds in the response errors for the Simultaneous conditions
% at set size N and finds the best fitting parameters for the AtD Loose model, not used in the present paper.
% Unlike the formal AtD model, this "Loose" models assumes that the mean
% diffuses as a single point, but that that point has a different diffusion
% than a single point.  It was suggested as an alternative model but was
% only the best fit for a single poorly fit subject and thus was not
% mentioned in the paper.
% It returns the negative log likelihood associated with these parameters
% and the parameters. 
%B(1)= Diffusion of 1 point
%B(2)= encoding noise of 1 pt
%B(3)= encoding noise for N points
%B(4)= encoding of average of N points
%B(5)=  relationship between slope of 1 and slope of N
%B(6)= independent diffusion of average of N points
options=optimset('Display','off');
[AtDParam, negLLAtD]= fminsearch(@(B) (MLEAtDFreeMean(PtsErr{1,1}(1,:),0,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{2,1}(1,:),1,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{3,1}(1,:),6,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{1,2}(1,:),0,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{2,2}(1,:),1,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{3,2}(1,:),6,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(Block3{1,1}(:,end)',0,B(4),B(6)) + ...
                     MLEAtDFreeMean(Block3{2,1}(:,end)',1,B(4),B(6)) + ...
                     MLEAtDFreeMean(Block3{3,1}(:,end)',6,B(4),B(6))), [3,10,10,10,.25,3],options);
                 


                 


