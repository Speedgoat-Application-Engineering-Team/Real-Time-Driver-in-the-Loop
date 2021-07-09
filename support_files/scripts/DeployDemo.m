try
    myRTAppFolder = fullfile(projectRoot, 'system');
    cd(myRTAppFolder);
    rtwbuild('DriverInLoopSpeedgoat');
    tg=slrealtime;
    tg.connect;
    tg.load('DriverInLoopSpeedgoat');
    open_system('DriverInLoopGamingEngine.slx')
    cd(projectRoot)
catch errormsg
    warning('Something went wrong. Please retry using manual steps.')
    rethrow(errormsg);
end
