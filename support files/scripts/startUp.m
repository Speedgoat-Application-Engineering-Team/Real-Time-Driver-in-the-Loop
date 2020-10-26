%   About this script:
%      -  Sets up the environment for a flawless execution of the demo 
%      -  Set to run at startup

% Use Simulink Project API to get the current project:
p = slproject.getCurrentProject;
projectRoot = p.RootFolder;
parentfolder = fullfile(projectRoot,'\support files');

% Create bin folder if not exisiting yet
myCacheFolder = fullfile(projectRoot, 'support files\bin');
if ~isfolder(myCacheFolder)
    mkdir(parentfolder,'bin')
end

% Set ChacheFolder and CodeGenFolder to bin
Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
   'CodeGenFolder', myCacheFolder);

load('RealTimeConfig')

% Open reference application getting started doc file 
edit('GettingStarted')

% Open demo system model 
% try
%     open_system('DriverInLoopSpeedgoat.slx')
%     open_system('DriverInLoopGamingEngine.slx')
% catch
%     %operation failed
%    warning('Could not open system model');
% end