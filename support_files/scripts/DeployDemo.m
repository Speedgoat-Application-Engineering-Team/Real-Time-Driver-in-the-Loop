try
    myRTAppFolder = fullfile(projectRoot, 'system');
    cd(myRTAppFolder)
    tg=slrealtime;
    tg.connect;
    tg.load('DriverInLoopSpeedgoat');
    %tg.start;
    %do not start simulation from the command line. otherwise the stop button is not
    %available, and MATLAB may crash if unreal engine is closed manually
    open_system('DriverInLoopGamingEngine.slx')
    cd(projectRoot)
catch errormsg
    warning('Something went wrong. Please retry using manual steps (rebuild model).')
    rethrow(errormsg);
end