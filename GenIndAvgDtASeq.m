function [ PtsErrSIM, AvgSIM, PtsErrSeqESIM,PtsErrSeqLSIM ] = GenIndAvgDtASeq(AtDParam,N, numSamples, PtsErr, PtsE, PtsL, PtsA  )
% This function takes AtD parameters, a set size (N), and a number of
% trials (numSamples) and siumulates data from the DtA_Sequetial model.   It also
% uses subject responses (PtsErr and AvgErr) to ensure that the mean error
% (bias) is identical to subject data).  Used in figures 8 analysis
delays=[0,1,6];
PtsErrSIM={};
AvgSIM={};
PtsErrSeqESIM={};
PtsErrSeqLSIM={};

for delay=1:3
B=AtDParam;
    PtsErrSIM{delay,1,1}=mean(PtsErr{delay,1})+(AtDParam(2)+delays(delay)*AtDParam(1))^.5*randn(numSamples,1);
    if delay>1
                PtsErrSeqESIM{delay-1,1,1}=mean(PtsE{delay-1,1})+(B(4)+delays(delay)/2*B(1)*(N-1)^B(5)+delays(delay)/2*B(1)*N^B(5))^.5*randn((N-1)*numSamples/N,1);
            PtsErrSeqLSIM{delay-1,1,1}=mean(PtsL{delay-1,1})+(B(6)+delays(delay)/2*B(1)*N^B(5))^.5*randn(numSamples/N,1);
        AvgSIM{delay-1,2,2}=mean(PtsA{delay-1,1})+(B(3)+ (delays(delay)/2*B(1)*N^B(5)+(N-1)*(delays(delay)/2*B(1)*(N-1)^B(5)+delays(delay)/2*B(1)*N^B(5)))/N^2)^.5*randn(numSamples,1);
    end
end

end

