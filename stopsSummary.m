myFolder = uigetdir(); % or 'C:\Users\yourUserName\Documents\My Pictures' or whatever...

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*sTOPPING.mat'); % Change to whatever pattern your files have in your classifier output.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  
  load(baseFileName);
  
  stopBoutStartFrames = allScores.t0s;
  stopBoutStopFrames = allScores.t1s;
  
   a = size(allScores.t0s{1,1});
  amountOfStops = a(1,2);
  clear a;
  
  Stop_scores_summary{1,1} = 'File Name';
  Stop_scores_summary{1,2} = 'Amount of stops';
  Stop_scores_summary{1,3} = 'Start frames of stops -->';
  
  Stop_scores_summary{1+k,1} = baseFileName;
  Stop_scores_summary{1+k,2} = amountOfStops;

  
    for m = 1 : length(stopBoutStartFrames{1,1})
  
    Stop_scores_summary{1+k,2+m} =   stopBoutStartFrames{1,1}(1,m);
    end  
  

 
end

%saving all data in an excel file
nameOfVariable = 'Stop_scores_summary';
outputFolder = uigetdir();
fullPath=fullfile([char(outputFolder)], [nameOfVariable '.xls']);
xlswrite(fullPath, Stop_scores_summary);

msgbox('Done!');


