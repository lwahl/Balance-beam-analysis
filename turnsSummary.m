myFolder = uigetdir(); % or 'C:\Users\yourUserName\Documents\My Pictures' or whatever...

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*turn2.mat'); % Change to whatever pattern your files have in your classifier output.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  
  load(baseFileName);
  
  slipBoutStartFrames = allScores.t0s;
  slipBoutStopFrames = allScores.t1s;
  
   a = size(allScores.t0s{1,1});
  amountOfSlips = a(1,2);
  clear a;
  
  Turn_scores_summary{1,1} = 'File Name';
  Turn_scores_summary{1,2} = 'Amount of turns';
  Turn_scores_summary{1,3} = 'Start frames of turns -->';
  
  Turn_scores_summary{1+k,1} = baseFileName;
  Turn_scores_summary{1+k,2} = amountOfTurns;

  
    for m = 1 : length(turnBoutStartFrames{1,1})
  
    Turn_scores_summary{1+k,2+m} =   turnBoutStartFrames{1,1}(1,m);
    end  
  

 
end

%saving all data in an excel file
nameOfVariable = 'Turn_scores_summary';
outputFolder = uigetdir();
fullPath=fullfile([char(outputFolder)], [nameOfVariable '.xls']);
xlswrite(fullPath, Turn_scores_summary);

msgbox('Done!');


