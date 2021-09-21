% This file combines all the individual sessions of a subject into a single
% file (Compiled) which is used for further analysis

cd '/Users/KAS/Documents/MATLAB/MGSData'
SubjectsToParse=dir('*Sub*');
subjects={SubjectsToParse.name};

for i=1:length(subjects)
    s=dir(fullfile(subjects{i}, '*_MGS*'));
    
files={s.name};
compiled=[];

for jj=1:length(files);  %For all the files
   a=readtable((fullfile( subjects{i}, files{jj}))); 
   compiled=[compiled;a];
end
cd(fullfile(subjects{i}));
save([subjects{i},'_compiled'],'compiled');
cd '/Users/KAS/Documents/MATLAB/MGSData'
end