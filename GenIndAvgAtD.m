function [ PtsErrSIM, AvgSIM ] = GenIndAvgAtD(AtDParam,N, numSamples, PtsErr, AvgErr )
% This function takes AtD parameters, a set size (N), and a number of
% trials (numSamples) and siumulates data from the AtD model.   It also
% uses subject responses (PtsErr and AvgErr) to ensure that the mean error
% (bias) is identical to subject data).  Used in figures 4 analysis
%
delays=[0,1,6];
PtsErrSIM={};
AvgSIM={}; 


for delay=1:3
    SingMn=mean(PtsErr{delay,1});
    MultMn=mean(PtsErr{delay,2});
    AvgMn=mean(AvgErr{delay,1});
   PtsErrSIM{delay,1,1}=SingMn+(AtDParam(2)+delays(delay)*AtDParam(1))^.5*randn(1,numSamples);
   PtsErrSIM{delay,2,1}=MultMn+(AtDParam(3)+delays(delay)*AtDParam(1)*N^AtDParam(5))^.5*randn(1,numSamples);
   AvgSIM{delay,2,2}=AvgMn+(AtDParam(4)+delays(delay)*AtDParam(1))^.5*randn(numSamples,1);

    
end

end

