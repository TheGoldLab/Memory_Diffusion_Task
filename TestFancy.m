%% Simulate data, fit data to both models, run LL through the GBM see if recoers

clear IndVals
clear AtDVals
clear DtAVals
SetSize=[1,2,5];
 AtDCorrectIdentTESTFANCY=zeros(17,2);
 DtACorrectIdentTESTFANCY=zeros(17,2);

delays=[0,1,6];
nReps=50;

for N=3
    for trials=1:100
    for sub=1:17%[1,13,14,17] %these people only have 50 trials 
        
        if ismember(sub,[1,13,14,17])
            nReps=50;% 50;
        else
            nReps=100; %100
        end
        
             
                     PtsErr=totalResp{sub,2}(:,:,1);
        
        for i=1:3
            for j=1:3
                
                AtD{i,j}=totalResp{sub,3}{i,j,2}';
            end
        end

        
        if theSelectedPpl(2,sub)==1
          
                params1=AtD5Param(sub,:);
               
            
                     [ PtsErrSIMAtD, AvgSIMAtD ] = GenIndAvgAtD(params1,SetSize(N),nReps,PtsErr(:,[1,N]),AtD(:,N));
              %AtD refit
                    [ATDLLS5(sub,trials),~]=LL2vs5AtDMF(PtsErrSIMAtD,AvgSIMAtD(:,2,2),SetSize(N));
                    [DTALLS5(sub,trials),~]=LL2vs5DtAMF(PtsErrSIMAtD,AvgSIMAtD(:,2,2),SetSize(N));
                

           
            if ATDLLS5(sub,trials)<DTALLS5(sub,trials)
                        TESTFANCY5(sub,trials)=1;
                    end
            
        else 
             params2=DtA5Param(sub,:);
            [ PtsErrSIMDtA, AvgSIMDtA ] = GenIndAvgDtA(params2,SetSize(N),nReps,PtsErr(:,[1,N]),AtD(:,N));
            
            
             
                    
                    
                    
                    
                    %DtA refit
                    [ATDLLS5(sub,trials),~]=LL2vs5AtDMF(PtsErrSIMDtA,AvgSIMDtA(:,2,2),SetSize(N));
                    [DTALLS5(sub,trials),~]=LL2vs5DtAMF(PtsErrSIMDtA,AvgSIMDtA(:,2,2),SetSize(N));
                    
                    if DTALLS5(sub,trials)<ATDLLS5(sub,trials)
                        TESTFANCY5(sub,trials)=1;
                    end
           
        end
%      disp(sub);   
    end
    disp(trials);
    end
end

%%
options.verbose = false;
options.DisplayWin = false;
for i=1:100
[PosteriorVBA,outVBA] = VBA_groupBMC(-1*[ATDLLS(:,i)';DTALLS(:,i)'],options);

EpsAtD2(i)=outVBA.ep(1);
EpsDtA2(i)=outVBA.ep(2);
PercentAtD(i)=outVBA.Ef(1);
disp(i);
end
%%
figure(10)
subplot(1,3,2)
histogram(PercentAtD,[0:.1:1]);
hold on
histogram(PercentAtD(EpsAtD2>.95),[0:.1:1]);
plot([8/17,8/17],[0,40],'--k');
ylabel('Percent Simulations');
xlabel('Proportion AtD');
title({'Set Size 2: Simultaneous';'True 8 AtD: 9 DtA'})
% legend({'VBA Output', 'Ground Truth Proportion', 'AtD significantly more frequent'},'Location','Southeast');
set(gca,'Fontsize',14);
subplot(1,3,3)
histogram(PercentAtD2,[0:.1:1]);
hold on
histogram(PercentAtD2(EpsAtD>.95),[0:.1:1]);
plot([14/17,14/17],[0,70],'--k');
title({'Set Size 5: Simultaneous';'True 14 AtD: 3 DtA'})
ylabel('Percent Simulations');
xlabel('Proportion AtD');
 legend({'VBA Proportion AtD', 'AtD significantly more frequent','Ground Truth Proportion', },'Location','Northwest');
set(gca,'Fontsize',14);
%% Sequential

SetSize=[1,2,5];
CorrectIdentSeq=zeros(17,100);
delays=[0,1,6];
nReps=100;
checkrangeseq=0;

    
for N=3      
   for trials=1:100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    for sub=1:17
        
      if ismember(sub,[1,6,13,14,17])
            nReps=50;
        else
            nReps=100;
      end
        
               if N==2
                params1=AtDParam2Seq(sub,:);
                params2=DtAParam2Seq(sub,:);
            else
                params1=AtDParam5Seq(sub,:);
                params2=DtAParam5Seq(sub,:);
            end
      
     
     
            
            
            
            
             for D=1:3
            for nump=1:3
                PtsErr{D,nump}=totalResp{sub,2}{D,nump,1}';
                if D>1 && nump>1
                    AvgSeqPts{D,nump}=totalResp{sub,6}{D,nump,2}';
                    PtsErrEarlySeq{D,nump}=totalResp{sub,5}{D,nump,1}';
                    PtsErrLateSeq{D,nump}=totalResp{sub,8}{D,nump,1}';
                end
            end
        end
%         
            if theSelectedPpl_seq(N-1,sub)==1
                                [ PtsErrSIMAtD, AvgSIMAtD, PtsErrSeqESimAtD, PtsErrSeqLSimAtD] = GenIndAvgAtDSeq(params1,SetSize(N), nReps, PtsErr(:,1), PtsErrEarlySeq(2:3,N),PtsErrLateSeq(2:3,N), AvgSeqPts(2:3,N) );
                [AtDSeq(sub,trials),~]=LLAtDSeq_N_Freer(PtsErrSIMAtD,AvgSIMAtD(:,2,2),PtsErrSeqESimAtD(:,1),PtsErrSeqLSimAtD(:,1),SetSize(N));
                [DtASeq(sub,trials),~]=LLDtASeq_N_Free(PtsErrSIMAtD,AvgSIMAtD(:,2,2),PtsErrSeqESimAtD(:,1),PtsErrSeqLSimAtD(:,1),SetSize(N));
                
                if AtDSeq(sub,trials)<DtASeq(sub,trials)
                    CorrectIdentSeq(sub,trials)=1;
                end
                                
            else
                                [ PtsErrSIMDtA, AvgSIMDtA, PtsErrSeqESimDtA, PtsErrSeqLSimDtA ] = GenIndAvgDtASeq(params2,SetSize(N), nReps,  PtsErr(:,1), PtsErrEarlySeq(2:3,N),PtsErrLateSeq(2:3,N), AvgSeqPts(2:3,N));
          
                %DtA refit
                [AtDSeq(sub,trials),~]=LLAtDSeq_N_Freer(PtsErrSIMDtA,AvgSIMDtA(:,2,2),PtsErrSeqESimDtA(:,1),PtsErrSeqLSimDtA(:,1), SetSize(N));
                [DtASeq(sub,trials),~]=LLDtASeq_N_Free(PtsErrSIMDtA,AvgSIMDtA(:,2,2),PtsErrSeqESimDtA(:,1),PtsErrSeqLSimDtA(:,1), SetSize(N));
                
                if DtASeq(sub,trials)<AtDSeq(sub,trials)
                    CorrectIdentSeq(sub,trials)=1;
                end
            end
        end
        disp(trials)
    end
end
            
   %%
options.verbose = false;
options.DisplayWin = false;
for i=1:100
[PosteriorVBASeq,outVBASeq] = VBA_groupBMC(-1*[AtDSeq(:,i)';DtASeq(:,i)'],options);

EpsAtDSeq(i)=outVBASeq.ep(1);
EpsDtASeq(i)=outVBASeq.ep(2);
PercentAtDSeq(i)=outVBASeq.Ef(1);
disp(i);
end
%%
figure(10)
subplot(1,3,1)
histogram(PercentAtDSeq,[0:.1:1]);
hold on
histogram(PercentAtDSeq(EpsAtDSeq>.95),[0:.1:1]);
plot([9/17,9/17],[0,40],'--k');
ylabel('Percent Simulations');
xlabel('Proportion AtD');
title({'Set Size 2: Sequential';'True 9 AtD: 8 DtA'})
% legend({'VBA Output', 'Ground Truth Proportion', 'AtD significantly more frequent'},'Location','Southeast');
set(gca,'Fontsize',14);
%%
            
             set(gcf,'Units','Inches');
    set(gcf,'Position',[5.5833    7.6806   19.2639    5.8333])

pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

% saveas(gcf,['FigRebuttle.pdf'])
            
                