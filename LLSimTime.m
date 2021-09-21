%%Unsued Time based model
function [ negLLAtD, AtDParam ] = LLSimTime(PtsErr, Block3, N  )
% This variant for Simultaneous data assumes that the subject starts
% with DtA and at some time DURING the trial averages the N points and
% processes to diffuse the resultant average in a AtD like fashion.

%This model was not actually used in the paper and was used when
%considering alternatives. 

%B(1)= Diff of 1 point
%B(2)= encoding noise of single point
%B(3)= encoding noise for N points
%B(4)= encoding noise for Average of N points
%B(5)= relationship between diffusion of single point and N points (A)
%B(6)= time of switch from DtA to AtD.  


options=optimset('Display','off');
starting=[rand*5,5+rand*20,5+rand*20,5+rand*20,rand,rand*6];
[AtDParam, negLLAtD]= fmincon(@(B) (MLEAtDFreeMean(PtsErr{1,1}(1,:),0,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{2,1}(1,:),1,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{3,1}(1,:),6,B(2),B(1)) + ...
                     MLEAtDFreeMean(PtsErr{1,2}(1,:),0,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{2,2}(1,:),1,B(3),B(1)*N^B(5)) + ...
                     MLEAtDFreeMean(PtsErr{3,2}(1,:),6,B(3),B(1)*N^B(5)) + ...
                    -sum(log((normpdf(Block3{1,1}(:,end)',mean(Block3{1,1}(:,end)'),sqrt( B(4)  +  max([0-B(6),0])*B(1)*N^(B(5)-1)   +max([0-B(6),0]*B(1) ))))))+...             
                      -sum(log((normpdf(Block3{2,1}(:,end)',mean(Block3{2,1}(:,end)'),sqrt( B(4)  +  min([B(6),1])*B(1)*N^(B(5)-1)   +max([1-B(6),0]*B(1) ))))))+...                     
                     -sum(log((normpdf(Block3{3,1}(:,end)',mean(Block3{3,1}(:,end)'),sqrt( B(4)   +  min([B(6),6])*B(1)*N^(B(5)-1)   +max([6-B(6),0]*B(1) ))))))),starting,[],[],[],[],[-5,0,0,0,-3,0],[30,100,100,100,3,6],[],options);       
          





