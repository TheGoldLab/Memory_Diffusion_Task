%% FIg 2c
figure(502)
hold on
SingSig=3;
A=[-2:.1:2];
N=[1,2,5];
%1=Ind, 2=AtD, 3=DtA
for Ns=1:3
    for As=1:length(A)
        IndVals(As,Ns)=log(SingSig*N(Ns)^A(As))-log(SingSig);
         AtDVals(As,Ns)=log(SingSig)-log(SingSig);
          DtAVals(As,Ns)=log(SingSig*N(Ns)^(A(As)-1))-log(SingSig);
    end
   disp('here1')
end
disp('here')
  plot(A,IndVals(:,1), '-','Linewidth',8,'color',Pallet{1,2});
  hold on
  plot(A,IndVals(:,3),'-','Linewidth',5,'color',Pallet{4,1});
  plot(A,AtDVals(:,3),'-k','Linewidth',2)
  plot(A,DtAVals(:,3),'--k','Linewidth',2)
  yticks(-log(5),0,log(5));
  legend('{\sigma}_{1}^2', '{\sigma}_{N}^2', '{\sigma}_{MN} AtD', '{\sigma}_{MN}^2 DtA' ,'Location','NW')
  ylabel('log(Diffusion Constant) relative to log({\sigma}_{1}^2)')
  xlabel('A')

%   axis([0,2,0,3])
%   set(gca,'ytick', [0,1-log(2),1, 1+log(2)])
  
%     set(gca, 'yticklabel',{'0','log(sigma^2/N)','log(sigma^2)', 'log(N*sigma^2)'})

        set(gca, 'Fontsize',12)
 set(gcf,'Units','Inches');
 
          set (gcf, 'Position',[9.7639    8.9306    4.9861    4.3333]);

 pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['Fig2c.pdf']);

%% Plot Identified % as fx of A for models you did


    load('ConfidenceAndConfusion.mat')
    figure(44)

    subplot(2,1,1)
    hold on
    plot(AtD2Param(theSelectedPpl(1,:)==1,5),AtDCorrectIdent(theSelectedPpl(1,:)==1,1)/1000,'sb','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
    plot(AtD2Param(theSelectedPpl(1,:)==2,5),AtDCorrectIdent(theSelectedPpl(1,:)==2,1)/1000,'db','Linewidth',1, 'Markersize', 8)
    plot(DtA2Param(theSelectedPpl(1,:)==2,5),DtACorrectIdent(theSelectedPpl(1,:)==2,1)/1000,'dr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
    plot(DtA2Param(theSelectedPpl(1,:)==1,5),DtACorrectIdent(theSelectedPpl(1,:)==1,1)/1000,'sr','Linewidth',1, 'Markersize', 8)
    axis([-1.5,2,.5,1])
    title('Set Size 2')
    ylabel('% Simulations correctly identified')
xlabel('Model fit A')
legend({'AtD Best fit, AtD Param', 'DtA Best fit, AtD Param', 'DtA Best fit, DtA param', 'AtD Best Fit, DtA Param'},'Location','EastOutside')
   
    subplot(2,1,2)
    hold on
    plot(AtD2Param(theSelectedPpl(2,:)==1,5),AtDCorrectIdent(theSelectedPpl(2,:)==1,2)/1000,'sb','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
    plot(AtD2Param(theSelectedPpl(2,:)==2,5),AtDCorrectIdent(theSelectedPpl(2,:)==2,2)/1000,'db','Linewidth',1, 'Markersize', 8)
    plot(DtA2Param(theSelectedPpl(2,:)==2,5),DtACorrectIdent(theSelectedPpl(2,:)==2,2)/1000,'dr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
    plot(DtA2Param(theSelectedPpl(2,:)==1,5),DtACorrectIdent(theSelectedPpl(2,:)==1,2)/1000,'sr','Linewidth',1, 'Markersize', 8)
    axis([-1.5,2,.5,1])
    title('Set Size 2')
    ylabel('% Simulations correctly identified')
xlabel('Model fit A')
legend({'AtD Best fit, AtD Param', 'DtA Best fit, AtD Param', 'DtA Best fit, DtA param', 'AtD Best Fit, DtA Param'},'Location','EastOutside')
   


%     AtDSeqPercentsMean(N)=mean(AtDCorrectIdentSeq(AtDCorrectIdentSeq(:,N)~=0,N)/1000)
%     DtASeqPercentsMean(N)=mean(DtACorrectIdentSeq(DtACorrectIdentSeq(:,N)~=0,N)/1000)
saveas(gcf,['Fig1_SNew.pdf'])



%% Sim parameter comparisons
for param=1:5
[~,ParmaP2(param)]=ttest2(AtD2Param(theSelectedPpl(1,:)==1,param),DtA2Param(theSelectedPpl(1,:)==2,param));
[~,ParmaP5(param)]=ttest2(AtD5Param(theSelectedPpl(2,:)==1,param),DtA5Param(theSelectedPpl(2,:)==2,param));
end

%% Testing if estimates of A parameter are similar in Perc and Comp DtA Subs
% A in Perceptual blocks only= fit without Computed Dtata
% A in Computed blocks only= find diffusion constant from Single and
% Computed (Computed=1/N single*N^A) compare


for N=1:2
for sub=17:-1:1
    
 
    PtsErr=totalResp{sub,2}(:,:,1);
        
        for i=1:3
            for j=1:3
                
                AtD{i,j}=totalResp{sub,3}{i,j,2}';
            end
        end
        
             if theSelectedPpl(N,sub)==2     
        if N==1
        [~, DtA2Param2Computed(sub,:),SEMDtA2Param(sub,:)]=LL2vs5DtAMF_ComputedA(PtsErr(:,[1:2]),AtD(:,2),2);
        [~, DtA2Param2Percieved(sub,:),SEMDtA2Param(sub,:)]=LL2vs5DtAMF_PercievedA(PtsErr(:,[1:2]),AtD(:,2),2);
DtA_A_diff(sub,N)=DtA2Param2Computed(sub,5)-DtA2Param2Percieved(sub,5);
        else

        [~, DtA2Param5Computed(sub,:),SEMDtA5Param(sub,:)]=LL2vs5DtAMF_ComputedA(PtsErr(:,[1,3]),AtD(:,3),5);
        [~, DtA2Param5Percieved(sub,:),SEMDtA5Param(sub,:)]=LL2vs5DtAMF_PercievedA(PtsErr(:,[1,3]),AtD(:,3),5);
DtA_A_diff(sub,N)=DtA2Param5Computed(sub,5)-DtA2Param5Percieved(sub,5);
        end
             else 


            
    end
    end
   [~,TestDiffA(N)]=ttest(DtA_A_diff(DtA_A_diff(:,N)~=0,N))
end

%% Plot showing distance from horizontal vs distance from vertical, Sim

figure(43)
subplot(2,1,1)
hold on
title({'Set Size 2'})
plot(abs([IndFit(theSelectedPplAIC(1,:)==1,1)-AvgFit(theSelectedPplAIC(1,:)==1,2)]),abs([IndFit(theSelectedPplAIC(1,:)==1,2)/2-AvgFit(theSelectedPplAIC(1,:)==1,2)]),'sb','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(1,:)==3,1)-AvgFit(theSelectedPplAIC(1,:)==3,2)]),abs([IndFit(theSelectedPplAIC(1,:)==3,2)/2-AvgFit(theSelectedPplAIC(1,:)==3,2)]),'sb','Linewidth',1,'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(1,:)==2,1)-AvgFit(theSelectedPplAIC(1,:)==2,2)]),abs([IndFit(theSelectedPplAIC(1,:)==2,2)/2-AvgFit(theSelectedPplAIC(1,:)==2,2)]),'dr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(1,:)==6,1)-AvgFit(theSelectedPplAIC(1,:)==6,2)]),abs([IndFit(theSelectedPplAIC(1,:)==6,2)/2-AvgFit(theSelectedPplAIC(1,:)==6,2)]),'dr','Linewidth',1, 'Markersize', 8)
xlabel('Distance from AtD Relationship')
ylabel('Distance from DtA Relationship')
plot([0,6],[0,6],'--k')

    set(gca,'fontsize', 12)
%     legend('AtD Well Fit','Simulated 95% CI','Location','NW')
hold on
title({'Set Size 2'})
        legend({'AtD Well Fit',  'DtA Well Fit','DtA Poor Fit',},'Location','EastOutside')
subplot(2,1,2)
title({'Set Size 5'})

  hold  on
plot(abs([IndFit(theSelectedPplAIC(2,:)==1,1)-AvgFit(theSelectedPplAIC(2,:)==1,3)]),abs([IndFit(theSelectedPplAIC(2,:)==1,3)/5-AvgFit(theSelectedPplAIC(2,:)==1,3)]),'sb','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(2,:)==5,1)-AvgFit(theSelectedPplAIC(2,:)==5,3)]),abs([IndFit(theSelectedPplAIC(2,:)==5,3)/5-AvgFit(theSelectedPplAIC(2,:)==5,3)]),'sb','Linewidth',1,'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(2,:)==3,1)-AvgFit(theSelectedPplAIC(2,:)==3,3)]),abs([IndFit(theSelectedPplAIC(2,:)==3,3)/5-AvgFit(theSelectedPplAIC(2,:)==3,3)]),'sb','Linewidth',1,'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(2,:)==2,1)-AvgFit(theSelectedPplAIC(2,:)==2,3)]),abs([IndFit(theSelectedPplAIC(2,:)==2,3)/5-AvgFit(theSelectedPplAIC(2,:)==2,3)]),'dr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
plot(abs([IndFit(theSelectedPplAIC(2,:)==6,1)-AvgFit(theSelectedPplAIC(2,:)==6,3)]),abs([IndFit(theSelectedPplAIC(2,:)==6,3)/5-AvgFit(theSelectedPplAIC(2,:)==6,3)]),'dr','Linewidth',1, 'Markersize', 8)

xlabel('Distance from AtD Relationship')
ylabel('Distance from DtA Relationship')
plot([0,7],[0,7],'--k')
axis([0,7,0,7])
    set(gca,'fontsize', 12)
         legend({'AtD Well Fit', 'AtD Poor Fit', 'DtA Well Fit'},'Location','EastOutside')
         set(gcf,'Units','Inches');
    set(gcf,'Position',[9.4306    6.2083    5.5972    7.3611])

pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

saveas(gcf,['Fig4_ef.pdf'])

%% Implications of model fits Sim, Performance 

delays=[0,1,6];
 %Sim
for N=2
    ListOfErrorsInd=[];
    ListOfErrorsAvg=[];
    ListOfDelays=[];
    ListOfModel=[];
    for D=1:3

    pplFind=theSelectedPplAIC(N-1,:)==1 | theSelectedPplAIC(N-1,:)==3 ;
       ListOfErrorsInd=[ListOfErrorsInd;Ind(pplFind,D,N)];
       ListOfDelays=[ListOfDelays;delays(D)*ones(size(Ind(pplFind,D,N)))];
       ListOfErrorsAvg=[ListOfErrorsAvg;Avg(pplFind,D,N)];
       ListOfModel=[ListOfModel;1*ones(size(Ind(pplFind,D,N)))];

  

    pplFind=theSelectedPplAIC(N-1,:)==2 | theSelectedPplAIC(N-1,:)==4 ;
       ListOfErrorsInd=[ListOfErrorsInd;Ind(pplFind,D,N)];
       ListOfDelays=[ListOfDelays;delays(D)*ones(size(Ind(pplFind,D,N)))];
       ListOfErrorsAvg=[ListOfErrorsAvg;Avg(pplFind,D,N)];
       ListOfModel=[ListOfModel;2*ones(size(Ind(pplFind,D,N)))];


    end
   

% [~,~,statsInd{N}] = anovan(ListOfErrorsInd,[ListOfDelays,ListOfModel],'model','interaction','varnames',{'Delays','Model'})
[~,~,statsAvg{N}] = anovan(ListOfErrorsAvg,[ListOfDelays,ListOfModel],'model','interaction',...
    'varnames',{'Delays','Model'})
results{N} = multcompare(statsAvg{N},'Dimension',[1 2])

end

%% Group BMC Sim
 [a2,b2] = VBA_groupBMC(-1*(LL2(:,1:2)'))
[a5,b5] = VBA_groupBMC(-1*(LL5(:,1:2)'))
%%
figure(8)
[PDF_Sim2]=JoshAnalysis(8,0.722,0.6858);
[PDF_Sim5]=JoshAnalysis(14,0.9085,0.8121);
%%
figure(8)
plot([(0:34)/34],PDF_Sim2,'b', 'Linewidth',3);
hold on
plot([(0:34)/34],PDF_Sim5,'r','Linewidth',3);


ylabel('Density');
xlabel('Proporiton AtD');
legend('Sim 2 PDF', 'Sim 5 PDF', 'Location', 'Northwest');
set(gca,'Fontsize',14);
set(gcf,'Units','Inches');
 
          set (gcf, 'Position',[3.0139    7.5278    7.7778    5.8333]);

 pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['Fig6b.pdf']);


%% Probability of getting results i.e. average % correctly idetified.SEq

    load('ConfidenceAndConfusion.mat')
for N=1:2
    AtDPercentsMean(N)=mean(AtDCorrectIdent(AtDCorrectIdent(:,N)~=0,N)/1000)
    DtAPercentsMean(N)=mean(DtACorrectIdent(DtACorrectIdent(:,N)~=0,N)/1000)


end

%% Seq Computed check if bias different in first and second half. 



for d=2:3
    for n=2:3
        for subj=1:17
            Responses=totalResp{subj,6}{d,n,2};
            Mn1(subj)=mean(Responses(1:floor(length(Responses)/2)));
            Std1(subj)=std(Responses(1:floor(length(Responses)/2)));
            Mn2(subj)=mean(Responses(floor(length(Responses)/2)+1:end));
            Std2(subj)=std(Responses(floor(length(Responses)/2)+1:end));
            
        end
        [~,diffMN_pval(d,n)]=ttest(Mn1-Mn2);
        [~,diffSTD_Pval(d,n)]=ttest(Std1-Std2);
    end
    
end

%% Looking to see how much of maximum bias people had on average for Fig 7c


%Calculate Average bias across subjects

AvgSeqMNBIASProp=nans(17,3,3);
  for N=2:3
      for d=2:3
for sub=[1:17]
  
     
        AvgSeqMNBIASProp(sub,d,N)=nanmean(BiasHolder{sub,6}{d,N});

   
end
          meanBiasProp(d,N)=nanmean(AvgSeqMNBIASProp(:,d,N));

  end
  end

  

%% Seq parameter comparisons
for param=1:6
[~,ParmaP2Seq(param)]=ttest2(AtDParam2Seq(theSelectedPpl_seqFirst(1,:)==1,param),DtAParam2Seq(theSelectedPpl_seqFirst(1,:)==2,param));
[~,ParmaP5Seq(param)]=ttest2(AtDParam5Seq(theSelectedPpl_seqFirst(2,:)==1,param),DtAParam5Seq(theSelectedPpl_seqFirst(2,:)==2,param));
end 
  %% Plot showing distance from horizontal vs distance from vertical, Seq
    

DtARangeMAvgSeqs2=sort(DtARangeNAvgSeq(:,:,1),2);
AtDRange1AvgSeqs2=sort(AtDRange1AvgSeq(:,:,1),2);

figure(42)
subplot(2,1,1)
hold on
title({'Set Size 2: Sequential','AtD subjects'})
plot(abs([5/8*IndFit(theSelectedPpl_seq(1,:)==1,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2)]),abs([(.5*IndLateFit(theSelectedPpl_seq(1,:)==1,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==1,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2)]),'sr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
plot(abs([5/8*IndFit(theSelectedPpl_seq(1,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2)]),abs([(.5*IndLateFit(theSelectedPpl_seq(1,:)==2,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==2,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2)]),'db','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
xlabel('Distance from AtD Relationship')
ylabel('Distance from DtA Relationship')

%
    subplot(2,1,1)
hold on
title({'Set Size 2: Sequential '})

plot([0,7],[0,7],'--k');
axis([0,7,0,7]);
    set(gca,'fontsize', 12)
     legend({'AtD Well Fit', 'DtA Well Fit'},'Location','EastOutside')


%%figure(42)
subplot(2,1,2)
DtARangeMAvgSeqs5=sort(DtARangeNAvgSeq(:,:,2),2);
AtDRange1AvgSeqs5=sort(AtDRange1AvgSeq(:,:,2),2);
hold on
title({'Set Size 5: Sequential '})


plot(abs([.82*IndFit(theSelectedPpl_seq(2,:)==1,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3)]),abs([(.5*IndLateFit(theSelectedPpl_seq(2,:)==1,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==1,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3)]),'sr','Linewidth',1,'MarkerFaceColor','r', 'Markersize', 8)
plot(abs([.82*IndFit(theSelectedPpl_seq(2,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3)]),abs([(.5*IndLateFit(theSelectedPpl_seq(2,:)==2,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==2,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3)]),'db','Linewidth',1,'MarkerFaceColor','b', 'Markersize', 8)
plot(abs([.82*IndFit(theSelectedPpl_seq(2,:)==8,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3)]),abs([(.5*IndLateFit(theSelectedPpl_seq(2,:)==8,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==8,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3)]),'db','Linewidth',1, 'Markersize', 8, 'Markersize',8)


xlabel('Distance from AtD Relationship')
ylabel('Distance from DtA Relationship')

 plot([0,7],[0,7],'--k'); 
    set(gca,'fontsize', 12)

 axis([0,7,0,7])

 



    set(gca,'fontsize', 12)
         legend({'AtD Well Fit',  'DtA Well Fit','DtA Poor Fit',},'Location','EastOutside')
         set(gcf,'Units','Inches');
    set(gcf,'Position',[9.4306    6.2083    5.5972    7.3611])

pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

saveas(gcf,['Fig8_ef.pdf'])
    
%% Implications Seq Performance 

for N=2

    ListOfErrorsAvg=[];
    ListOfDelays=[];
    ListOfModel=[];
    for D=2:3

        pplFind=theSelectedPpl_seq(N-1,:)==1 | theSelectedPpl_seq(N-1,:)==3 | theSelectedPpl_seq(N-1,:)==5;
       ListOfDelays=[ListOfDelays;delays(D)*ones(size(Ind(pplFind,D,N)))];
       ListOfErrorsAvg=[ListOfErrorsAvg;AvgSeqVar(pplFind,D,N)];
       ListOfModel=[ListOfModel;1*ones(size(Ind(pplFind,D,N)))];

  

            pplFind=theSelectedPpl_seq(N-1,:)==2 | theSelectedPpl_seq(N-1,:)==4 | theSelectedPpl_seq(N-1,:)==6;
       ListOfDelays=[ListOfDelays;delays(D)*ones(size(Ind(pplFind,D,N)))];
       ListOfErrorsAvg=[ListOfErrorsAvg;AvgSeqVar(pplFind,D,N)];
       ListOfModel=[ListOfModel;2*ones(size(Ind(pplFind,D,N)))];


    end
   

% [~,~,statsInd{N}] = anovan(ListOfErrorsInd,[ListOfDelays,ListOfModel],'model','interaction','varnames',{'Delays','Model'})
[~,~,statsAvgSeq{N}] = anovan(ListOfErrorsAvg,[ListOfDelays,ListOfModel],'model','interaction',...
    'varnames',{'Delays','Model'})
resultsSeq{N} = multcompare(statsAvgSeq{N},'Dimension',[1 2])

end

 %% Group BMC Seq
[a2Seq,b2Seq] = VBA_groupBMC(-1*(negLL_2seq(:,1:2)'))
[a5Seq,b5Seq] = VBA_groupBMC(-1*(negLL_5seq(:,1:2)'))
%% Probability of getting results i.e. average % correctly idetified.

    load('ConfidenceAndConfusion.mat')
for N=1:2
    AtDSeqPercentsMean(N)=mean(AtDCorrectIdentSeq(AtDCorrectIdentSeq(:,N)~=0,N)/1000)
    DtASeqPercentsMean(N)=mean(DtACorrectIdentSeq(DtACorrectIdentSeq(:,N)~=0,N)/1000)

end
%% 
figure(9)
[PDF_Sim2Seq]=JoshAnalysis(sum(theSelectedPpl_seq(1,:)==1),AtDSeqPercentsMean(1),DtASeqPercentsMean(1));
[PDF_Sim5Seq]=JoshAnalysis(sum(theSelectedPpl_seq(2,:)==1),AtDSeqPercentsMean(2),DtASeqPercentsMean(2));
plot([(0:34)/34],PDF_Sim2Seq, 'b','Linewidth',3);
hold on
plot([(0:34)/34],PDF_Sim5Seq,'r','Linewidth',3);

ylabel('Density');
xlabel('Proporiton AtD');
legend('Sim 2 PDF', 'Sim 5 PDF', 'Location', 'Northwest');
set(gca,'Fontsize',14);
set(gcf,'Units','Inches');
 
          set (gcf, 'Position',[3.0139    7.5278    7.7778    5.8333]);

 pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['Fig10b.pdf']);

%% Fitting Data to AtD and DtA models Seq with new model
for sub=17:-1:1
    if ~(isempty(totalnumTrials{sub,5}) || isempty(totalnumTrials{sub,6}) || isempty(totalnumTrials{sub,8}))
        
        for i=1:3
            for j=1:3
                PtsErr{i,j}=totalResp{sub,2}{i,j,1}';
                if i>1 && j>1
                    AvgSeqPts{i,j}=totalResp{sub,6}{i,j,2}';
                    PtsErrEarlySeq{i,j}=totalResp{sub,5}{i,j,1}';
                    PtsErrLateSeq{i,j}=totalResp{sub,8}{i,j,1}';
                end
            end
        end
        
        refit=1;
        if refit==1
            [ negLL_2seq(sub,1), AtDParam2Seq(sub,:),SEMSeq2AtD(sub,:) ] = LLAtDSeq_N_Freer(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
            [ negLL_5seq(sub,1), AtDParam5Seq(sub,:), SEMSeq5AtD(sub,:) ] = LLAtDSeq_N_Freer(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
            
            
            [ negLL_2seq(sub,2), DtAParam2Seq(sub,:),SEMSeq2DtA(sub,:) ] = LLDtASeq_N_Free(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
            [ negLL_5seq(sub,2), DtAParam5Seq(sub,:), SEMSeq5DtA(sub,:) ] = LLDtASeq_N_Free(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
            
                        
            [ negLL_2seq(sub,3), DtAAtDParam2Seqdfqwg(sub,:),SEMSeq2DtAAtD(sub,:) ] = LLDtA_AtD_Seq_N_Free(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
            [ negLL_5seq(sub,3), DtAAtDParam5Seq(sub,:), SEMSeq5DtAAtD(sub,:) ] = LLDtA_AtD_Seq_N_Free(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
            
            
            [~,theSelectedPpl_seq(1,sub)]=min([negLL_2seq(sub,1),negLL_2seq(sub,2)]);
            [~,theSelectedPpl_seq(2,sub)]=min([negLL_5seq(sub,1),negLL_5seq(sub,2)])
            
            [~,theSelectedPpl_seqFirst(1,sub)]=min([negLL_2seq(sub,1),negLL_2seq(sub,2),negLL_2seq(sub,3) ]);
            [~,theSelectedPpl_seqFirst(2,sub)]=min([negLL_5seq(sub,1),negLL_5seq(sub,2),negLL_5seq(sub,3)])
       
        
        end
        
        
        B=AtDParam2Seq(sub,:);
        N=2;
        AtDFit1seq(sub,:,1)=[AtDParam2Seq(sub,2),AtDParam2Seq(sub,2)+AtDParam2Seq(sub,1), AtDParam2Seq(sub,2)+6*AtDParam2Seq(sub,1)];
        AtDFitNEarlyseq(sub,2:3,1)=[B(4) + .5*B(1)*(N-1)^B(5)+.5*B(1)*(N)^B(5) , B(4)+ 3*B(1)*(N-1)^B(5)+3*B(1)*(N)^B(5) ];
        AtDFitNLateseq(sub,2:3,1)=[B(6)+ .5*B(1)*(N)^B(5), B(6)+3*B(1)*(N)^B(5)];
        AtDFitAvgseq(sub,2:3,1)=[B(3)+((2-1)/2)^2*(.5*B(1))+.5*B(1),B(3)+ ((2-1)/2)^2*3*B(1)+ 3*B(1) ];
        B=DtAParam2Seq(sub,:);
        
        DtAFit1seq(sub,:,1)=[DtAParam2Seq(sub,2),DtAParam2Seq(sub,2)+DtAParam2Seq(sub,1), DtAParam2Seq(sub,2)+6*DtAParam2Seq(sub,1)];
        DtAFitNEarlyseq(sub,2:3,1)=[B(4)+.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5),B(4)+3*B(1)*(N-1)^B(5)+3*B(1)*N^B(5)];
        DtAFitNLateseq(sub,2:3,1)=[B(6)+.5*B(1)*N^B(5), B(6)+3*B(1)*N^B(5)];
        DtAFitAvgseq(sub,2:3,1)=[B(3)+ (.5*B(1)*N^B(5)+(N-1)*(.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5)))/N^2 , B(3)+ (3*B(1)*N^B(5)+(N-1)*(3*B(1)*(N-1)^B(5)+3*B(1)*N^B(5)))/N^2 ];
        
        B=AtDParam5Seq(sub,:);
        N=5;
        AtDFit1seq(sub,:,2)=[AtDParam5Seq(sub,2),AtDParam5Seq(sub,2)+AtDParam5Seq(sub,1), AtDParam5Seq(sub,2)+6*AtDParam5Seq(sub,1)];
        AtDFitNEarlyseq(sub,2:3,2)=[B(4)+.5*B(1)*(N-1)^B(5)+.5*B(1)*(N)^B(5),B(4)+3*B(1)*(N-1)^B(5)+3*B(1)*(N)^B(5) ];
        AtDFitNLateseq(sub,2:3,2)=[B(6)+.5*B(1)*(N)^B(5), B(6)+3*B(1)*(N)^B(5)];
        AtDFitAvgseq(sub,2:3,2)=[B(3)+((5-1)/5)^2*(.5*B(1))+.5*B(1), B(3)+((5-1)/5)^2*( 3*B(1))    + 3*B(1) ];
        B=DtAParam5Seq(sub,:);
        DtAFit1seq(sub,:,2)=[DtAParam5Seq(sub,2),DtAParam5Seq(sub,2)+DtAParam5Seq(sub,1), DtAParam5Seq(sub,2)+6*DtAParam5Seq(sub,1)];
        DtAFitNEarlyseq(sub,2:3,2)=[B(4)+.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5),B(4)+3*B(1)*(N-1)^B(5)+3*B(1)*N^B(5)];
        DtAFitNLateseq(sub,2:3,2)=[B(6)+.5*B(1)*N^B(5), B(6)+3*B(1)*N^B(5)];
        DtAFitAvgseq(sub,2:3,2)=[B(3)+ (.5*B(1)*N^B(5)+(N-1)*(.5*B(1)*(N-1)^B(5)+.5*B(1)*N^B(5)))/N^2 , B(3)+ (3*B(1)*N^B(5)+(N-1)*(3*B(1)*(N-1)^B(5)+3*B(1)*N^B(5)))/N^2 ];
        
        
    end
    
end





