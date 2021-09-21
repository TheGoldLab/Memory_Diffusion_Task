function [totalFitParam, totalFitParamErrs, totalVarHolder,totalnumTrials, totalMnHolder,totalAbErrHolder,totalResps,BiasHolder,WhichSet]=MDTAnalysis(compiled, sub, totalVarHolder,totalnumTrials,totalMnHolder,totalAbErrHolder,totalResps,BiasHolder,WhichSet,totalFitParam, totalFitParamErrs)
% This function takes the compiled subject data across blocks and begins to
% parse them for analysis.  It ultimately produces a series of structure with rows of subjects
% and colulumns of blocks 
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

%For each block it isolates the Empirical Diffusion
% constants used for figures 4 and 8 (totalFitParam), Error estimates on
% these slopes (totalFitParamErrs), the variance for a given delay, setsize
% and conditon (totalVarHolder), total number of trials for that set
% size/delay/condition (totalnumTrials), the mean error (totalMnHolder)
% the mean absolute error, not currently used (totalAbErrHolder)
% all the responses for a trial type (totalResps), 
% a measure of how biased a response is to the early points (BiasHolder)
% and which of the 5 preselected angle sets a trial came from (WhichSet).

Blocks=1:10;
delays=[0,1,6];
pts=[1,2,5];


for b=Blocks
    BiasCheck=[];
    SetNum=[];
    Fitparam=[];
    RepHolder=cell(3,3,2); 
    if b<=4  %continous blocks
        TOI_block=[compiled.exptType]==b-1 & [compiled.tempDelay]==0;
    elseif b<=7 %Early temp delay
        TOI_block=[compiled.exptType]==b-4 & [compiled.tempDelay]==1 & [compiled.Corr]~=[compiled.pts]-1;
    else %late temp delay
        TOI_block=[compiled.exptType]==b-7 & [compiled.tempDelay]==1 & [compiled.Corr]==[compiled.pts]-1;    end
    
    %if there are more than 5 trials of a particular block type:
    if sum(TOI_block)<5
        %Fill in NaN's for the summary statistics
        for a=1:3
            for c=1:2
                totalFitParam{sub,b}{a,c}=nans(1,2);
                totalforgEq{sub,b}{a,c}=nans(1,2);
                
                totalVarHolder{sub,b}=nan(3,3,2);
                totalAbErrHolder{sub,b}=nan(3,3,2);
            end
        end
        
        %if there are at least 5 trials in the block type:
    else
        VAR=nans(3,3,2);
        for p=1:length(pts)
            for RespType=1:2
%                 if b>4
%                    delays=[1,6];
%                 else
%                    delays=[0,1,6];
%                 end
                Mega=nans(1000,length(delays));
                
                for d=1:length(delays)
                    
                    if RespType==1
                        TOIType=[compiled.Corr]<6;
                    else
                        TOIType=[compiled.Corr]==6;
                    end
                    TOI=compiled.thedelay==delays(d) & compiled.pts==pts(p) & TOI_block & TOIType;
                    

                    err1=degAngDiff(compiled.CorrTarg(TOI),compiled.guess(TOI));
                    
                    if p==2 && (b==6 || b==7) && d>=2 && RespType>1
                    BiasHolderPart=round(degAngDiff(compiled.Targ1(TOI),compiled.Targ2(TOI)));
                    AnswerLocation=degAngDiff(compiled.guess(TOI),compiled.Targ2(TOI))./BiasHolderPart;
                    BiasCheck{d,p}=AnswerLocation(abs(err1)<30);
                    temp=BiasHolderPart;
                    SetNum{d,p}=temp(abs(err1)<30);
                    elseif p==3 && (b==6 || b==7) && d>=2 && RespType>1
                    BiasHolderPart=ceil(degAngDiff(meanangle([compiled.Targ1(TOI),compiled.Targ2(TOI),compiled.Targ3(TOI),compiled.Targ4(TOI)],2),compiled.Targ5(TOI))) ;
                    AnswerLocation=degAngDiff(compiled.guess(TOI),compiled.Targ5(TOI))./BiasHolderPart;
                    BiasCheck{d,p}=AnswerLocation(abs(err1)<30);
                    temp=BiasHolderPart;
                    SetNum{d,p}=temp(abs(err1)<30);
                    end
                    err1=err1(abs(err1)<30);
                    
                    
                    MN(d,p,RespType)=nanmean((err1));
                    AbErr(d,p,RespType)=nanmean(abs(err1));

                    RepHolder{d,p,RespType}=err1';
                    VAR(d,p,RespType)=nanvar(err1); 
                    numTrials(d,p,RespType)=length(err1);
                      resamp=[];
                  % Resample a bunch of times to get an idea of the uncertainty on the variance      
                        for boots=1:1000
                            resamp(:,boots)=datasample(err1,length(err1));
                            Mega(boots,d)=nanvar(resamp(:,boots));
                        end
                    TimeHolder{d,p,RespType}=ones(size(err1'))*delays(d);

                end
                
                % Fit a line to the variance
                % Now using formulat for best fit
              
                if sum(TOI)>2
                    %Find the SE of Variance for the points you are fitting
                    SEofVar=std(Mega);
                    %Use formulat to find best fit line weighted by
                    %uncertaqinty for these points
                         if b<4

                             x=delays(1:end);
                             y=VAR(:,p,RespType)';
                             e=SEofVar;

                             
                         elseif b==8
                             x=delays(2:end)./2;
                             y=VAR(2:end,p,RespType)';
                             e=SEofVar(2:end);
                         else
                            x=delays(2:end);
                             y=VAR(2:end,p,RespType)';
                             e= SEofVar(2:end);
                         end
                     
                         
                          options = optimset('Display','off','MaxFunEvals',5000);

                         findparams=@(b) sum((y-(b(2)+b(1)*x)).^2);
                   nonbooty=fmincon(@(b)findparams(b),[4,13],[],[],[],[],[],[],[],options);
                         
               slope=(sum(x./e.^2)*sum(y./e.^2)-sum(x.*y./e.^2)*sum(1./e.^2))/...
                                 ((sum(x./e.^2))^2-sum(x.^2./e.^2)*sum(1./e.^2));
                             
               intercept= (sum(x.*y./e.^2)-slope*sum(x.^2./e.^2))/...
                   sum(x./e.^2);
               
               SlopeErr= sqrt(sum(1./e.^2)/(sum(x.^2./e.^2)*sum(1./e.^2)-(sum(x./e.^2))^2));
               
               InterceptErr= sqrt(sum(x.^2./e.^2)/ (sum(x.^2./e.^2)*sum(1./e.^2)-(sum(x./e.^2))^2  ) );
                    

                    %
                    
%                      for i=1:length(Mega)
%                          if b<4
%                         [p2,~]=polyfit(delays(1:end),Mega(i,1:end),1);
%                         megap(i,:,RespType)=p2;
%                          elseif b==8
%                        [p2,~]=polyfit(delays(2:end)./2,Mega(i,2:end),1);
%                         megap(i,:,RespType)=p2;   
%                          else
%                         [p2,~]=polyfit(delays(2:end),Mega(i,2:end),1);
%                         megap(i,:,RespType)=p2;
%                          end
%                          
%                      end
                    
                    %Take the mean slope found in all the bootstrap itterations
                   % Fitparam{p,RespType}=mean(megap(:,:,RespType));
                    Fitparam{p,RespType}=nonbooty;
                    FitParamErrs{p,RespType}=[SlopeErr,InterceptErr];
                    %Fit function of Error=time*b1+b0;, used as forgetting Equation.
                    %Note: NOT where get slope of Var as fxn of time.
                    errs=abs([RepHolder{2:end,p,RespType}]);
                    times=[TimeHolder{2:end,p,RespType}];

                    
                   
                else
                        MN(d,p,RespType)=NaN;
                        AbErr(d,p,RespType)=NaN;

                end
            end
        end
        
        
        
        %% Package ofsdff info of interest
totalFitParam{sub,b}=Fitparam;
totalFitParamErrs{sub,b}=FitParamErrs;
        totalVarHolder{sub,b}=VAR;
        totalMnHolder{sub,b}=MN;
        totalAbErrHolder{sub,b}=AbErr;
        totalnumTrials{sub,b}=numTrials;
        totalResps{sub,b}=RepHolder;
        BiasHolder{sub,b}=BiasCheck;
        WhichSet{sub,b}=SetNum;
        
%         figure(11+sub)
%     
%         hold on
%         if b==2    subplot(1,2,1)
%             hold on
%         plot([0,1,6],VAR(:,1,1),'ro')
%         plot([0,1,6],VAR(:,3,1),'bo')
%         plot([0,1,6],VAR(:,2,1),'go')
%         axis([0,6,0,150]);
%         elseif b==3
%             subplot(1,2,1)
%             hold on
%         plot([0,1,6],VAR(:,1,2),'rd')
%         plot([0,1,6],VAR(:,3,2),'bd')
%         plot([0,1,6],VAR(:,2,2),'gd')
%                 axis([0,6,0,150]);
%         elseif b==1
%             subplot(1,2,1)
%             hold on
%                  plot([0,1,6],VAR(:,1,1),'ks')
%                          axis([0,6,0,150]);
%         elseif b==4;
%             subplot(1,2,2)
%             hold on
%         plot([0,1,6],VAR(:,1,1),'ro')
%         plot([0,1,6],VAR(:,3,1),'bo')
%         plot([0,1,6],VAR(:,2,1),'go')
%         plot([0,1,6],VAR(:,1,2),'rd')
%         plot([0,1,6],VAR(:,3,2),'bd')
%         plot([0,1,6],VAR(:,2,2),'gd')
%         axis([0,6,0,150]);
%         end
%         
%                 
%                 
%         title(compiled.participant(1));
%         
        
    end
end
end

