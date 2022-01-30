function [ PropMatch ] = JoshAnalysis( NumAtD, PerAtD,PerDtA )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% 1 is an AtD subject, 0 is a DtA subject

PropMatch=zeros(1,35);
for propAtD=0:34
    for itterations=1:10000
    CurrentAssignments=[];
    RevisedAssignments=[];
    %pick initiatial assignment for each of the 17 subjects;
    FlippedFirstCoin=rand(1,17);
    CurrentAssignments=FlippedFirstCoin<propAtD/34;
    RevisedAssignments=CurrentAssignments;
    %Reflip according to PerAtD and PerDtA


    RevisedAssignments(CurrentAssignments(1,:)==1) = RevisedAssignments(CurrentAssignments(1,:)==1).*(rand(1,sum(CurrentAssignments(1,:)==1))<PerAtD);
    RevisedAssignments(CurrentAssignments(1,:)==0) = RevisedAssignments(CurrentAssignments(1,:)==0)+(rand(1,sum(CurrentAssignments(1,:)==0))>PerDtA);
    PropMatch(propAtD+1)=PropMatch(propAtD+1)+(sum(RevisedAssignments)==NumAtD);
    end
end

PropMatch=PropMatch/10000/sum(PropMatch/10000);

end

