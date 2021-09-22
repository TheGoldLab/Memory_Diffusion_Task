%% Process Data
%
% This will process the data, combining all sessions and sorting them it
% will get (excluding trials of error>30
% the Objective Variance of a condition
% The number of trials for a givnen condition
% the objective mean error (bias)
% the absolute error (which I'm not using)
% all the responses for a given condition
% the Bias towards the early/late points for the mean (sequential only)
% Which set (with regards to difference between points) the sequential data
    % came from
% The best fit line for each Setsize*Response condition, bounded to be >0
% The errors from the best fit line using the equation for uncertainty
    % propegation, but not bounded by minium of slope 0
% The parameters for the "forgetting equation" relating mean abs err to
    % delay (also not using)
% 1000 bootstrapped estimates of the variance slope for each
    % setsize*response condition, (potentially using for error bars)

tic
wantToReprocess=1;
if wantToReprocess
cd '/Users/KAS/Documents/MATLAB/MGSData/AllCompData';
SubjectsToParse=dir('*Sub*');
subjects={SubjectsToParse.name};
%MakeComboMDTONline
colors={'m','r','c','b'};

%Columns
% 1=single only
% 2=Ind only
% 3=Avg only
% 4=Mixed
% 5=Early Ind only
% 6=Early Avg only
% 7=Early Mixed
% 8=Late Ind only
% 9=Late Avg only (does not exist)
% 10=Late Mixed

totalVarHolder=[];
totalnumTrials=[];
totalMnHolder=[];
totalAbErrHolder=[];
totalResp=[];
BiasHolder=[];
WhichSet=[];
totalFitParam=[];
totalFitParamErrs=[];
totalforgEq=[];
for i=1:length(subjects)
    plotty=0;
    load(fullfile( subjects{i}))
    fullfile( subjects{i}, [subjects{i},'_compiled'])
    [totalFitParam, totalFitParamErrs, totalVarHolder,totalnumTrials,totalMnHolder,totalAbErrHolder, totalResp,BiasHolder,WhichSet]=MDTAnalysis(compiled, i, totalVarHolder,totalnumTrials,totalMnHolder,totalAbErrHolder,totalResp,BiasHolder,WhichSet,totalFitParam, totalFitParamErrs);
    
    
end
else
   % load('ProcessedData.mat')
end
toc
%% The colors using: Purple=set size 1, Turquoise=Set size 2, Green=Set size 5
Pallet{1,1}=[126,0,226]/256;
Pallet{1,2}=[212,184,242]/256;
Pallet{2,1}= [0,250,255]/256;
Pallet{2,2}=[180,255,255]/256;
 Pallet{3,1}=[0,149,10]/256;
 Pallet{3,2}=[155,227,150]/256;
  Pallet{4,1}=[.9,.2,.8];
 %% Figure 2- The model description for Particle diffusion and AtD/DtA for both Simu

 figure(2)
 genFromScratch=1;
 if genFromScratch
startpt=135;
encodingN=sqrt(5);
accN=3;
deltat=.1;
timept=0:deltat:6;

rng(12346)

%Diffusion of a particle

clf
subplot(1,3,1)

for trials=1:50
    evo(trials,1,:)=startpt+randn*encodingN;
    for time=2:length(timept)
        evo(trials,time)=evo(trials,time-1)+randn*sqrt(deltat*accN);
    end
    hold on
    h(trials)=plot(timept,evo(trials,:),'-','color',Pallet{1,2});
end


h(trials+1)=plot([0,6],[startpt,startpt],'color',Pallet{1,1},'Linewidth',3);
axis([0,6,120,150])
set(gca,'ytick', [135-5,135,135+5])
set(gca, 'yticklabel',{'x_i - \eta_1','x_i','x_i + \eta_1'})
xlabel('Time(s)');
ylabel('Mental Representation (deg)')
legend(h([end-1:end]),'Simulated Trials', 'True Value', 'Location','s')
plot([0,0],[0,170],':k');
plot([1,1],[0,170],':k');
plot([6,6],[0,170],':k');
legend boxoff
set(gca,'fontsize', 18)

%Plot accumulating Var vs time
subplot(1,3,2)
hold on
plot([0,6],[15,32],'color',Pallet{1,1}, 'Linewidth',3)
plot([0,6],[25,65],'color',Pallet{4,1}, 'Linewidth',3)
plot([0,6],[10,27],'-k', 'Linewidth',3)
plot([0,6],[10,18],'--k', 'Linewidth',3)

plot([0,0],[0,75],':k');
plot([1,1],[0,75],':k');
plot([6,6],[0,75],':k');
axis([0,6,0,75]);
set(gca,'ytick', [10,15,25])
set(gca, 'yticklabel',{'\eta_M','\eta_1','\eta_N'})
txt1 = ['Variance_1 = \eta_1 +  t*\sigma_1^2'];
text(1.6, 30, txt1,'fontsize', 14,'color',Pallet{1,1});
txt1 = ['Variance_N = \eta_N +  t*\sigma_N^2'];
text(3, 41, txt1,'color', Pallet{4,1},'fontsize', 14);
xlabel('Time (s)')
ylabel({'Accumulated Noise', 'in Representation (deg^2)'})
legend('Single Memorandum','N Memoranda','Mean (AtD: \sigma_M^2=\sigma_1^2)','Mean (DtA: \sigma_M^2=\sigma_N^2/N)', 'Location','NW')


set(gca,'fontsize', 18)


time=0:.1:6;
EncodingVariance=10;
DC1=.4;
A=.5;
DC4=DC1*4^A;
DC5=DC1*5^A;
VarianceAtDSeq=EncodingVariance;
VarianceDtASeq=EncodingVariance;
VarianceComponents=[0;0;0;0;0];

for t=2:length(time)
    if t<length(time)/2
        VarianceAtDSeq(t)=VarianceAtDSeq(t-1)+DC1;
        VarianceComponents(1:4,t)=VarianceComponents(1:4,t-1)+DC4;
        VarianceDtASeq(t)=EncodingVariance+sum(VarianceComponents(1:4,t))/16;
    elseif t==round(length(time)/2)
        VarianceAtDSeq(t)=EncodingVariance+(VarianceAtDSeq(t-1)+DC1-EncodingVariance)*16/25;
        VarianceComponents(1:4,t)=VarianceComponents(1:4,t-1)+DC4;
        VarianceDtASeq(t)=EncodingVariance+sum(VarianceComponents(1:5,t))/25;
    else
        VarianceAtDSeq(t)=VarianceAtDSeq(t-1)+DC1;
        VarianceComponents(1:5,t)=VarianceComponents(1:5,t-1)+DC5;
        VarianceDtASeq(t)=EncodingVariance+sum(VarianceComponents(1:5,t))/25;
    end
    
end
figure(2)
subplot(2,3,6)
plot(time,VarianceAtDSeq,'-k', 'Linewidth', 2)
hold on
plot([0,6],[10,VarianceAtDSeq(end)],'-.k', 'Linewidth', 2)
hold on
plot(time,VarianceDtASeq,'--k', 'Linewidth', 2)
plot([0,6],[10,VarianceDtASeq(end)],':k', 'Linewidth', 2)

legend('AtD','Effective AtD', 'DtA','Effective DtA', 'Location','NW')
xlabel('Time(s)');
set(gca,'xtick', [0,3,6])
set(gca, 'xticklabel',{'0','T/2 (new point)','T (probe)'})
set(gca,'ytick', [10])
set(gca, 'yticklabel',{'\eta_M_S_e_q'})
set(gca,'fontsize', 18)


subplot(2,3,3)
hold on
plot(time,VarianceComponents(1,:),'r', 'Linewidth', 2)
plot([0,6],[0,VarianceComponents(1,end)],':r', 'Linewidth', 2)

plot(time(31:end),VarianceComponents(5,31:end),'m', 'Linewidth', 2)
ylabel({'Accumulated Noise', 'in Representation (deg^2)'})

legend('Early', 'Effective Early', 'Late','Location','NW');
% xlabel('Time');
 set(gca,'xtick', [])
% set(gca, 'xticklabel',{'0','T/2','T'})
set(gca,'ytick', [0])
set(gca, 'yticklabel',{['\eta_N_(_E_ _o_r_ _L_)']})
set(gca,'fontsize', 18)


set(gcf,'Units','Inches');
set(gcf,'Position',[9.4306    8.0000   14.1111    5.5694]);
else
open('TestFig.fig')
end

%set(gcf,'Position',[9.7639    4.0417   15.5417    9.2222]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
%%
saveas(gcf,['Fig2.pdf']);
%% Preparing for figure 3, showing Bias and Variance across subjects for Sim condition
%Note, Histogram processing for showing histograms rather than just means
%for a possible supplimental figure can be found in MasterFile2

%Calculate Average bias across subjects
AvgMNBIAS=nans(17,3,3);
IndMNBIAS=nans(17,3,3);
AvgSeqMNBIAS=nans(17,3,3);
IndEMNBIAS=nans(17,3,3);
IndLMNBIAS=nans(17,3,3);

for sub=[1:17]
    for N=1:3
        if N>1
        AvgMNBIAS(sub,:,N)=totalMnHolder{sub,3}(:,N,2);
        AvgSeqMNBIAS(sub,:,N)=totalMnHolder{sub,6}(:,N,2);
        IndEMNBIAS(sub,:,N)=totalMnHolder{sub,5}(:,N,1);
        IndLMNBIAS(sub,:,N)=totalMnHolder{sub,8}(:,N,1);

        end
        IndMNBIAS(sub,:,N)=totalMnHolder{sub,2}(:,N,1);
    end
end



% Calculate average variance across subjects
 
    Sing=nans(size(totalVarHolder,1),3,3);
Avg=nans(size(totalVarHolder,1),3,3);
Ind=nans(size(totalVarHolder,1),3,3);
% MixInd=nans(size(totalVarHolder,1),3,3);



for sub=[1:size(totalVarHolder,1)]
    for N=1:3
        Sing(sub,:,N)=totalVarHolder{sub,1}(:,N,1);
        Avg(sub,:,N)=totalVarHolder{sub,3}(:,N,2);
        Ind(sub,:,N)=totalVarHolder{sub,2}(:,N,1);
        %         MixInd(subj,:,nump)=totalVarHolder{subj,4}(:,nump,1);
        %         MixAvg(subj,:,nump)=totalVarHolder{subj,4}(:,nump,2);
        
    end
end
%% Figure 3- Average Bias and Variance across subjects

figure(3)
subplot(2,2,3)


hold on
title({'Imprecision In Report of';' Percieved Point'})

colormod=Pallet{1,1};
h(1)=errorbar([0,1,6],nanmean(Ind(:,:,1),1),nanstd(Ind(:,:,1),1)/sqrt(sum(~isnan(Ind(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
subplot(2,2,1)
h(1)=errorbar([0,1,6],nanmean(IndMNBIAS(:,:,1),1),nanstd(IndMNBIAS(:,:,1),1)/sqrt(sum(~isnan(IndMNBIAS(:,1)))),'o','color', colormod, 'Markersize', 8);
title({'Bias In Report of';' Percieved Point'})
subplot(2,2,2)
h(1)=errorbar([0,1,6],nanmean(AvgMNBIAS(:,:,1),1),nanstd(AvgMNBIAS(:,:,1),1)/sqrt(sum(~isnan(IndMNBIAS(:,1)))),'o','color', colormod, 'Markersize', 8);
title({'Bias In Report of';' A Computed Average'})

subplot(2,2,4)
hold on
title({'Imprecision In Report of:'; 'A Computed Average'})

h(4)=errorbar([0,1,6],nanmean(Ind(:,:,1),1),nanstd(Ind(:,:,1),1)/sqrt(sum(~isnan(Ind(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

for N=2:3
    figure(3)
    hold on
    subplot(2,2,3);
    colormod=Pallet{N,1};
    h(N)=errorbar([0,1,6],nanmean(Ind(:,:,N),1),nanstd(Ind(:,:,N),1)/sqrt(size(Ind,1)),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    axis([-.5,6.5,0,90]);
    xlabel('Delay Time (sec)');
  ylabel('Variance (deg^2)');
  set(gca,'fontsize', 12)
    subplot(2,2,4);
    hold on;
    
    errorbar([0,1,6],nanmean(Avg(:,:,N),1),nanstd(Avg(:,:,N),1)/sqrt(sum(~isnan(Ind(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8)
    
    hold on;
    axis([-.5,6.5,0,90]);
    xlabel('Delay Time (sec)');

    set(gca,'fontsize', 12)

    %Bias
     figure(3)
    hold on
    subplot(2,2,1);
    hold on
    colormod=Pallet{N,1};
    h(N)=errorbar([0,1,6],nanmean(IndMNBIAS(:,:,N),1),nanstd(IndMNBIAS(:,:,N),1)/sqrt(size(IndMNBIAS,1)),'o','color', colormod, 'Markersize', 8);
    if N==2 %Significant is filled in
      h(N)=errorbar([6],nanmean(IndMNBIAS(:,3,N),1),nanstd(IndMNBIAS(:,3,N),1)/sqrt(size(IndMNBIAS,1)),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

    end
    ylabel('Mean Error (deg)');
axis([-0.5,6.5,-1.5,1.5])
  set(gca,'fontsize', 12)
    subplot(2,2,2);
    hold on;
  
    errorbar([0,1,6],nanmean(AvgMNBIAS(:,:,N),1),nanstd(AvgMNBIAS(:,:,N),1)/sqrt(sum(~isnan(IndMNBIAS(:,1)))),'o','color', colormod, 'Markersize', 8)
    
    hold on;

axis([-0.5,6.5,-1.5,1.5])

    set(gca,'fontsize', 12)
    
end
subplot(2,2,1)
                 plot([-.5,6.5],[0,0],'--k');

         subplot(2,2,3)
         legend ('Set Size 1', 'Set Size 2','Set Size 5','Location', 'NW');
         subplot(2,2,2)
             plot([-.5,6.5],[0,0],'--k');
%          legend ('1 Memorandum', 'Mean of 2 Memoranda','Mean of 5 Memoranda','Location', 'NW');

%         
        set(gca, 'Fontsize',12)
 set(gcf,'Units','Inches');
 
          set (gcf, 'Position',[9.7639    5.9028    8.9028    7.3611]);

 pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['Fig3.pdf']);
%% Statistics for Figure 3


% Test if Bias is diff from zero)
[a,b]=ttest(AvgMNBIAS);
[c,d]=ttest(IndMNBIAS);
AvgBiasTest=min(b*27,1)
IndBiasTest=min(d*27,1)


% ANOVA Statistics For Simaltanious Aggregate
%Make Column Vector Y of all the Variances by subject
totalInd=[];
%totalIndMix=[];
totalAvg=[];
SubjectList=[];
DelayList=[];
NumpList=[];
for sub=1:17
    for delay=1:3
        for N=1:3
            if ~isnan(Avg(sub,delay,2))
                totalInd=[totalInd;Ind(sub,delay,N)];
                
                SubjectList=[SubjectList;sub];
                if N==1;
                    totalAvg=[totalAvg;Ind(sub,delay,N)];
                else
                    %totalIndMix=[totalIndMix;MixInd(sub,delay,nump)];
                    
                    totalAvg=[totalAvg;Avg(sub,delay,N)];
                end
                DelayList=[DelayList;delay];
                NumpList=[NumpList;N];
            end
            
        end
    end
    
end
FACTNAMES={'Delay', 'SetSize'};
statsInd = rm_anova2(totalInd,SubjectList,DelayList,NumpList,FACTNAMES)
statsAvg = rm_anova2(totalAvg,SubjectList,DelayList,NumpList,FACTNAMES)
%% Fitting the Data to AtD or DtA model or AtD with variable slope
for sub=17:-1:1
    if ~(isempty(totalnumTrials{sub,2}) || isempty(totalnumTrials{sub,3}) || isempty(totalnumTrials{sub,4}))
        PtsErr=totalResp{sub,2}(:,:,1);
        
        for i=1:3
            for j=1:3
                
                AtD{i,j}=totalResp{sub,3}{i,j,2}';
            end
        end
               parttrials2=sum(sum(totalnumTrials{sub,2}(:,1:2,1)))+sum(sum(totalnumTrials{sub,3}(:,2,2)));
        parttrials5=sum(sum(totalnumTrials{sub,2}(:,[1,3],1)))+sum(sum(totalnumTrials{sub,3}(:,3,2)));
        
        [LL2(sub,1), AtD2Param(sub,:),SEMAtD2Param(sub,:)]=LL2vs5AtDMF(PtsErr(:,[1:2]),AtD(:,2),2);
        [LL2(sub,2), DtA2Param(sub,:),SEMDtA2Param(sub,:)]=LL2vs5DtAMF(PtsErr(:,[1:2]),AtD(:,2),2);
       % [LL2(sub,3), TimeParam2(sub,:)]=LLSimTime(PtsErr(:,[1:2]),AtD(:,2),2);
       % [LL2(sub,4), AtDLoose2Param(sub,:)]=LL2vs5AtDDifDiffusion(PtsErr(:,[1:2]),AtD(:,2),2);


        [LL5(sub,1), AtD5Param(sub,:),SEMAtD5Param(sub,:)]=LL2vs5AtDMF(PtsErr(:,[1,3]),AtD(:,3),5);
        [LL5(sub,2), DtA5Param(sub,:),SEMDtA5Param(sub,:)]=LL2vs5DtAMF(PtsErr(:,[1,3]),AtD(:,3),5);
        
        factor=2;%log(parttrials2);
        factor2=2%log(parttrials5);
        
            AIC2(sub,1)=5*factor+2*LL2(sub,1);
            AIC2(sub,2)=5*factor+2*LL2(sub,2);
%             AIC2(sub,3)=6*factor+2*LL2(sub,3);
%             AIC2(sub,4)=6*factor+2*LL2(sub,4);


            
                        AIC5(sub,1)=5*factor2+2*LL5(sub,1);
            AIC5(sub,2)=5*factor2+2*LL5(sub,2);
            
            [~,theSelectedPpl(1,sub)]=min([AIC2(sub,1),AIC2(sub,2)]);
            [~,theSelectedPplAllOptions(1,sub)]=min([AIC2(sub,1),AIC2(sub,2)])


            [~,theSelectedPpl(2,sub)]=min([AIC5(sub,1),AIC5(sub,2)]);

            
            [~,theSelectedPplMF(1,sub)]=min([AIC2(sub,1),AIC2(sub,2)]);


            [~,theSelectedPplMF(2,sub)]=min([AIC5(sub,1),AIC5(sub,2)]);

      
        
        AtDFit1(sub,:,1)=[AtD2Param(sub,2),AtD2Param(sub,2)+AtD2Param(sub,1), AtD2Param(sub,2)+6*AtD2Param(sub,1)];
        AtDFitN(sub,:,1)=[AtD2Param(sub,3),AtD2Param(sub,3)+AtD2Param(sub,1)*2^AtD2Param(sub,5), AtD2Param(sub,3)+6*AtD2Param(sub,1)*2^AtD2Param(sub,5)];
        AtDFitAvg(sub,:,1)=[AtD2Param(sub,4),AtD2Param(sub,4)+AtD2Param(sub,1), AtD2Param(sub,4)+6*AtD2Param(sub,1)];
        AtDFit1(sub,:,2)=[AtD5Param(sub,2),AtD5Param(sub,2)+AtD5Param(sub,1), AtD5Param(sub,2)+6*AtD5Param(sub,1)];
        AtDFitN(sub,:,2)=[AtD5Param(sub,3),AtD5Param(sub,3)+AtD5Param(sub,1)*5^AtD5Param(sub,5), AtD5Param(sub,3)+6*AtD5Param(sub,1)*5^AtD5Param(sub,5)];
        AtDFitAvg(sub,:,2)=[AtD5Param(sub,4),AtD5Param(sub,4)+AtD5Param(sub,1), AtD5Param(sub,4)+6*AtD5Param(sub,1)];
        
        DtAFit1(sub,:,1)=[DtA2Param(sub,2),DtA2Param(sub,2)+DtA2Param(sub,1), DtA2Param(sub,2)+6*DtA2Param(sub,1)];
        DtAFitN(sub,:,1)=[DtA2Param(sub,3),DtA2Param(sub,3)+DtA2Param(sub,1)*2^DtA2Param(sub,5), DtA2Param(sub,3)+6*DtA2Param(sub,1)*2^DtA2Param(sub,5)];
        DtAFitAvg(sub,:,1)=[DtA2Param(sub,4),DtA2Param(sub,4)+DtA2Param(sub,1)*2^DtA2Param(sub,5)/2, DtA2Param(sub,4)+6*DtA2Param(sub,1)*2^DtA2Param(sub,5)/2];
        DtAFit1(sub,:,2)=[DtA5Param(sub,2),DtA5Param(sub,2)+DtA5Param(sub,1), DtA5Param(sub,2)+6*DtA5Param(sub,1)];
        DtAFitN(sub,:,2)=[DtA5Param(sub,3),DtA5Param(sub,3)+DtA5Param(sub,1)*5^DtA5Param(sub,5), DtA5Param(sub,3)+6*DtA5Param(sub,1)*5^DtA5Param(sub,5)];
        DtAFitAvg(sub,:,2)=[DtA5Param(sub,4),DtA5Param(sub,4)+DtA5Param(sub,1)*5^DtA5Param(sub,5)/5, DtA5Param(sub,4)+6*DtA5Param(sub,1)*5^DtA5Param(sub,5)/5];
        
    end
end


%% Preparing for Fig 4- Collecting Estimates of DC
for sub=[1:17]%size(totalVarHolder,1)]
    for N=1:3
        if N>1
            AvgFit(sub,N)=totalFitParam{sub,3}{N,2}(1);
            AvgSeqFit(sub,N)=totalFitParam{sub,6}{N,2}(1);
            IndEarlyFit(sub,N)=totalFitParam{sub,5}{N,1}(1);
            IndLateFit(sub,N)=totalFitParam{sub,8}{N,1}(1);

        end
        IndFit(sub,N)=totalFitParam{sub,2}{N,1}(1);

    end
end

%% Check to see if in range:
clear IndVals
clear AtDVals
clear DtAVals
SetSize=[1,2,5];
 AtDCorrectIdent=zeros(17,2);
 DtACorrectIdent=zeros(17,2);

delays=[0,1,6];
nReps=50;
checkrange=0;
if checkrange
for N=2:3
    for sub=1:17%[1,13,14,17] %these people only have 50 trials 
        
        if ismember(sub,[1,13,14,17])
            nReps=50;
        else
            nReps=100;
        end
        
        for trials=1:1000
            if N==2
                params1=AtD2Param(sub,:);
                params2=DtA2Param(sub,:);
            else
                params1=AtD5Param(sub,:);
                params2=DtA5Param(sub,:);
            end
            
            
            
             PtsErr=totalResp{sub,2}(:,:,1);
        
        for i=1:3
            for j=1:3
                
                AtD{i,j}=totalResp{sub,3}{i,j,2}';
            end
        end


           
            
            [ PtsErrSIMAtD, AvgSIMAtD ] = GenIndAvgAtD(params1,SetSize(N),nReps,PtsErr(:,[1,N]),AtD(:,N));
            [ PtsErrSIMDtA, AvgSIMDtA ] = GenIndAvgDtA(params2,SetSize(N),nReps,PtsErr(:,[1,N]),AtD(:,N));
            
            
              %AtD refit
                    [a3,a4]=LL2vs5AtDMF(PtsErrSIMAtD,AvgSIMAtD(:,2,2),SetSize(N));
                    [a5,a6]=LL2vs5DtAMF(PtsErrSIMAtD,AvgSIMAtD(:,2,2),SetSize(N));
                    
                    if a3<a5
                        AtDCorrectIdent(sub,N-1)=AtDCorrectIdent(sub,N-1)+1;
                    end
                    
                    
                    %DtA refit
                    [a7,a8]=LL2vs5AtDMF(PtsErrSIMDtA,AvgSIMDtA(:,2,2),SetSize(N));
                    [a9,a10]=LL2vs5DtAMF(PtsErrSIMDtA,AvgSIMDtA(:,2,2),SetSize(N));
                    
                    if a9<a7
                        DtACorrectIdent(sub,N-1)=DtACorrectIdent(sub,N-1)+1;
                    end
            
            for d=1:length(delays)
                vAtD1(d)=var(PtsErrSIMAtD{d,1});
                vAtD2(d)=var(PtsErrSIMAtD{d,2});
                vAtDA(d)=var(AvgSIMAtD{d,2,2});
                
                vDtA1(d)=var(PtsErrSIMDtA{d,1});
                vDtA2(d)=var(PtsErrSIMDtA{d,2});
                vDtAA(d)=var(AvgSIMDtA{d,2,2});
                
                
            end
            
            
            
            
            
            
            x=delays(1:end);
            y=vAtD1;
            options = optimset('Display','off','MaxFunEvals',2500);
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            
            
            Mean1SlopeAtD=nonbooty(1);
            
            y=vAtD2;
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNSlopeAtD=nonbooty(1);
            
            y=vAtDA;
            
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanASlopeAtD=nonbooty(1);
            y=vDtA1;
            
            %
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            Mean1SlopeDtA=nonbooty(1);
            y=vDtA2;
            %
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNSlopeDtA=nonbooty(1);
            
            y=vDtAA;
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanASlopeDtA=nonbooty(1);
            
            
            AtDRangeNAvg(sub,trials,N-1)=(MeanNSlopeAtD)/SetSize(N)-(MeanASlopeAtD);
            AtDRange1Avg(sub,trials,N-1)=Mean1SlopeAtD-(MeanASlopeAtD);
            DtARangeNAvg(sub,trials,N-1)=(MeanNSlopeDtA)/SetSize(N)-(MeanASlopeDtA);
            DtARange1Avg(sub,trials,N-1)=Mean1SlopeDtA-MeanASlopeDtA;
        end
     disp(sub)   
    end
    
end
else
    load('ConfidenceAndConfusion.mat')
end


%% If outside of 95% expected range, check without MF assumption
listOfMeh={[],[]};
for sub=1:17
    for N=1:2
    inrangeDtA(sub,N)=sum(DtARangeNAvg(sub,:,N)<(IndFit(sub,N+1)/SetSize(N+1)-AvgFit(sub,N+1)));
    inrangeAtD(sub,N)=sum(AtDRange1Avg(sub,:,N)<(IndFit(sub,1)-AvgFit(sub,N+1)));
    if ((inrangeDtA(sub,N)<25 || inrangeDtA(sub,N)>975) && theSelectedPplMF(N,sub)==2) || ((inrangeAtD(sub,N)<25 || inrangeAtD(sub,N)>975) && theSelectedPplMF(N,sub)==1)
        disp(sub);
   listOfMeh{N}=[listOfMeh{N},sub];
        PtsErr=totalResp{sub,2}(:,:,1);
        
        for i=1:3
            for j=1:3
                
                AtD{i,j}=totalResp{sub,3}{i,j,2}';
            end
        end
        
       
        factor=2;%log(parttrials2);
        factor2=2;%log(parttrials5);     
if N==1
        [LL2(sub,3), TimeParam2(sub,:)]=LLSimTime(PtsErr(:,[1:2]),AtD(:,2),2);
        [LL2(sub,4), AtDLoose2Param(sub,:)]=LL2vs5AtDDifDiffusion(PtsErr(:,[1:2]),AtD(:,2),2);
        AIC2(sub,3)=6*factor+2*LL2(sub,3);
        AIC2(sub,4)=6*factor+2*LL2(sub,4);
       [~,theSelectedPplMF(1,sub)]=min([AIC2(sub,1),AIC2(sub,2),AIC2(sub,3),AIC2(sub,4)]);
theSelectedPplMF(1,sub)=theSelectedPplMF(1,sub)+2
else
      
        
                [LL5(sub,3), TimeParam5(sub,:)]=LLSimTime(PtsErr(:,[1:3]),AtD(:,3),5);
        [LL5(sub,4), AtDLoose5Param(sub,:)]=LL2vs5AtDDifDiffusion(PtsErr(:,[1,3]),AtD(:,3),5);
  
                        AIC5(sub,3)=6*factor2+2*LL5(sub,3);
            AIC5(sub,4)=6*factor2+2*LL5(sub,4);

            [~,theSelectedPplMF(2,sub)]=min([AIC5(sub,1),AIC5(sub,2),AIC5(sub,3),AIC5(sub,4)])
       theSelectedPplMF(2,sub)=theSelectedPplMF(2,sub)+2
end
    end
    end
end

% If STILL outside of 95% expected range, note by plus2
 for N=1:2
     for sub=listOfMeh{N}
   
    inrangeDtA(sub,N)=sum(DtARangeNAvg(sub,:,N)<(IndFit(sub,N+1)/SetSize(N+1)-AvgFit(sub,N+1)));
    inrangeAtD(sub,N)=sum(AtDRange1Avg(sub,:,N)<(IndFit(sub,1)-AvgFit(sub,N+1)));
    if ((inrangeDtA(sub,N)<25 || inrangeDtA(sub,N)>975) && theSelectedPplMF(N,sub)==2) || ((inrangeAtD(sub,N)<25 || inrangeAtD(sub,N)>975) && theSelectedPplMF(N,sub)==1)
        disp(['subject ', num2str(sub), ' SetSize ', num2str(N)]);
   
        
            theSelectedPplMF(N,sub)=theSelectedPplMF(N,sub)+2
       
end
    end
    end
%% Probability of True|Identified=P(Identified|True)*P(True)/P(Identified across all Possible)
for sub=1:17
for N=1:2
if isempty(find(listOfMeh{1,N}==sub))
    if theSelectedPplMF(N,sub)==1
        ProbAtDGIVENident(sub,N)=AtDCorrectIdent(sub,N)/1000*.5/(AtDCorrectIdent(sub,N)/1000*.5+(1-(DtACorrectIdent(sub,N)/1000))*.5);
    elseif theSelectedPplMF(N,sub)==2
        ProbDtAGIVENident(sub,N)=DtACorrectIdent(sub,N)/1000*.5/(DtACorrectIdent(sub,N)/1000*.5+(1-(AtDCorrectIdent(sub,N)/1000))*.5);

    end
end
end
end




%% Figure 4-  Plot (For AtD, DtA) error bars with true diff of 1-Avg and N/N-Avg
theSelectedPplAIC=theSelectedPplMF;
DtARangeMAvgs=sort(DtARangeNAvg(:,:,1),2);
AtDRange1Avgs=sort(AtDRange1Avg(:,:,1),2);
if genFromScratch
figure(4)
subplot(2,2,1)
hold on
title({'Set Size 2','AtD subjects'})
ylabel({['$$\hat{\sigma}_2^2/2 -\hat{\sigma}_{M2}^2$$'],['(DtA predicts 0)']},'Interpreter','Latex','fontweight','bold')
plot([IndFit(theSelectedPplAIC(1,:)==1,1)-AvgFit(theSelectedPplAIC(1,:)==1,2)],[IndFit(theSelectedPplAIC(1,:)==1,2)/2-AvgFit(theSelectedPplAIC(1,:)==1,2)],'sk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(1,:)==3,1)-AvgFit(theSelectedPplAIC(1,:)==3,2)],[IndFit(theSelectedPplAIC(1,:)==3,2)/2-AvgFit(theSelectedPplAIC(1,:)==3,2)],'sk','Linewidth',1,'Markersize', 8)
 plot([IndFit(theSelectedPplAIC(1,:)==5,1)-AvgFit(theSelectedPplAIC(1,:)==5,2)],[IndFit(theSelectedPplAIC(1,:)==5,2)/2-AvgFit(theSelectedPplAIC(1,:)==5,2)],'sk','Linewidth',1,'Markersize', 8)
plot([AtDRange1Avgs(theSelectedPplAIC(1,:)==1,25),AtDRange1Avgs(theSelectedPplAIC(1,:)==1,975)]',[IndFit(theSelectedPplAIC(1,:)==1,2)/2-AvgFit(theSelectedPplAIC(1,:)==1,2),IndFit(theSelectedPplAIC(1,:)==1,2)/2-AvgFit(theSelectedPplAIC(1,:)==1,2)]','color',[.5,.5,.5])
plot([AtDRange1Avgs(theSelectedPplAIC(1,:)==3,25),AtDRange1Avgs(theSelectedPplAIC(1,:)==3,975)]',[IndFit(theSelectedPplAIC(1,:)==3,2)/2-AvgFit(theSelectedPplAIC(1,:)==3,2),IndFit(theSelectedPplAIC(1,:)==3,2)/2-AvgFit(theSelectedPplAIC(1,:)==3,2)]','color',[.5,.5,.5])
 plot([AtDRange1Avgs(theSelectedPplAIC(1,:)==5,25),AtDRange1Avgs(theSelectedPplAIC(1,:)==5,975)]',[IndFit(theSelectedPplAIC(1,:)==5,2)/2-AvgFit(theSelectedPplAIC(1,:)==5,2),IndFit(theSelectedPplAIC(1,:)==5,2)/2-AvgFit(theSelectedPplAIC(1,:)==5,2)]','color',[.5,.5,.5])
xlabel({['$$\hat{\sigma}_1^2 - \hat{\sigma}_{M2}^2$$']},'Interpreter','Latex','fontweight','bold')

plot([-6,6],[0,0],'--k'); plot([0,0],[-6,6],'--k')
axis([-6,6,-6,6])
    set(gca,'fontsize', 14)
%     legend('AtD Well Fit','Simulated 95% CI','Location','NW')
subplot(2,2,2)
hold on
title({'Set Size 2','DtA subjects'})

xlabel({['$$\hat{\sigma}_1^2 - \hat{\sigma}_{M2}^2$$']},'Interpreter','Latex','fontweight','bold')
plot([IndFit(theSelectedPplAIC(1,:)==2,1)-AvgFit(theSelectedPplAIC(1,:)==2,2)],[IndFit(theSelectedPplAIC(1,:)==2,2)/2-AvgFit(theSelectedPplAIC(1,:)==2,2)],'dk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(1,:)==4,1)-AvgFit(theSelectedPplAIC(1,:)==4,2)],[IndFit(theSelectedPplAIC(1,:)==4,2)/2-AvgFit(theSelectedPplAIC(1,:)==4,2)],'dk','Linewidth',1, 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(1,:)==6,1)-AvgFit(theSelectedPplAIC(1,:)==6,2)],[IndFit(theSelectedPplAIC(1,:)==6,2)/2-AvgFit(theSelectedPplAIC(1,:)==6,2)],'dk','Linewidth',1, 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(1,:)==2,1)-AvgFit(theSelectedPplAIC(1,:)==2,2),IndFit(theSelectedPplAIC(1,:)==2,1)-AvgFit(theSelectedPplAIC(1,:)==2,2)]',[DtARangeMAvgs(theSelectedPplAIC(1,:)==2,25),DtARangeMAvgs(theSelectedPplAIC(1,:)==2,975)]','color',[.5,.5,.5])
plot([IndFit(theSelectedPplAIC(1,:)==4,1)-AvgFit(theSelectedPplAIC(1,:)==4,2),IndFit(theSelectedPplAIC(1,:)==4,1)-AvgFit(theSelectedPplAIC(1,:)==4,2)]',[DtARangeMAvgs(theSelectedPplAIC(1,:)==4,25),DtARangeMAvgs(theSelectedPplAIC(1,:)==4,975)]','color',[.5,.5,.5])
plot([IndFit(theSelectedPplAIC(1,:)==6,1)-AvgFit(theSelectedPplAIC(1,:)==6,2),IndFit(theSelectedPplAIC(1,:)==6,1)-AvgFit(theSelectedPplAIC(1,:)==6,2)]',[DtARangeMAvgs(theSelectedPplAIC(1,:)==6,25),DtARangeMAvgs(theSelectedPplAIC(1,:)==6,975)]','color',[.5,.5,.5])
plot([-6,6],[0,0],'--k'); plot([0,0],[-6,6],'--k')
    set(gca,'fontsize', 14)
axis([-6,6,-6,6])
    legend('DtA Well Fit','DtA Poor Fit','Simulated 95% CI','Location','NW')

%

figure(4)
subplot(2,2,3)
DtARangeMAvgs5=sort(DtARangeNAvg(:,:,2),2);
AtDRange1Avgs5=sort(AtDRange1Avg(:,:,2),2);
hold on
title({'Set Size 5 ','AtD subjects'})

xlabel({['$$\hat{\sigma}_1^2 - \hat{\sigma}_{M5}^2$$'],['(AtD predicts 0)']},'Interpreter','Latex','fontweight','bold')
ylabel({['$$\hat{\sigma}_5^2/5 -\hat{\sigma}_{M5}^2$$'],['(DtA predicts 0)']},'Interpreter','Latex','fontweight','bold')

plot([IndFit(theSelectedPplAIC(2,:)==1,1)-AvgFit(theSelectedPplAIC(2,:)==1,3)],[IndFit(theSelectedPplAIC(2,:)==1,3)/5-AvgFit(theSelectedPplAIC(2,:)==1,3)],'sk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(2,:)==3,1)-AvgFit(theSelectedPplAIC(2,:)==3,3)],[IndFit(theSelectedPplAIC(2,:)==3,3)/5-AvgFit(theSelectedPplAIC(2,:)==3,3)],'sk','Linewidth',1, 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(2,:)==5,1)-AvgFit(theSelectedPplAIC(2,:)==5,3)],[IndFit(theSelectedPplAIC(2,:)==5,3)/5-AvgFit(theSelectedPplAIC(2,:)==5,3)],'sk','Linewidth',1, 'Markersize', 8)
plot([AtDRange1Avgs5(theSelectedPplAIC(2,:)==1,25),AtDRange1Avgs5(theSelectedPplAIC(2,:)==1,975)]',[IndFit(theSelectedPplAIC(2,:)==1,3)/5-AvgFit(theSelectedPplAIC(2,:)==1,3),IndFit(theSelectedPplAIC(2,:)==1,3)/5-AvgFit(theSelectedPplAIC(2,:)==1,3)]','color',[.5,.5,.5])
plot([AtDRange1Avgs5(theSelectedPplAIC(2,:)==3,25),AtDRange1Avgs5(theSelectedPplAIC(2,:)==3,975)]',[IndFit(theSelectedPplAIC(2,:)==3,3)/5-AvgFit(theSelectedPplAIC(2,:)==3,3),IndFit(theSelectedPplAIC(2,:)==3,3)/5-AvgFit(theSelectedPplAIC(2,:)==3,3)]','color',[.5,.5,.5])
plot([AtDRange1Avgs5(theSelectedPplAIC(2,:)==5,25),AtDRange1Avgs5(theSelectedPplAIC(2,:)==5,975)]',[IndFit(theSelectedPplAIC(2,:)==5,3)/5-AvgFit(theSelectedPplAIC(2,:)==5,3),IndFit(theSelectedPplAIC(2,:)==5,3)/5-AvgFit(theSelectedPplAIC(2,:)==5,3)]','color',[.5,.5,.5])
    legend('AtD Well Fit','AtD Poorly Fit', 'Simulated 95% CI','Location','NW')

plot([-6,6],[0,0],'--k'); plot([0,0],[-6,6],'--k')
axis([-6,6,-6,6])
    set(gca,'fontsize', 14)
subplot(2,2,4)
hold on
xlabel({['$$\hat{\sigma}_1^2 - \hat{\sigma}_{M5}^2$$'],['(AtD predicts 0)']},'Interpreter','Latex','fontweight','bold')
title({'Set Size 5','DtA subjects'})

plot([IndFit(theSelectedPplAIC(2,:)==2,1)-AvgFit(theSelectedPplAIC(2,:)==2,3)],[IndFit(theSelectedPplAIC(2,:)==2,3)/5-AvgFit(theSelectedPplAIC(2,:)==2,3)],'dk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(2,:)==2,1)-AvgFit(theSelectedPplAIC(2,:)==2,3),IndFit(theSelectedPplAIC(2,:)==2,1)-AvgFit(theSelectedPplAIC(2,:)==2,3)]',[DtARangeMAvgs5(theSelectedPplAIC(2,:)==2,25),DtARangeMAvgs5(theSelectedPplAIC(2,:)==2,975)]','color',[.5,.5,.5])
plot([IndFit(theSelectedPplAIC(2,:)==4,1)-AvgFit(theSelectedPplAIC(2,:)==4,3)],[IndFit(theSelectedPplAIC(2,:)==4,3)/5-AvgFit(theSelectedPplAIC(2,:)==4,3)],'dk','Linewidth',1, 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(2,:)==4,1)-AvgFit(theSelectedPplAIC(2,:)==4,3),IndFit(theSelectedPplAIC(2,:)==4,1)-AvgFit(theSelectedPplAIC(2,:)==4,3)]',[DtARangeMAvgs5(theSelectedPplAIC(2,:)==4,25),DtARangeMAvgs5(theSelectedPplAIC(2,:)==4,975)]','color',[.5,.5,.5])
plot([IndFit(theSelectedPplAIC(2,:)==6,1)-AvgFit(theSelectedPplAIC(2,:)==6,3)],[IndFit(theSelectedPplAIC(2,:)==6,3)/5-AvgFit(theSelectedPplAIC(2,:)==6,3)],'dk','Linewidth',1, 'Markersize', 8)
plot([IndFit(theSelectedPplAIC(2,:)==6,1)-AvgFit(theSelectedPplAIC(2,:)==6,3),IndFit(theSelectedPplAIC(2,:)==6,1)-AvgFit(theSelectedPplAIC(2,:)==6,3)]',[DtARangeMAvgs5(theSelectedPplAIC(2,:)==4,25),DtARangeMAvgs5(theSelectedPplAIC(2,:)==4,975)]','color',[.5,.5,.5])

plot([-6,6],[0,0],'--k'); plot([0,0],[-6,6],'--k')
axis([-6,6,-6,6])
    set(gca,'fontsize', 14)

set(gcf,'Units','Inches');
    set(gcf,'Position',[9.4306    5.3611   11.1806    8.2083])

pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
else
    open('Fig4.fig')

end
%saveas(gcf,['Fig4.pdf'])

%% Figure 5- Showing the Predictions of Best Fit Sim Model vs True Value
figure(5)
for N=2:3
    %ATD Percieved 1 of N
    subplot(2,4,1+2*(N-2));
    hold on
    colormod=Pallet{N,1};
    pplFind=theSelectedPplAIC(N-1,:)==1 | theSelectedPplAIC(N-1,:)==3 ;
        h(N)=errorbar([0,1,6],nanmean(Ind(pplFind,:,N),1),nanstd(Ind(pplFind,:,N),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
errorbar([0.1,1.1,6.1], mean(AtDFitN(pplFind,:,N-1)), std(AtDFitN(pplFind,:,N-1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    hold on
colormod=Pallet{1,1};
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
errorbar([0.1,1.1,6.1], mean(AtDFit1(pplFind,:,1)), std(AtDFit1(pplFind,:,1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize',8);

    subplot(2,4,5+2*(N-2));
    hold on;
        colormod=Pallet{N,1};

    errorbar([0,1,6],nanmean(Avg(pplFind,:,N),1),nanstd(Avg(pplFind,:,N),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

    errorbar([0.1,1.1,6.1], mean(AtDFitAvg(pplFind,:,N-1)), std(AtDFitAvg(pplFind,:,N-1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    hold on
colormod=Pallet{1,1};h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

errorbar([0.1,1.1,6.1], mean(AtDFit1(pplFind,:,1)), std(AtDFit1(pplFind,:,1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    hold on;
    axis([-.5,6.6,0,55]);
        xlabel('Delay Time (sec)');

    set(gca,'fontsize', 12)
    
    
end

% Atd Mean of 2
subplot(2,4,5)
ylabel({'Computed Mean Error'; 'Variance (deg^2)'})

%
subplot(2,4,1)
pplFind= theSelectedPplAIC(1,:)==1 | theSelectedPplAIC(1,:)==3 ;

title({'Set Size 2';'AtD Best'; ['Subjs= ' num2str(sum(pplFind))]})
hold on
ylabel({'Percieved Point Error';' Variance (deg^2)'})
set(gca, 'fontsize', 12)
axis([-.5,6.5,0,75])
subplot(2,4,3)
pplFind=theSelectedPplAIC(2,:)==1 | theSelectedPplAIC(2,:)==3;
title({'Set Size 5';'AtD Best'; ['Subjs= ' num2str(sum(pplFind))]})
axis([-.5,6.5,0,150])
%
set(gca,'fontsize', 12)

% DtA best


for N=2:3
    %DtA 1 of N
    subplot(2,4,2+2*(N-2));
    hold on
    colormod=Pallet{N,1};
    pplFind=theSelectedPplAIC(N-1,:)==2 | theSelectedPplAIC(N-1,:)==4 ;
    errorbar([-0.1,.9,5.9], mean(DtAFitN(pplFind,:,N-1)), std(DtAFitN(pplFind,:,N-1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    h(N)=errorbar([0,1,6],nanmean(Ind(pplFind,:,N),1),nanstd(Ind(pplFind,:,N),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    colormod=Pallet{1,1};

    hold on
    
errorbar([-0.1,.9,5.9], mean(DtAFit1(pplFind,:,1)), std(DtAFit1(pplFind,:,1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

    %DtA 1/1 and Avg
    subplot(2,4,6+2*(N-2));
    hold on;
       colormod=Pallet{N,1};
    errorbar([-0.1,.9,5.9], mean(DtAFitAvg(pplFind,:,N-1)), std(DtAFitAvg(pplFind,:,N-1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    errorbar([0,1,6],nanmean(Avg(pplFind,:,N),1),nanstd(Avg(pplFind,:,N),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
        colormod=Pallet{1,1};
    hold on
errorbar([-0.1,.9,5.9], mean(DtAFit1(pplFind,:,1)), std(DtAFit1(pplFind,:,1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

    hold on;
    axis([-.5,6.5,0,55]);
    xlabel('Delay Time (sec)');
    set(gca,'fontsize', 12)
    
    
end
subplot(2,4,6)


%legend(' AtD fit Avg', 'DtA fit Avg', 'Mean of 2' ,'AtD fit', 'DtA fit','1 of 1','Location','NW')
%legend boxoff
subplot(2,4,2)
pplFind=theSelectedPplAIC(1,:)==2 | theSelectedPplAIC(1,:)==4;
title({'Set Size 2';'DtA Best'; ['Subjs= ' num2str(sum(pplFind))]})

set(gca, 'fontsize', 12)
axis([-.5,6.5,0,75])
%legend( 'AtD fit', 'DtA fit', '1 of 2', 'Location', 'NW');
%legend boxoff
%
subplot(2,4,4)
hold on
pplFind=theSelectedPplAIC(2,:)==2 | theSelectedPplAIC(2,:)==4;

title({'Set Size 5'; 'DtA Best'; ['Subjs= ' num2str(sum(pplFind))]})
set(gca,'fontsize', 12)
axis([-.5,6.5,0,150])

subplot(2,4,8)

axis([-.5,6.5,0,55])


set(gcf,'Units','Inches');
set(gcf,'Position',[9.4306    7.3056   13.5278    6.2639]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
 saveas(gcf,['Fig5.pdf'])
 
 %% Summary numbers of fits Simul (Needs work to include bad fits)

% LL comparisons 
sumLogLikeAtDAtD2=sum(LL2(theSelectedPpl(1,:)==1,1))
sumLogLikeAtDDtA2=sum(LL2(theSelectedPpl(1,:)==1,2))
sumLogLikeDtAAtD2=sum(LL2(theSelectedPpl(1,:)==2,1))
sumLogLikeDtADtA2=sum(LL2(theSelectedPpl(1,:)==2,2))

sumLogLikeAtDAtD5=sum(LL5(theSelectedPpl(2,:)==1,1))
sumLogLikeAtDDtA5=sum(LL5(theSelectedPpl(2,:)==1,2))
sumLogLikeDtAAtD5=sum(LL5(theSelectedPpl(2,:)==2,1))
sumLogLikeDtADtA5=sum(LL5(theSelectedPpl(2,:)==2,2))
% Summary Param
MeanAtDParam2=mean(AtD2Param(theSelectedPpl(1,:)==1,:))
MeanAtDParam5=mean(AtD5Param(theSelectedPpl(2,:)==1,:))
MeanDtAParam2=mean(DtA2Param(theSelectedPpl(1,:)==2,:))
MeanDtAParam5=mean(DtA5Param(theSelectedPpl(2,:)==2,:))
NumAtD2=sum(theSelectedPpl(1,:)==1);
NumAtD5=sum(theSelectedPpl(2,:)==1);
NumDtA2=sum(theSelectedPpl(1,:)==2);
NumDtA5=sum(theSelectedPpl(2,:)==2);
StDAtDParam2=std(AtD2Param(theSelectedPpl(1,:)==1,:))/sqrt(NumAtD2)
StDAtDParam5=std(AtD5Param(theSelectedPpl(2,:)==1,:))/sqrt(NumAtD5)
StDDtAParam2=std(DtA2Param(theSelectedPpl(1,:)==2,:))/sqrt(NumDtA2)
StDDtAParam5=std(DtA5Param(theSelectedPpl(2,:)==2,:))/sqrt(NumDtA5)
%% Figure 6- is one strategy more likely?
%Checking to see if significantly more likely to use one strat than other in each set size and plot

pplOfInt=theSelectedPplMF(:,:)<3;
LLDiff2=LL2(pplOfInt(1,:),1)-LL2(pplOfInt(1,:),2);
LLDiff5=LL5(pplOfInt(2,:),1)-LL5(pplOfInt(2,:),2);
 Sim2SignRank=signrank(LLDiff2)
 Sim5SignRank=signrank(LLDiff5)
 
 doublePpl=pplOfInt(1,:) & pplOfInt(2,:);
 RankSum2vs5=ranksum([LL2(doublePpl,1)-LL2(doublePpl,2)],[LL5(doublePpl,1)-LL5(doublePpl,2)])

 figure(6)
 plot(repmat([1,2],size(LL2(doublePpl,1)-LL2(doublePpl,2)))',[LL2(doublePpl,1)-LL2(doublePpl,2),LL5(doublePpl,1)-LL5(doublePpl,2)]','color', [.65,.65,.65]);
 hold on
 plot(repmat(1,size(LLDiff2)),LLDiff2,'o','MarkerFaceColor',Pallet{2,1},'color', Pallet{2,1}, 'Markersize', 8)
 plot([.75,1.25],[median(LLDiff2),median(LLDiff2)], ':', 'color', Pallet{2,1}, 'Linewidth',5);
 hold on
 plot(repmat(2,size(LLDiff5)),LLDiff5,'o','MarkerFaceColor',Pallet{3,1},'color', Pallet{3,1}, 'Markersize', 8)
 plot([1.75,2.25],[median(LLDiff5),median(LLDiff5)], '-', 'color', Pallet{3,1}, 'Linewidth',5);
 plot([0,3],[0,0],'--k');
 ylabel({['\Delta Log Likilihood'],['']})
 
 set(gca,'xtick', [1,2])
 axis([0,3,-13,8]);
 set(gca, 'xticklabel',{'Set Size 2','Set Size 5'})
 set(gca, 'Fontsize',18)
 set(gcf,'Units','Inches');
 pos = get(gcf,'Position');
 set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
  saveas(gcf,['Fig6.pdf'])

%% Sequential 
%% Preparing for figure 7, showing bias and variance across Seq conditions
%Calculate Bias
AvgMNBIAS=nans(17,3,3);
IndMNBIAS=nans(17,3,3);
AvgSeqMNBIAS=nans(17,3,3);
IndEMNBIAS=nans(17,3,3);
IndLMNBIAS=nans(17,3,3);

for sub=[1:17]
    for N=1:3
        if N>1
        AvgMNBIAS(sub,:,N)=totalMnHolder{sub,3}(:,N,2);
        AvgSeqMNBIAS(sub,:,N)=totalMnHolder{sub,6}(:,N,2);
        IndEMNBIAS(sub,:,N)=totalMnHolder{sub,5}(:,N,1);
        IndLMNBIAS(sub,:,N)=totalMnHolder{sub,8}(:,N,1);

        end
        IndMNBIAS(sub,:,N)=totalMnHolder{sub,2}(:,N,1);
    end
end

%Calculate Variance
   IndEarly=nans(size(totalVarHolder,1),3,3);
IndLate=nans(size(totalVarHolder,1),3,3);
AvgSeq=nans(size(totalVarHolder,1),3,3);

for sub=[1:17]
    for N=2:3
        AvgSeq(sub,:,N)=totalVarHolder{sub,6}(:,N,2);
        IndEarly(sub,:,N)=totalVarHolder{sub,5}(:,N,1);
        IndLate(sub,:,N)=totalVarHolder{sub,8}(:,N,1);
        
    end
end


 %% Figure 7- Average Bias and Variance for seq
   

figure(7)


%Precision in Seq early
subplot(2,3,4)


hold on
title({'Imprecision In Report of:';' Early Percieved Point'})

colormod=Pallet{1,1};
h(1)=errorbar([0,1,6],nanmean(Ind(:,:,1),1),nanstd(Ind(:,:,1),1)/sqrt(sum(~isnan(Ind(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
subplot(2,3,5)


subplot(2,3,6)
hold on
title({'Imprecision In Report of:'; 'A Sequential Computed Average'})

h(4)=errorbar([0,1,6],nanmean(Ind(:,:,1),1),nanstd(Ind(:,:,1),1)/sqrt(sum(~isnan(Ind(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);

for N=2:3
    %Precision early
    hold on
    subplot(2,3,4);
    colormod=Pallet{N,1};
    h(N)=errorbar([1,6],nanmean(IndEarly(:,2:3,N),1),nanstd(IndEarly(:,2:3,N),1)/sqrt(size(IndEarly,1)),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize',8);
    axis([-.5,6.5,0,90]);
    xlabel('Delay Time (sec)');
  ylabel('Variance (deg^2)');
  set(gca,'fontsize', 12)
  
      hold on
      %Precision Late
      
    subplot(2,3,5);
    title({'Imrecision In Report of:';' Late Percieved Point'})

    hold on
    colormod=Pallet{N,1};
    h(N)=errorbar([.5,3],nanmean(IndLate(:,2:3,N),1),nanstd(IndLate(:,2:3,N),1)/sqrt(size(IndLate,1)),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8);
    axis([-.5,6.5,0,90]);
    xlabel('Delay Time (sec)');
    set(gca,'fontsize', 12)

    %Precison Mean
    subplot(2,3,6);
    hold on;
    
    errorbar([1,6],nanmean(AvgSeq(:,2:3,N),1),nanstd(AvgSeq(:,2:3,N),1)/sqrt(sum(~isnan(AvgSeq(:,1)))),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8)
    
    hold on;
    axis([-.5,6.5,0,90]);
    xlabel('Delay Time (sec)');

    set(gca,'fontsize', 12)

    %Bias Early

    hold on
    subplot(2,3,1);
    title({'Bias In Report of:';' Early Percieved Point'})

    hold on
    colormod=Pallet{N,1};
    h(N)=errorbar([1,6],nanmean(IndEMNBIAS(:,2:3,N),1),nanstd(IndEMNBIAS(:,2:3,N),1)/sqrt(size(IndEMNBIAS,1)),'o','color', colormod, 'Markersize', 8);
    ylabel({['Mean Error (deg)'],[' ']});
    plot([-.5,6.5],[0,0],'--k');
axis([-0.5,6.5,-2.5,2.5])
  set(gca,'fontsize', 12)
  
      %Bias Late

    hold on
    subplot(2,3,2);
        title({'Bias In Report of:';' Late Percieved Point'})

    hold on
    colormod=Pallet{N,1};
    h(N)=errorbar([.5,3],nanmean(IndLMNBIAS(:,2:3,N),1),nanstd(IndLMNBIAS(:,2:3,N),1)/sqrt(size(IndLMNBIAS,1)),'o','color', colormod, 'Markersize', 8);
    ylabel({['Mean Error (deg)'],[' ']});
    plot([-.5,6.5],[0,0],'--k');
axis([-0.5,6.5,-2.5,2.5])
  set(gca,'fontsize', 12)
  
  
    subplot(2,3,3);
        title({'Bias In Report of:'; 'A Sequential Computed Average'})
    ylabel({['Mean Error (deg)'],['']});
    hold on;
  
    errorbar([0,1,6],nanmean(AvgSeqMNBIAS(:,:,N),1),nanstd(AvgSeqMNBIAS(:,:,N),1)/sqrt(size(IndLMNBIAS,1)),'o','color', colormod, 'Markersize', 8)
    
    hold on;
    plot([-.5,6.5],[0,0],'--k');
axis([-0.5,6.5,-2.5,2.5])

    set(gca,'fontsize', 12)
    
end
subplot(2,3,3)
colormod=Pallet{2,1};
N=2;
    errorbar([0,1,6],nanmean(AvgSeqMNBIAS(:,:,N),1),nanstd(AvgSeqMNBIAS(:,:,N),1)/sqrt(size(IndLMNBIAS,1)),'o','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 8)


subplot(2,3,4)
legend ({'Set Size 1', 'Set Size 2', 'Set Size 5'}, 'Location','NW')

set(gcf,'Units','Inches');
set(gcf,'Position',[5.0139    7.7361   12.1944    5.8333
]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
 saveas(gcf,['Fig7.pdf'])
%% Stats for Figure 7
%Bias stats
[a,b]=ttest(AvgSeqMNBIAS);
[c,d]=ttest(IndEMNBIAS);
[e,f]=ttest(IndLMNBIAS);
AvgSeqBiasStat=min(b(1,2:3,2:3)*27,1)
IndEarlyBiasStat=min(d(1,2:3,2:3)*27,1)
IndLateBiasStat=min(f(1,2:3,2:3)*27,1)

Sing=nans(size(totalVarHolder,1),3,3);
Avg=nans(size(totalVarHolder,1),3,3);
IndEarly=nans(size(totalVarHolder,1),3,3);
IndLate=nans(size(totalVarHolder,1),3,3);
AvgSeqVar=nans(size(totalVarHolder,1),3,3);
pts=[2,5];
for sub=1:17
    for N=1:3
        Ind(sub,:,N)=totalVarHolder{sub,2}(:,N,1);
        Avg(sub,:,N)=totalVarHolder{sub,3}(:,N,2);
        IndEarly(sub,:,N)=totalVarHolder{sub,5}(:,N,1);
        IndLate(sub,:,N)=totalVarHolder{sub,8}(:,N,1);
        AvgSeqVar(sub,:,N)=totalVarHolder{sub,6}(:,N,2);
        
        
    end
end
totalAvgSeq=[];
totalIndE=[];
totalIndL=[];
SubjectListSeq=[];
SubjectListLate=[];


%Variance Stats
DelayListSeq=[];
DelayListLate=[];
NumpListSeq=[];
NumpListLate=[];
for sub=1:17
    for delay=2:3
        for N=1:3
                SubjectListSeq=[SubjectListSeq;sub];
                if N==1;
                    totalAvgSeq=[totalAvgSeq;Ind(sub,delay,N)];
                    totalIndE=[totalIndE;Ind(sub,delay,N)];

                else
                    totalIndE=[totalIndE;IndEarly(sub,delay,N)];
                    totalIndL=[totalIndL;IndLate(sub,delay,N)];
                SubjectListLate=[SubjectListLate;sub];
DelayListLate=[DelayListLate;delay];
NumpListLate=[NumpListLate;N];
                    totalAvgSeq=[totalAvgSeq;AvgSeqVar(sub,delay,N)];
                end
                DelayListSeq=[DelayListSeq;delay];
                NumpListSeq=[NumpListSeq;N];
            
        end
    end
    
end
FACTNAMES={'Delay', 'Nump'};
statsEarly = rm_anova2(totalIndE,SubjectListSeq,DelayListSeq,NumpListSeq,FACTNAMES)
statsLate = rm_anova2(totalIndL,SubjectListLate,DelayListLate,NumpListLate,FACTNAMES)
statsAvgSeq = rm_anova2(totalAvgSeq,SubjectListSeq,DelayListSeq,NumpListSeq,FACTNAMES)
%% Fitting Data to AtD and DtA models Seq
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
            
            
            [~,theSelectedPpl_seq(1,sub)]=min([negLL_2seq(sub,1),negLL_2seq(sub,2)]);
            [~,theSelectedPpl_seq(2,sub)]=min([negLL_5seq(sub,1),negLL_5seq(sub,2)]);
            
            [~,theSelectedPpl_seqFirst(1,sub)]=min([negLL_2seq(sub,1),negLL_2seq(sub,2)]);
            [~,theSelectedPpl_seqFirst(2,sub)]=min([negLL_5seq(sub,1),negLL_5seq(sub,2)]);
       
        
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


%% Summary Data for fits Seq (needs work to include "bad fits"
% 
% sumLogLikeAtDAtD_seq2=sum(negLL_2seq(theSelectedPpl_seqFirst(1,:)==1,1))
% sumLogLikeAtDDtA_seq2=sum(negLL_2seq(theSelectedPpl_seqFirst(1,:)==1,2))
% diff2AtD=sumLogLikeAtDAtD_seq2-sumLogLikeAtDDtA_seq2
% sumLogLikeDtAAtD_seq2=sum(negLL_2seq(theSelectedPpl_seqFirst(1,:)==2,1))
% sumLogLikeDtADtA_seq2=sum(negLL_2seq(theSelectedPpl_seqFirst(1,:)==2,2))
% diff2DtA=sumLogLikeDtADtA_seq2-sumLogLikeDtAAtD_seq2
% 
% sumLogLikeAtDAtD_seq5=sum(negLL_5seq(theSelectedPpl_seqFirst(2,:)==1,1))
% sumLogLikeAtDDtA_seq5=sum(negLL_5seq(theSelectedPpl_seqFirst(2,:)==1,2))
% diff5AtD=sumLogLikeAtDAtD_seq5-sumLogLikeAtDDtA_seq5
% sumLogLikeDtAAtD_seq5=sum(negLL_5seq(theSelectedPpl_seqFirst(2,:)==2,1))
% sumLogLikeDtADtA_seq5=sum(negLL_5seq(theSelectedPpl_seqFirst(2,:)==2,2))
% diff5DtA=sumLogLikeDtADtA_seq5-sumLogLikeDtAAtD_seq5
% Summary Param Seq
MeanAtDParam2seq=mean(AtDParam2Seq(theSelectedPpl_seqFirst(1,:)==1,:))
MeanAtDParam5seq=mean(AtDParam5Seq(theSelectedPpl_seqFirst(2,:)==1,:))
MeanDtAParam2seq=mean(DtAParam2Seq(theSelectedPpl_seqFirst(1,:)==2,:))
MeanDtAParam5seq=mean(DtAParam5Seq(theSelectedPpl_seqFirst(2,:)==2,:))
NumAtD2seq=sum(theSelectedPpl_seqFirst(1,:)==1)
NumAtD5seq=sum(theSelectedPpl_seqFirst(2,:)==1)
NumDtA2seq=sum(theSelectedPpl_seqFirst(1,:)==2)
NumDtA5seq=sum(theSelectedPpl_seqFirst(2,:)==2)
StDAtDParam2seq=std(AtDParam2Seq(theSelectedPpl_seqFirst(1,:)==1,:))/sqrt(NumAtD2seq)
StDAtDParam5seq=std(AtDParam5Seq(theSelectedPpl_seqFirst(2,:)==1,:))/sqrt(NumAtD5seq)
StDDtAParam2seq=std(DtAParam2Seq(theSelectedPpl_seqFirst(1,:)==2,:))/sqrt(NumDtA2seq)
StDDtAParam5seq=std(DtAParam5Seq(theSelectedPpl_seqFirst(2,:)==2,:))/sqrt(NumDtA5seq)


%% Check to see if in range Seq


SetSize=[1,2,5];
 AtDCorrectIdentSeq=zeros(17,2);
 DtACorrectIdentSeq=zeros(17,2);
delays=[0,1,6];
nReps=100;
checkrangeseq=0;
if checkrangeseq
    
for N=2:3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    for sub=1:17
        
      if ismember(sub,[1,6,13,14,17])
            nReps=50;
        else
            nReps=100;
        end
        
        for trials=1:1000
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
            
                [ PtsErrSIMAtD, AvgSIMAtD, PtsErrSeqESimAtD, PtsErrSeqLSimAtD] = GenIndAvgAtDSeq(params1,SetSize(N), nReps, PtsErr(:,1), PtsErrEarlySeq(2:3,N),PtsErrLateSeq(2:3,N), AvgSeqPts(2:3,N) );
                [ PtsErrSIMDtA, AvgSIMDtA, PtsErrSeqESimDtA, PtsErrSeqLSimDtA ] = GenIndAvgDtASeq(params2,SetSize(N), nReps,  PtsErr(:,1), PtsErrEarlySeq(2:3,N),PtsErrLateSeq(2:3,N), AvgSeqPts(2:3,N));
            
            %AtD refit
                [a3,a4]=LLAtDSeq_N_Freer(PtsErrSIMAtD,AvgSIMAtD(:,2,2),PtsErrSeqESimAtD(:,1),PtsErrSeqLSimAtD(:,1),SetSize(N));
                [a5,a6]=LLDtASeq_N_Free(PtsErrSIMAtD,AvgSIMAtD(:,2,2),PtsErrSeqESimAtD(:,1),PtsErrSeqLSimAtD(:,1),SetSize(N));
                
                if a3<a5
                    AtDCorrectIdentSeq(sub,N-1)=AtDCorrectIdentSeq(sub,N-1)+1;
                end
                
                
                                            
       
                
                %DtA refit
                [a7,a8]=LLAtDSeq_N_Freer(PtsErrSIMDtA,AvgSIMDtA(:,2,2),PtsErrSeqESimDtA(:,1),PtsErrSeqLSimDtA(:,1), SetSize(N));
                [a9,a10]=LLDtASeq_N_Free(PtsErrSIMDtA,AvgSIMDtA(:,2,2),PtsErrSeqESimDtA(:,1),PtsErrSeqLSimDtA(:,1), SetSize(N));
                
                if a9<a7
                    DtACorrectIdentSeq(sub,N-1)=DtACorrectIdentSeq(sub,N-1)+1;
                end
            
            
                
                
                
            for d=1:length(delays)
                if d==1
                                    vAtD1(d)=var(PtsErrSIMAtD{d,1});
                vDtA1(d)=var(PtsErrSIMDtA{d,1});

                else
                                                   vAtD1(d)=var(PtsErrSIMAtD{d,1});
                vDtA1(d)=var(PtsErrSIMDtA{d,1});
                vAtDE(d)=var(PtsErrSeqESimAtD{d-1,1});
                vAtDL(d)=var(PtsErrSeqLSimAtD{d-1,1});
                vAtDA(d)=var(AvgSIMAtD{d-1,2,2});
                
                vDtAE(d)=var(PtsErrSeqESimDtA{d-1,1});
                vDtAL(d)=var(PtsErrSeqLSimDtA{d-1,1});
                vDtAA(d)=var(AvgSIMDtA{d-1,2,2});
                end
                
            end
            
            
            
            
            
            
            x=delays(1:end);
            y=vAtD1;
            options = optimset('Display','off','MaxFunEvals',5000);
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            Mean1SlopeAtD=nonbooty(1);
            x=delays(2:end);
            y=vAtDE(1,2:3);
           
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNESlopeAtD=nonbooty(1);
            x=delays(2:end)/2;
                        y=vAtDL(1,2:3);
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNLSlopeAtD=nonbooty(1);
            
            
            x=delays(2:end);
            y=vAtDA(1,2:3);
            
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanASlopeAtD=nonbooty(1);
            x=delays(1:end);
            y=vDtA1;
            
            %
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            Mean1SlopeDtA=nonbooty(1);
            x=delays(2:end);
            y=vDtAE(1,2:3);
            %
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNESlopeDtA=nonbooty(1);
            
            x=delays(2:end)/2;
            y=vDtAL(1,2:3);
            %
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanNLSlopeDtA=nonbooty(1);
            x=delays(2:end);
            y=vDtAA(1,2:3);
            
            findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
            nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
            
            MeanASlopeDtA=nonbooty(1);
            
             AtDRangeNAvgSeq(sub,trials,N-1)=(.5*MeanNLSlopeAtD+(SetSize(N)-1)*MeanNESlopeAtD)/SetSize(N)^2-MeanASlopeAtD;
             AtDRange1AvgSeq(sub,trials,N-1)=((SetSize(N)-1)/SetSize(N))^2*.5*Mean1SlopeAtD+.5*Mean1SlopeAtD-(MeanASlopeAtD);
             DtARangeNAvgSeq(sub,trials,N-1)=(.5*MeanNLSlopeDtA+(SetSize(N)-1)*MeanNESlopeDtA)/SetSize(N)^2-MeanASlopeDtA;
             DtARange1AvgSeq(sub,trials,N-1)=((SetSize(N)-1)/SetSize(N))^2*.5*Mean1SlopeDtA+.5*Mean1SlopeDtA-(MeanASlopeDtA);
        end
     disp(sub)   
    end
    
end
else
    load('ConfidenceAndConfusion.mat');
end
disp('DONE!')



%% If outside of 95% expected range, check without MF assumption Seq
listOfMehSeq={[],[]};
partials=[5/8,.82];
for sub=1:17
    for N=1:2
    inrangeDtASeq(sub,N)=sum(DtARangeNAvgSeq(sub,:,N)<(.5*IndLateFit(sub,N+1)+(SetSize(N)-1)*IndEarlyFit(sub,N+1))/SetSize(N)^2-AvgSeqFit(sub,N+1));
    inrangeAtDSeq(sub,N)=sum(AtDRange1AvgSeq(sub,:,N)<partials(N)*IndFit(sub,1)-AvgSeqFit(sub,N+1));

    if ((inrangeDtASeq(sub,N)<25 || inrangeDtASeq(sub,N)>975) && theSelectedPpl_seq(N,sub)==2) || ((inrangeAtDSeq(sub,N)<25 || inrangeAtDSeq(sub,N)>975) && theSelectedPpl_seq(N,sub)==1)
   listOfMehSeq{N}=[listOfMehSeq{N},sub];
        PtsErr=totalResp{sub,2}(:,:,1);
        
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
        
       
        factor=2;%log(parttrials2);
        factor2=2;%log(parttrials5);     
if N==1
       [ negLL_2seq(sub,3), AtDParam2SeqNoA(sub,:) ] = LLAtDSeq_N_NoA(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
       [ negLL_2seq(sub,4), AtDParam2SeqFreeW(sub,:) ] = LLAtDSeq_N_Free_Weighting(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
              [ negLL_2seq(sub,5), DtAParam2SeqNoA(sub,:) ] = LLDtASeq_N_NoA(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
       [ negLL_2seq(sub,6), DtAParam2SeqFreeW(sub,:) ] = LLDtASeq_N_Free_Weighting(PtsErr(:,1),AvgSeqPts(2:3,2),PtsErrEarlySeq(2:3,2),PtsErrLateSeq(2:3,2),2 );
       
               AIC2seq(sub,1)=6*factor+2*negLL_2seq(sub,1);
        AIC2seq(sub,2)=6*factor+2*negLL_2seq(sub,2);
       
       AIC2seq(sub,3)=7*factor+2*negLL_2seq(sub,3);
        AIC2seq(sub,4)=7*factor+2*negLL_2seq(sub,4);
               AIC2seq(sub,5)=7*factor+2*negLL_2seq(sub,5);
        AIC2seq(sub,6)=7*factor+2*negLL_2seq(sub,6);
       [~,theSelectedPpl_seq(1,sub)]=min([AIC2seq(sub,1),AIC2seq(sub,2),AIC2seq(sub,3),AIC2seq(sub,4),AIC2seq(sub,5),AIC2seq(sub,6)])

else
    
            [ negLL_5seq(sub,3), AtDParam5SeqNoA(sub,:) ] = LLAtDSeq_N_NoA(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
            [ negLL_5seq(sub,4), AtDParam5SeqFreeW(sub,:) ] = LLAtDSeq_N_Free_Weighting(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
                   [ negLL_5seq(sub,5), DtAParam5SeqNoA(sub,:) ] = LLDtASeq_N_NoA(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
            [ negLL_5seq(sub,6), DtAParam5SeqFreeW(sub,:) ] = LLDtASeq_N_Free_Weighting(PtsErr(:,1),AvgSeqPts(2:3,3),PtsErrEarlySeq(2:3,3),PtsErrLateSeq(2:3,3),5 );
       
               AIC5seq(sub,1)=6*factor+2*negLL_5seq(sub,1);
        AIC5seq(sub,2)=6*factor+2*negLL_5seq(sub,2);
       
       AIC5seq(sub,3)=7*factor+2*negLL_5seq(sub,3);
        AIC5seq(sub,4)=7*factor+2*negLL_5seq(sub,4);
               AIC5seq(sub,5)=7*factor+2*negLL_5seq(sub,5);
        AIC5seq(sub,6)=7*factor+2*negLL_5seq(sub,6);
       [~,theSelectedPpl_seq(2,sub)]=min([AIC5seq(sub,1),AIC5seq(sub,2),AIC5seq(sub,3),AIC5seq(sub,4) ,AIC5seq(sub,5),AIC5seq(sub,6)])
       
end

 theSelectedPpl_seq(N,sub)=theSelectedPpl_seq(N,sub)+2;
 disp(sub)
    end
    end
end

% %% If STILL outside of 95% expected range, note by plus2 Seq
%  for N=1:2
%      for sub=listOfMehSeq{N}
%    
%     inrangeDtA(sub,N)=sum(DtARangeNAvgSeq(sub,:,N)<(.5*IndLateFit(sub,N+1)+(SetSize(N)-1)*IndEarlyFit(sub,N+1))/SetSize(N)^2-AvgSeqFit(sub,N+1));
%     inrangeAtD(sub,N)=sum(AtDRange1AvgSeq(sub,:,N)<partials(N)*IndFit(sub,1)-AvgSeqFit(sub,N+1));
%     if ((inrangeDtA(sub,N)<50 || inrangeDtA(sub,N)>975) && theSelectedPpl_seq(N,sub)==4) || ((inrangeAtD(sub,N)<50 || inrangeAtD(sub,N)>975) && theSelectedPpl_seq(N,sub)==3)
%         disp(sub);
%    
%         
%             theSelectedPpl_seq(N,sub)=theSelectedPpl_seq(N,sub)+2
%        
% end
%     end
%     end
%% Probability of True|Identified=P(Identified|True)*P(True)/P(Identified across all Possible) Seq
for sub=1:17
for N=1:2
if isempty(find(listOfMehSeq{1,N}==sub))
    if theSelectedPpl_seq(N,sub)==1
        ProbAtDGIVENidentSeq(sub,N)=AtDCorrectIdentSeq(sub,N)/1000*.5/(AtDCorrectIdentSeq(sub,N)/1000*.5+(1-(DtACorrectIdentSeq(sub,N)/1000))*.5);
    elseif theSelectedPpl_seq(N,sub)==2
        ProbDtAGIVENidentSeq(sub,N)=DtACorrectIdentSeq(sub,N)/1000*.5/(DtACorrectIdentSeq(sub,N)/1000*.5+(1-(AtDCorrectIdentSeq(sub,N)/1000))*.5);

    end
end
end
end



%% Figure 8- PLot (for AtD and DtA) predictions and sims vs true

DtARangeMAvgSeqs2=sort(DtARangeNAvgSeq(:,:,1),2);
AtDRange1AvgSeqs2=sort(AtDRange1AvgSeq(:,:,1),2);
if genFromScratch
figure(8)
subplot(2,2,1)
hold on
title({'Set Size 2: Sequential','AtD subjects'})
ylabel({['$$(.5*\hat{\sigma}_{2L}^2+\hat{\sigma}_{2E}^2 )/4- \hat{\sigma}_{M2-Seq}^2$$'],['(DtA predicts zero)']},'Interpreter','Latex','fontweight','bold')
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==1,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2)],[(.5*IndLateFit(theSelectedPpl_seq(1,:)==1,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==1,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2)],'sk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==3,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==3,2)],[(.5*IndLateFit(theSelectedPpl_seq(1,:)==3,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==3,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==3,2)],'sk','Linewidth',1,'Markersize', 8)
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==5,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==5,2)],[(.5*IndLateFit(theSelectedPpl_seq(1,:)==5,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==5,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==5,2)],'sk','Linewidth',1,'Markersize', 8)
plot([AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==1,25),AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==1,975)]',[(.5*IndLateFit(theSelectedPpl_seq(1,:)==1,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==1,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2),(.5*IndLateFit(theSelectedPpl_seq(1,:)==1,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==1,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==1,2)]','color',[.5,.5,.5])
plot([AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==3,25),AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==3,975)]',[(.5*IndLateFit(theSelectedPpl_seq(1,:)==3,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==3,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==3,2),(.5*IndLateFit(theSelectedPpl_seq(1,:)==3,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==3,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==3,2)]','color',[.5,.5,.5])
plot([AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==5,25),AtDRange1AvgSeqs2(theSelectedPpl_seq(1,:)==5,975)]',[(.5*IndLateFit(theSelectedPpl_seq(1,:)==5,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==5,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==5,2),(.5*IndLateFit(theSelectedPpl_seq(1,:)==5,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==5,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==5,2)]','color',[.5,.5,.5])
xlabel('$$5/8*\hat{\sigma}_1^2 - \hat{\sigma}_{M2-seq}^2$$','Interpreter','Latex','fontweight','bold' )
plot([-8,8],[0,0],'--k'); plot([0,0],[-8,8],'--k')
 axis([-8,8,-8,8])
    set(gca,'fontsize', 12)
    legend('AtD Well Fit','Simulated 95% CI','Location','NW')
%
    subplot(2,2,2)
hold on
title({'Set Size 2: Sequential ','DtA subjects'})

xlabel('$$5/8*\hat{\sigma}_1^2 - \hat{\sigma}_{M2-seq}^2$$','Interpreter','Latex','fontweight','bold' )
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2)],[(.5*IndLateFit(theSelectedPpl_seq(1,:)==2,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==2,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2)],'dk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==4,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==4,2)],[(.5*IndLateFit(theSelectedPpl_seq(1,:)==4,2)+IndEarlyFit(theSelectedPpl_seq(1,:)==4,2))/4-AvgSeqFit(theSelectedPpl_seq(1,:)==4,2)],'d','color',[.75,.75,.75],'Linewidth',1,'MarkerFaceColor',[.75,.75,.75],'Markersize', 8)
plot([5/8*IndFit(theSelectedPpl_seq(1,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2),5/8*IndFit(theSelectedPpl_seq(1,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(1,:)==2,2)]',[DtARangeMAvgSeqs2(theSelectedPpl_seq(1,:)==2,25),DtARangeMAvgSeqs2(theSelectedPpl_seq(1,:)==2,975)]','color',[.5,.5,.5]);
plot([-8,8],[0,0],'--k'); plot([0,0],[-8,8],'--k')
    set(gca,'fontsize', 12)
axis([-8,8,-8,8])
%     legend('DtA Well Fit','Simulated 95% CI','Location','NW')


figure(8)
subplot(2,2,3)
DtARangeMAvgSeqs5=sort(DtARangeNAvgSeq(:,:,2),2);
AtDRange1AvgSeqs5=sort(AtDRange1AvgSeq(:,:,2),2);
hold on
title({'Set Size 5: Sequential ','AtD subjects'})


ylabel({['$$(.5*\hat{\sigma}_{2L}^2+4*\hat{\sigma}_{2E}^2 )/25- \hat{\sigma}_{M2-seq}^2$$'],['(DtA predicts zero)']},'Interpreter','Latex','fontweight','bold' )
plot([.82*IndFit(theSelectedPpl_seq(2,:)==1,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3)],[(.5*IndLateFit(theSelectedPpl_seq(2,:)==1,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==1,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3)],'sk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([.82*IndFit(theSelectedPpl_seq(2,:)==3,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==3,3)],[(.5*IndLateFit(theSelectedPpl_seq(2,:)==3,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==3,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==3,3)],'s','color',[.75,.75,.75],'Linewidth',1,'MarkerFaceColor',[.75,.75,.75], 'Markersize', 8)
plot([AtDRange1AvgSeqs5(theSelectedPpl_seq(2,:)==1,25),AtDRange1AvgSeqs5(theSelectedPpl_seq(2,:)==1,975)]',[(.5*IndLateFit(theSelectedPpl_seq(2,:)==1,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==1,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3),(.5*IndLateFit(theSelectedPpl_seq(2,:)==1,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==1,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==1,3)]','color',[.5,.5,.5])
plot([AtDRange1AvgSeqs5(theSelectedPpl_seq(2,:)==3,25),AtDRange1AvgSeqs5(theSelectedPpl_seq(2,:)==3,975)]',[(.5*IndLateFit(theSelectedPpl_seq(2,:)==3,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==3,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==3,3),(.5*IndLateFit(theSelectedPpl_seq(2,:)==3,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==3,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==3,3)]','color',[.5,.5,.5])
 xlabel({['$$0.82*\hat{\sigma}_1^2 - \hat{\sigma}_{M5-seq}^2$$'],['(AtD predicts zero)']},'Interpreter','Latex','fontweight','bold' )
 plot([-8,8],[0,0],'--k'); plot([0,0],[-8,8],'--k')
    set(gca,'fontsize', 12)

 axis([-8,8,-8,8])

 subplot(2,2,4)
hold on
 xlabel({['$$0.82*\hat{\sigma}_1^2 - \hat{\sigma}_{M5-seq}^2$$'],['(AtD predicts zero)']},'Interpreter','Latex','fontweight','bold' )
title({'Set Size 5: Sequential ','DtA subjects'})

plot([.82*IndFit(theSelectedPpl_seq(2,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3)],[(.5*IndLateFit(theSelectedPpl_seq(2,:)==2,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==2,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3)],'dk','Linewidth',1,'MarkerFaceColor','k', 'Markersize', 8)
plot([.82*IndFit(theSelectedPpl_seq(2,:)==8,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3)],[(.5*IndLateFit(theSelectedPpl_seq(2,:)==8,3)+4*IndEarlyFit(theSelectedPpl_seq(2,:)==8,3))/25-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3)],'dk','Linewidth',1, 'Markersize', 8)
plot([.82*IndFit(theSelectedPpl_seq(2,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3),.82*IndFit(theSelectedPpl_seq(2,:)==2,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==2,3)]',[DtARangeMAvgSeqs5(theSelectedPpl_seq(2,:)==2,25),DtARangeMAvgSeqs5(theSelectedPpl_seq(2,:)==2,975)]','color',[.5,.5,.5]);

plot([.82*IndFit(theSelectedPpl_seq(2,:)==8,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3),.82*IndFit(theSelectedPpl_seq(2,:)==8,1)-AvgSeqFit(theSelectedPpl_seq(2,:)==8,3)]',[DtARangeMAvgSeqs5(theSelectedPpl_seq(2,:)==8,25),DtARangeMAvgSeqs5(theSelectedPpl_seq(2,:)==8,975)]','color',[.5,.5,.5]);
legend('DtA Well Fit', 'DtA Poor Fit','Simulated 95% CI','Location','NW');
plot([-8,8],[0,0],'--k'); plot([0,0],[-8,8],'--k')
axis([-8,8,-8,8])
    set(gca,'fontsize', 12)

set(gcf,'Units','Inches');
    set(gcf,'Position',[9.4306    5.3611   11.1806    8.2083])

pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
else
    open('Fig8.fig')
end
saveas(gcf,['Fig8.pdf'])
 %% Figure 9-Showing Predictions vs actual aggregate for variances
 clear h
 Sing=nans(size(totalVarHolder,1),3,3);
Avg=nans(size(totalVarHolder,1),3,3);
IndEarly=nans(size(totalVarHolder,1),3,3);
IndLate=nans(size(totalVarHolder,1),3,3);
AvgSeqVar=nans(size(totalVarHolder,1),3,3);
pts=[2,5];
for sub=1:17
    for N=1:3
        Ind(sub,:,N)=totalVarHolder{sub,2}(:,N,1);
        Avg(sub,:,N)=totalVarHolder{sub,3}(:,N,2);
        IndEarly(sub,:,N)=totalVarHolder{sub,5}(:,N,1);
        IndLate(sub,:,N)=totalVarHolder{sub,8}(:,N,1);
        AvgSeqVar(sub,:,N)=totalVarHolder{sub,6}(:,N,2);
        
        
    end
end



for N=2:3
    figure(9)
    %ATD Percieved 1 of N Early
    subplot(3,4,1+2*(N-2));
    hold on
        pplFind=theSelectedPpl_seq(N-1,:)==1 | theSelectedPpl_seq(N-1,:)==3 | theSelectedPpl_seq(N-1,:)==5;

    colormod=Pallet{N,1};
    errorbar([1.1,6.1], mean(AtDFitNEarlyseq(pplFind,2:3,N-1)), std(AtDFitNEarlyseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    h(N)=errorbar([1,6],nanmean(IndEarly(pplFind,2:3,N),1),nanstd(IndEarly(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
        set(gca,'fontsize', 12)
%AtD Percieved 1 of N Late
      subplot(3,4,5+2*(N-2));
      hold on
    errorbar([.6,3.1], mean(AtDFitNLateseq(pplFind,2:3,N-1)), std(AtDFitNLateseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5)  
    h(N)=errorbar([.5,3],nanmean(IndLate(pplFind,2:3,N),1),nanstd(IndLate(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5)
        axis([0,4,0,40]);

    set(gca,'fontsize', 12)

    %AtD Mean of N and 1/1
    subplot(3,4,9+2*(N-2));
    hold on;
    errorbar([1.1,6.1], mean(AtDFitAvgseq(pplFind,2:3,N-1)), std(AtDFitAvgseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    errorbar([1,6],nanmean(AvgSeqVar(pplFind,2:3,N),1),nanstd(AvgSeqVar(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    
    hold on;
    axis([-.5,6.6,0,50]);

    set(gca,'fontsize', 12)
    
    
end
%
%Atd Mean of 2
subplot(3,4,9)
colormod=Pallet{1,1};
        pplFind=theSelectedPpl_seq(1,:)==1 | theSelectedPpl_seq(1,:)==3 | theSelectedPpl_seq(1,:)==5;
ylabel({'Sequential Computed Mean Error'; 'Variance (deg^2)'})
         xlabel('Delay Time (sec)');

% title({'Mean of Two:';'AtD Best'});
hold on
errorbar([0.1,1.1,6.1], mean(AtDFit1seq(pplFind,:,1)), std(AtDFit1seq(pplFind,:,1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1)),nanstd(Ind(pplFind,:,1))/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    
    

subplot(3,4,1)
errorbar([0.1,1.1,6.1], mean(AtDFit1seq(pplFind,:,1)), std(AtDFit1seq(pplFind,:,1))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1)),nanstd(Ind(pplFind,:,1))/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    
line2=['Subjs= ' num2str(sum(pplFind))];
title({'Set Size 2'; 'AtD Best'; line2})
hold on
ylabel({'Early Percieved Point Error'; 'Variance (deg^2)'})
set(gca, 'fontsize', 12)
axis([-.5,6.5,0,70])

subplot(3,4,5)
ylabel({'Late Percieved Point Error'; 'Variance (deg^2)'})


subplot(3,4,3)
        pplFind=theSelectedPpl_seq(2,:)==1 | theSelectedPpl_seq(2,:)==3 | theSelectedPpl_seq(2,:)==5;

title({'Set Size 5'; 'AtD Best'; ['Subjs= ' num2str(sum(pplFind))]})
axis([-.5,6.5,0,70])
errorbar([0.1,1.1,6.1], mean(AtDFit1seq(pplFind,:,2)), std(AtDFit1(pplFind,:,2))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    
set(gca,'fontsize', 12)
subplot(3,4,11)
         xlabel('Delay Time (sec)');



errorbar([0.1,1.1,6.1], mean(AtDFit1seq(pplFind,:,2)), std(AtDFit1seq(pplFind,:,2))/sqrt(sum(pplFind)),'-','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(4)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'s','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
axis([-.5,6.5,0,50])
% DtA best

%
for N=2:3
    %DtA Early Percieved
    colormod=Pallet{N,1};
    subplot(3,4,2+2*(N-2));
    hold on
            pplFind=theSelectedPpl_seq(N-1,:)==2 | theSelectedPpl_seq(N-1,:)==4 | theSelectedPpl_seq(N-1,:)==6;

    errorbar([.9,5.9], mean(DtAFitNEarlyseq(pplFind,2:3,N-1)), std(DtAFitNEarlyseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    h(N)=errorbar([1,6],nanmean(IndEarly(pplFind,2:3,N),1),nanstd(IndEarly(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    set(gca,'fontsize', 12)
    axis([-.5,6.5,0,70])

%DtA Late Percieved
    subplot(3,4,6+2*(N-2));
    hold on
    errorbar([.4,2.9], mean(DtAFitNLateseq(pplFind,2:3,N-1)), std(DtAFitNLateseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    h(N)=errorbar([0.5,3],nanmean(IndLate(pplFind,2:3,N),1),nanstd(IndLate(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
            axis([0,4,0,40]);

    set(gca,'fontsize', 12)
%DtA Mean
    
    subplot(3,4,10+2*(N-2));
    hold on;
    errorbar([.9,5.9], mean(DtAFitAvgseq(pplFind,2:3,N-1)), std(DtAFitAvgseq(pplFind,2:3,N-1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    errorbar([1,6],nanmean(AvgSeqVar(pplFind,2:3,N),1),nanstd(AvgSeqVar(pplFind,2:3,N),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    
    hold on;
    axis([-.5,6.5,0,50]);
    set(gca,'fontsize', 12)
    
    
end
%DtA Mean set size 1 reference
subplot(3,4,10)
colormod=Pallet{1,1};
            pplFind=theSelectedPpl_seq(1,:)==2 | theSelectedPpl_seq(1,:)==4 | theSelectedPpl_seq(1,:)==6;

hold on
errorbar([-0.1,.9,5.9], mean(DtAFit1seq(pplFind,:,1)), std(DtAFit1seq(pplFind,:,1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
    xlabel('Delay Time (sec)');


subplot(3,4,2)
title({'Set Size 2'; 'DtA Best'; ['Subjs= ', num2str(sum(pplFind))]})
set(gca, 'fontsize', 12)
errorbar([-0.1,.9,5.9], mean(DtAFit1seq(pplFind,:,1)), std(DtAFit1seq(pplFind,:,1))/sqrt(sum(pplFind)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(1)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(pplFind)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);

%



subplot(3,4,4)
hold on
            pplFind=theSelectedPpl_seq(2,:)==2 | theSelectedPpl_seq(2,:)==4 | theSelectedPpl_seq(2,:)==6;

errorbar([-0.1,.9,5.9], mean(DtAFit1(pplFind,:,2)), std(DtAFit1(pplFind,:,2))/sqrt(sum(theSelectedPpl_seq(2,:)==1)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(4)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(theSelectedPpl_seq(2,:)==1)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);

title({'Set Size 5'; 'DtA Best';[' Subjs= ' num2str(sum(pplFind))]})
set(gca,'fontsize', 12)
axis([-.5,6.5,0,70])
%
subplot(3,4,12)
errorbar([-0.1,.9,5.9], mean(DtAFit1(pplFind,:,2)), std(DtAFit1(pplFind,:,2))/sqrt(sum(theSelectedPpl_seq(2,:)==1)),'--','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
h(4)=errorbar([0,1,6],nanmean(Ind(pplFind,:,1),1),nanstd(Ind(pplFind,:,1),1)/sqrt(sum(theSelectedPpl_seq(2,:)==1)),'d','MarkerFaceColor',colormod,'color', colormod, 'Markersize', 5);
        xlabel('Delay Time (sec)');


axis([-.5,6.5,0,50])

set(gca, 'Fontsize',12)
set(gcf,'Units','Inches');
set(gcf,'Position',[12.4583    3.0833   12.8333    9.0139]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
 saveas(gcf,['Fig9.pdf'])


%% Figure 10- is one strategy more likely?
%Checking to see if significantly more likely to use one strat than other in each set size and plot

pplOfInt=theSelectedPpl_seq(:,:)<3;
LLDiff2seq=negLL_2seq(pplOfInt(1,:),1)-negLL_2seq(pplOfInt(1,:),2);
LLDiff5seq=negLL_5seq(pplOfInt(2,:),1)-negLL_5seq(pplOfInt(2,:),2);
 Sim2SignRankseq=signrank(LLDiff2seq)
 Sim5SignRankseq=signrank(LLDiff5seq)
 
 doublePpl=pplOfInt(1,:) & pplOfInt(2,:);
 RankSum2vs5seq=ranksum([negLL_2seq(doublePpl,1)-negLL_2seq(doublePpl,2)],[negLL_5seq(doublePpl,1)-negLL_5seq(doublePpl,2)])


 figure(10)
  plot(repmat([1,2],size(negLL_2seq(doublePpl,1)-negLL_2seq(doublePpl,2)))',[negLL_2seq(doublePpl,1)-negLL_2seq(doublePpl,2),negLL_5seq(doublePpl,1)-negLL_5seq(doublePpl,2)]','color', [.65,.65,.65]);
hold on
 plot(repmat(1,size(LLDiff2seq)),LLDiff2seq,'o','MarkerFaceColor',Pallet{2,1},'color', Pallet{2,1}, 'Markersize', 8)
 hold on
 plot([.75,1.25], [median(LLDiff2seq),median(LLDiff2seq)], ':', 'color', Pallet{2,1},'Linewidth',5);
 plot(repmat(2,size(LLDiff5seq)),LLDiff5seq,'o','MarkerFaceColor',Pallet{3,1},'color', Pallet{3,1}, 'Markersize', 8)
 plot([1.75,2.25], [median(LLDiff5seq),median(LLDiff5seq)], ':', 'color', Pallet{3,1}, 'Linewidth', 5');
 plot([0,3],[0,0],'--k');
 ylabel({['\Delta Log Likilihood'],['']})
 
 set(gca,'xtick', [1,2])
 axis([0,3,-12,10]);
 set(gca, 'xticklabel',{'Set Size 2 Seq','Set Size 5 Seq'})
 set(gca, 'Fontsize',18)
 set(gcf,'Units','Inches');
 pos = get(gcf,'Position');
 set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
  saveas(gcf,['Fig10.pdf'])
  
  %% Fisher's exact of independence
         % Observed data
         
        x= table([sum(theSelectedPplMF(1,:)==1 & theSelectedPpl_seq(1,:)==1);sum(theSelectedPplMF(1,:)==2 & theSelectedPpl_seq(1,:)==1)],[sum(theSelectedPplMF(1,:)==1 & theSelectedPpl_seq(1,:)==2);sum(theSelectedPplMF(1,:)==2 & theSelectedPpl_seq(1,:)==2)],'VariableNames',{'AtD2Seq','DtA2Seq'},'RowNames',{'AtD2Sim','DtA2Sim'})
       [h,p2SimSeq]=fishertest(x)
      
       x= table([sum(theSelectedPplMF(2,:)==1 & theSelectedPpl_seq(2,:)==1);sum(theSelectedPplMF(2,:)==2 & theSelectedPpl_seq(2,:)==1)],[sum(theSelectedPplMF(2,:)==1 & theSelectedPpl_seq(2,:)==2);sum(theSelectedPplMF(2,:)==2 & theSelectedPpl_seq(2,:)==2)],'VariableNames',{'AtD5Seq','DtA5Seq'},'RowNames',{'AtD5Sim','DtA5Sim'})
       [h,p5SimSeq]=fishertest(x)

      
        x= table([sum(theSelectedPplMF(1,:)==1 & theSelectedPplMF(2,:)==1);sum(theSelectedPplMF(1,:)==2 & theSelectedPplMF(2,:)==1)],[sum(theSelectedPplMF(1,:)==1 & theSelectedPplMF(2,:)==2);sum(theSelectedPplMF(1,:)==2 & theSelectedPplMF(2,:)==2)],'VariableNames',{'AtD5Sim','DtA5Sim'},'RowNames',{'AtD2Sim','DtA2Sim'})
       [h,pSim]=fishertest(x)
       
              
       x= table([sum(theSelectedPpl_seq(1,:)==1 & theSelectedPpl_seq(2,:)==1);sum(theSelectedPpl_seq(1,:)==2 & theSelectedPpl_seq(2,:)==1)],[sum(theSelectedPpl_seq(1,:)==1 & theSelectedPpl_seq(2,:)==2);sum(theSelectedPpl_seq(1,:)==2 & theSelectedPpl_seq(2,:)==2)],'VariableNames',{'AtD5Seq','DtA5Seq'},'RowNames',{'AtD2Seq','DtA2Seq'})
       [h,pSeq]=fishertest(x)
       
       %%  Histogram processing For suppliment
     
     sizing=[-32.5:5:32.5]
    Indvals=nans(17,length(sizing)-1,3,3);
    Avgvals=nans(17,length(sizing)-1,3,3);
    IndvalsEarly=nans(17,length(sizing)-1,3,3);
    IndvalsLate=nans(17,length(sizing)-1,3,3);
    AvgvalsSeq=nans(17,length(sizing)-1,3,3);
    

    
    ttestSubInd=[];
    for subj=[1:17]
        for nump=1:3
            for delay=1:3
                figure(100)
                if size(totalResp{subj,2},1)>1
                    MeanErrInd(subj,delay,nump)=mean(totalResp{subj,2}{delay,nump,1});
                    STDErrInd(subj,delay,nump)=1.96*std(totalResp{subj,2}{delay,nump,1})/sqrt(length(totalResp{subj,2}{delay,nump,1}));
                    h=histogram(totalResp{subj,2}{delay,nump,1},sizing,'Normalization','probability');
                    [a,ttestSubInd(subj,delay,nump)]=ttest(totalResp{subj,2}{delay,nump,1});
                    ttestSubInd(subj,delay,nump)=min(1,ttestSubInd(subj,delay,nump)*(17*3*3+17*2*3+17*2*2+17*2*2+17*2*2));
                    Indvals(subj,:,delay,nump)=h.Values;
                end
                if nump>=2
                if size(totalResp{subj,3},1)>1
                      MeanErrAvg(subj,delay,nump)=mean(totalResp{subj,3}{delay,nump,2});
                    STDErrAvg(subj,delay,nump)=1.96*std(totalResp{subj,3}{delay,nump,2})/sqrt(length(totalResp{subj,3}{delay,nump,2}));
                    
                    h=histogram(totalResp{subj,3}{delay,nump,2},sizing,'Normalization','probability');
                    Avgvals(subj,:,delay,nump)=h.Values;
                end
                
                if delay>=2
               
                if size(totalResp{subj,5},1)>1
                    MeanErrIndE(subj,delay,nump)=mean(totalResp{subj,5}{delay,nump,1});
                    STDErrIndE(subj,delay,nump)=1.96*std(totalResp{subj,5}{delay,nump,1})/sqrt(length(totalResp{subj,5}{delay,nump,1}));
                    h=histogram(totalResp{subj,5}{delay,nump,1},sizing,'Normalization','probability');
                    IndvalsEarly(subj,:,delay,nump)=h.Values;
                end
                
                if size(totalResp{subj,8},1)>1
                    MeanErrIndL(subj,delay,nump)=mean(totalResp{subj,8}{delay,nump,1});
                    STDErrIndL(subj,delay,nump)=1.96*std(totalResp{subj,8}{delay,nump,1})/sqrt(length(totalResp{subj,8}{delay,nump,1}));
                    h=histogram(totalResp{subj,8}{delay,nump,1},sizing,'Normalization','probability');
                    IndvalsLate(subj,:,delay,nump)=h.Values;
                end
                
                if size(totalResp{subj,6},1)>1
                    MeanErrAvgSeq(subj,delay,nump)=mean(totalResp{subj,6}{delay,nump,2});
                    STDErrAvgSeq(subj,delay,nump)=1.96*std(totalResp{subj,6}{delay,nump,2})/sqrt(length(totalResp{subj,6}{delay,nump,2}));
                    h=histogram(totalResp{subj,6}{delay,nump,2},sizing,'Normalization','probability');
                    AvgvalsSeq(subj,:,delay,nump)=h.Values;
                end
                end
                end
                
                
            end
            
        end
    end
    
    clear ('mnIndVals','SEMIndVals','mnAvgVals', 'SEMAvgVals' )
    
   
    mnIndVals=nanmean(Indvals);
    SEMIndVals=nanstd(Indvals)/sqrt(sum(~isnan(Indvals(:,1,1,1)))-1);
    mnAvgVals=nanmean(Avgvals);
    SEMAvgVals=nanstd(Avgvals)/sqrt(sum(~isnan(Avgvals(:,1,1,2)))-1);
    

    mnIndvalsEarly=nanmean(IndvalsEarly);
    SEMIndvalsEarly=nanstd(IndvalsEarly)/sqrt(sum(~isnan(IndvalsEarly(:,1,1,1)))-1);
    mnIndvalsLate=nanmean(IndvalsLate);
    SEMIndvalsLate=nanstd(IndvalsLate)/sqrt(sum(~isnan(IndvalsLate(:,1,1,1)))-1);
    mnAvgvalsSeq=nanmean(AvgvalsSeq);
    SEMAvgvalsSeq=nanstd(AvgvalsSeq)/sqrt(sum(~isnan(AvgvalsSeq(:,1,1,2)))-1);
    %%
   PalletSup{1,1}=[126,0,226]/256;
PalletSup{1,2}=[172,110,238]/256;
PalletSup{1,3}=[212,184,242]/256;
PalletSup{2,1}= [0,250,255]/256;
PalletSup{2,3}=[120,214,217]/256;
PalletSup{2,2}=[180,255,255]/256;
 PalletSup{3,1}=[0,149,10]/256;
 PalletSup{3,2}=[84,189,84]/256;
 PalletSup{3,3}=[155,227,150]/256;
    %% Supplimental Fig 1, Histogram Graphing Seq
    

    for delay=1:3
        for nump=1:3
            if nump==3;
                nummy=5;
            else
                nummy=nump;
            end
            
            %Ind
            figure(11)
            subplot(4,3,nump)
            colormod=PalletSup{nump,delay};
            hold on; errorbar([-30:5:30],mnIndVals(1,:,delay,nump),SEMIndVals(1,:,delay,nump),'-o','color',colormod)
            xlabel('Err from Target (deg)');
            ylabel('% of Responses');
            title(['Perceved ', num2str(nummy), ' Angles'])
                    set(gca, 'Fontsize',12)

            axis([-30,30,0,.9])
            if nump>1
                subplot(4,3,nump+3)
                hold on; errorbar([-30:5:30],mnAvgVals(1,:,delay,nump),SEMAvgVals(1,:,delay,nump),'-*','color',colormod)
                axis([-30,30,0,.9])
                xlabel('Err from Mean (deg)');
                ylabel('% of Responses');
                title(['Computed Mean of ', num2str(nummy) ,' Angles'])
                axis([-30,30,0,.9])
                        set(gca, 'Fontsize',12)

            end
           
                        set(gca, 'Fontsize',12)

            end
    end
    subplot(4,3,1)
    title(['Perceved 1 Angle'])
    for i=1:3
        subplot(4,3,i)
                   

        legend ('0 Delay', '1s Delay','6s Delay','Location', 'NW');
        legend boxoff
    end
        
    
    
    for delay=2:3
        for nump=2:3
            if nump==3;
                nummy=5;
            else
                nummy=nump;
            end
            
           
            colormod=PalletSup{nump,delay};

                                    %Seq
                    subplot(4,3,7+3*(nump-2))
                    hold on; errorbar([-30:5:30],mnIndvalsEarly(1,:,delay,nump),SEMIndvalsEarly(1,:,delay,nump),'o-','color',colormod)
                    axis([-30,30,0,.9])
                    if nump==3
                        xlabel('Err from Target (deg) (Late is +)');
                     end
                        ylabel('% of Responses');
                    
                    title(['Early Perceived Angles, N= ', num2str(nummy)])
                   
                    axis([-30,30,0,.9])
                            set(gca, 'Fontsize',12)

                    subplot(4,3,8+3*(nump-2))
                    hold on; errorbar([-30:5:30],mnIndvalsLate(1,:,delay,nump),SEMIndvalsLate(1,:,delay,nump),'v-','color',colormod)
                           set(gca, 'Fontsize',12)

                    if nump==3
                    xlabel('Err from Target (deg)(Early is -)');
        end
                    title(['Late Perceived Angles, N= ', num2str(nummy)])
                    axis([-30,30,0,.9])
                    
                    subplot(4,3,9+3*(nump-2))
                    hold on; errorbar([-30:5:30],mnAvgvalsSeq(1,:,delay,nump), SEMAvgvalsSeq(1,:,delay,nump),'*-','color',colormod)
                    axis([-30,30,0,.9])
                    if nump==3
                    xlabel('Err from Mean (deg)(Late is +)');
                    end
                    title(['Seq: Computed Mean of ', num2str(nummy), ' Angles'])
                    axis([-30,30,0,.9])
                    
                           set(gca, 'Fontsize',12)

                end
                
    end
    



    
    
    
    
        set(gca, 'Fontsize',12)
set(gcf,'Units','Inches');
set(gcf,'Position',[9.4306    2.1806   13.3750   11.3889]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
 saveas(gcf,['FigS2.pdf']) 
%% Supplimental Figure 2:  Looking at error on A
figure(12)
subplot(2,2,1)
title('Set Size 2 Sim')
hold on
errorbar(find(theSelectedPpl(1,:)==1),AtD2Param(theSelectedPpl(1,:)==1,5),1.96*SEMAtD2Param(theSelectedPpl(1,:)==1,5),'sk')
errorbar(find(theSelectedPpl(1,:)==2),DtA2Param(theSelectedPpl(1,:)==2,5),1.96*SEMDtA2Param(theSelectedPpl(1,:)==2,5),'dk')
plot(find(theSelectedPpl(1,:)==1),AtD2Param(theSelectedPpl(1,:)==1,5),'sk','Markersize',5)
plot([0,17],[0,0],'--k')
plot([0,17],[1,1],'--r')
axis([0,18,-2,3]);
ylabel('Model-fit A')
 set(gca, 'Fontsize',12)

subplot(2,2,2)
title('Set Size 5 Sim')
hold on
errorbar(find(theSelectedPpl(2,:)==1),AtD5Param(theSelectedPpl(2,:)==1,5),1.96*SEMAtD5Param(theSelectedPpl(2,:)==1,5),'sk')
errorbar(find(theSelectedPpl(2,:)==2),DtA5Param(theSelectedPpl(2,:)==2,5),1.96*SEMDtA5Param(theSelectedPpl(2,:)==2,5),'dk')
plot(find(theSelectedPpl(2,:)==1),AtD5Param(theSelectedPpl(2,:)==1,5),'sk','Markersize',5)
plot([0,17],[0,0],'--k')
plot([0,17],[1,1],'--r')
axis([0,18,-2,3]);
 set(gca, 'Fontsize',12)
 legend('AtD subject', 'DtA subject', 'location', 'SW');

 subplot(2,2,3)
title('Set Size 2 Seq')
hold on
errorbar(find(theSelectedPpl_seqFirst(1,:)==1),AtDParam2Seq(theSelectedPpl_seqFirst(1,:)==1,5),1.96*SEMSeq2AtD(theSelectedPpl_seqFirst(1,:)==1,5),'sk')
errorbar(find(theSelectedPpl_seqFirst(1,:)==2),DtAParam2Seq(theSelectedPpl_seqFirst(1,:)==2,5),1.96*SEMSeq2DtA(theSelectedPpl_seqFirst(1,:)==2,5),'dk')
plot(find(theSelectedPpl_seqFirst(1,:)==1),AtDParam2Seq(theSelectedPpl_seqFirst(1,:)==1,5),'sk','Markersize',5)
plot([0,17],[0,0],'--k')
plot([0,17],[1,1],'--r')
ylabel('Model-fit A')
xlabel('Subject');
axis([0,18,-2,3]);
 set(gca, 'Fontsize',12)

subplot(2,2,4)
title('Set Size 5 Seq')
hold on
errorbar(find(theSelectedPpl_seqFirst(2,:)==1),AtDParam5Seq(theSelectedPpl_seqFirst(2,:)==1,5),1.96*SEMSeq5AtD(theSelectedPpl_seqFirst(2,:)==1,5),'sk')
errorbar(find(theSelectedPpl_seqFirst(2,:)==2),DtAParam5Seq(theSelectedPpl_seqFirst(2,:)==2,5),1.96*SEMSeq5DtA(theSelectedPpl_seqFirst(2,:)==2,5),'dk')
plot(find(theSelectedPpl_seqFirst(2,:)==1),AtDParam5Seq(theSelectedPpl_seqFirst(2,:)==1,5),'sk','Markersize',5)
plot([0,17],[0,0],'--k')
plot([0,17],[1,1],'--r')
xlabel('Subject');
axis([0,18,-2,3]);
 set(gca, 'Fontsize',12)


 set(gca, 'Fontsize',12)
set(gcf,'Units','Inches');
%set(gcf,'Position',[9.4306    5.5000   11.2639    8.0694]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS3.pdf']) 


%% Sup Fig 1?  CI of Mean of err
figure(13)
for nump=1:3
    for delay=1:3
subplot(3,3,nump+3*(delay-1)) 
set(gca, 'Fontsize',12)

Nooverlap=(MeanErrInd(:,delay,nump)-STDErrInd(:,delay,nump))>0 | MeanErrInd(:,delay,nump)+STDErrInd(:,delay,nump)<0;
errorbar(find(Nooverlap),MeanErrInd(Nooverlap,delay,nump),STDErrInd(Nooverlap,delay,nump),'ok', 'MarkerFaceColor','k')
hold on
    errorbar(find(~Nooverlap),MeanErrInd(~Nooverlap,delay,nump),STDErrInd(~Nooverlap,delay,nump),'ok'); 
   plot([0,17],[0,0],'--k');
   xlim([-.5,17.5]);
    end
end
subplot(3,3,1)
title('1 point')
ylabel({['0 s delay'],['Mean Error (deg)']})
subplot(3,3,2)
title('2 points')
subplot(3,3,3)
title('5 points');
subplot(3,3,4);
ylabel({['1 s delay'],['Mean Error (deg)']})
subplot(3,3,7)
ylabel({['6 s delay'],['Mean Error(deg)']})
xlabel('Subject')
subplot(3,3,8)
xlabel('Subject')
subplot(3,3,9)
xlabel('Subject')
set(gcf,'Units','Inches');
set(gcf,'Position',[6.2083    7.4583   11.0000    6.1111]);
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS1.pdf']) 
%%
figure(14)
for nump=2:3
    for delay=1:3
subplot(3,2,(nump-1)+2*(delay-1)) 


Nooverlap=(MeanErrAvg(:,delay,nump)-STDErrAvg(:,delay,nump))>0 | MeanErrAvg(:,delay,nump)+STDErrAvg(:,delay,nump)<0;
errorbar(find(Nooverlap),MeanErrAvg(Nooverlap,delay,nump),STDErrAvg(Nooverlap,delay,nump),'ok', 'MarkerFaceColor','k')
hold on
    errorbar(find(~Nooverlap),MeanErrAvg(~Nooverlap,delay,nump),STDErrAvg(~Nooverlap,delay,nump),'ok'); 
   plot([0,17],[0,0],'--k');
   xlim([-.5,17.5]);
   set(gca, 'Fontsize',12)
    end
end

subplot(3,2,1)
title('2 points')
ylabel({['0 s delay'],['Mean Error (deg)']})
subplot(3,2,2)
title('5 points');
subplot(3,2,3);
ylabel({['1 s delay'],['Mean Error (deg)']})
subplot(3,2,5)
ylabel({['6 s delay'],['Mean Error(deg)']})
xlabel('Subject')
subplot(3,2,6)
xlabel('Subject')

set(gcf,'Units','Inches');
% set(gcf,'Position',[6.2083    7.4583   11.0000    6.1111]);
pos = get(gcf,'Position');

set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS1b.pdf']) 
%%
figure(15)
for nump=2:3
    for delay=2:3
subplot(2,2,(nump-1)+2*(delay-2)) 


Nooverlap=(MeanErrIndE(:,delay,nump)-STDErrIndE(:,delay,nump))>0 | MeanErrIndE(:,delay,nump)+STDErrIndE(:,delay,nump)<0;
errorbar(find(Nooverlap),MeanErrIndE(Nooverlap,delay,nump),STDErrIndE(Nooverlap,delay,nump),'ok', 'MarkerFaceColor','k')
hold on
    errorbar(find(~Nooverlap),MeanErrIndE(~Nooverlap,delay,nump),STDErrIndE(~Nooverlap,delay,nump),'ok'); 
   plot([0,17],[0,0],'--k');
   xlim([-.5,17.5]);
   set(gca, 'Fontsize',12)
    end
end

subplot(2,2,1)
title('2 points')
ylabel({['0 s delay'],['Mean Error (deg)']})
subplot(2,2,2)
title('5 points');
subplot(2,2,3);
ylabel({['1 s delay'],['Mean Error (deg)']})
xlabel('Subject')
subplot(2,2,4)
ylabel({['6 s delay'],['Mean Error(deg)']})
xlabel('Subject')

set(gcf,'Units','Inches');
% set(gcf,'Position',[6.2083    7.4583   11.0000    6.1111]);
pos = get(gcf,'Position');

set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS1c.pdf']) 

%%
figure(16)
for nump=2:3
    for delay=2:3
subplot(2,2,(nump-1)+2*(delay-2)) 


Nooverlap=(MeanErrIndL(:,delay,nump)-STDErrIndL(:,delay,nump))>0 | MeanErrIndL(:,delay,nump)+STDErrIndL(:,delay,nump)<0;
errorbar(find(Nooverlap),MeanErrIndL(Nooverlap,delay,nump),STDErrIndL(Nooverlap,delay,nump),'ok', 'MarkerFaceColor','k')
hold on
    errorbar(find(~Nooverlap),MeanErrIndL(~Nooverlap,delay,nump),STDErrIndL(~Nooverlap,delay,nump),'ok'); 
   plot([0,17],[0,0],'--k');
   xlim([-.5,17.5]);
   set(gca, 'Fontsize',12)
    end
end

subplot(2,2,1)
title('2 points')
ylabel({['1 s delay'],['Mean Error (deg)']})
subplot(2,2,2)
title('5 points');
subplot(2,2,3);
ylabel({['6 s delay'],['Mean Error (deg)']})
xlabel('Subject')
subplot(2,2,4)
xlabel('Subject')

set(gcf,'Units','Inches');
% set(gcf,'Position',[6.2083    7.4583   11.0000    6.1111]);
pos = get(gcf,'Position');

set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS1d.pdf']) 

%%
figure(17)
for nump=2:3
    for delay=2:3
subplot(2,2,(nump-1)+2*(delay-2)) 


Nooverlap=(MeanErrAvgSeq(:,delay,nump)-STDErrAvgSeq(:,delay,nump))>0 | MeanErrAvgSeq(:,delay,nump)+STDErrAvgSeq(:,delay,nump)<0;
errorbar(find(Nooverlap),MeanErrAvgSeq(Nooverlap,delay,nump),STDErrAvgSeq(Nooverlap,delay,nump),'ok', 'MarkerFaceColor','k')
hold on
    errorbar(find(~Nooverlap),MeanErrAvgSeq(~Nooverlap,delay,nump),STDErrAvgSeq(~Nooverlap,delay,nump),'ok'); 
   plot([0,17],[0,0],'--k');
   xlim([-.5,17.5]);
   set(gca, 'Fontsize',12)
    end
end

subplot(2,2,1)
title('2 points')
ylabel({['1 s delay'],['Mean Error (deg)']})
subplot(2,2,2)
title('5 points');
subplot(2,2,3);
ylabel({['6 s delay'],['Mean Error (deg)']})
xlabel('Subject')
subplot(2,2,4)
xlabel('Subject')

set(gcf,'Units','Inches');
% set(gcf,'Position',[6.2083    7.4583   11.0000    6.1111]);
pos = get(gcf,'Position');

set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS1e.pdf']) 
%% Strat And Age Plot
pplOfInt=theSelectedPplMF(:,:)<3;
load('Ages.mat')
figure(18)
subplot(1,2,1)
PeepsOfInt2=pplOfInt(1,:) & ~isnan(Ages);
plot(Ages(PeepsOfInt2),[LL2(PeepsOfInt2,1)-LL2(PeepsOfInt2,2)],'o','color', Pallet{2,1}, 'MarkerFaceColor', Pallet{2,1})
[r2,p2]=corrcoef(Ages(PeepsOfInt2), [LL2(PeepsOfInt2,1)-LL2(PeepsOfInt2,2)])
hold on
PeepsOfInt5=pplOfInt(2,:) & ~isnan(Ages);
plot(Ages(PeepsOfInt5),[LL5(PeepsOfInt5,1)-LL5(PeepsOfInt5,2)],'o','color', Pallet{3,1}, 'MarkerFaceColor', Pallet{3,1})
[r5,p5]=corrcoef(Ages(PeepsOfInt5), [LL5(PeepsOfInt5,1)-LL5(PeepsOfInt5,2)])
 ylabel({['\Delta Log Likilihood'],['']})

hold on

legend('Set Size 2', 'Set Size 5')
% set(gca,'ytick', [1,2])
% set(gca, 'yticklabel',{'AtD','DtA'})
xlabel('Age (yrs)');
title('Simultaneous')
% axis([18,88,.5,2.5])
set(gca, 'fontsize', 16)


subplot(1,2,2)
pplOfIntseq=theSelectedPpl_seq(:,:)<3;
load('Ages.mat')


PeepsOfInt2seq=pplOfIntseq(1,:) & ~isnan(Ages);
plot(Ages(PeepsOfInt2seq),[negLL_2seq(PeepsOfInt2seq,1)-negLL_2seq(PeepsOfInt2seq,2)],'o','color', Pallet{2,1}, 'MarkerFaceColor', Pallet{2,1})
[r2seq,p2seq]=corrcoef(Ages(PeepsOfInt2seq), [negLL_2seq(PeepsOfInt2seq,1)-negLL_2seq(PeepsOfInt2seq,2)])
hold on
PeepsOfInt5seq=pplOfIntseq(2,:) & ~isnan(Ages);
plot(Ages(PeepsOfInt5),[negLL_5seq(PeepsOfInt5,1)-negLL_5seq(PeepsOfInt5,2)],'o','color', Pallet{3,1}, 'MarkerFaceColor', Pallet{3,1})
[r5,p5]=corrcoef(Ages(PeepsOfInt5), [negLL_5seq(PeepsOfInt5,1)-negLL_5seq(PeepsOfInt5,2)])
set(gca, 'fontsize', 16)
set(gcf,'Units','Inches');
  set(gcf,'Position',[1.3889    7.8333   12.2639    5.8333]);
pos = get(gcf,'Position');
title('Sequential')
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
saveas(gcf,['FigS4.pdf']) 

%%
figure(19)
subplot(1,2,1)
plot(Ages,AtD2Param(:,1),'or')
hold on
plot(Ages, AtD5Param(:,2)+.1, 'ob')
xlabel('Age (yrs)')
ylabel('\eta_1')
set(gca, 'fontsize',16)
[r,p]=corrcoef(Ages(~isnan(Ages)), theSelectedPpl(1,~isnan(Ages))')
[r,p]=corrcoef(Ages(~isnan(Ages)), theSelectedPpl(2,~isnan(Ages))')
