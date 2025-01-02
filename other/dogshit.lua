loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/notification.lua'),true))()
local function identifyExecutor()
    if identifyexecutor then
        return identifyexecutor()
    else
        return "Unknown"
    end
end
-- nigga exploits
    if identifyExecutor() == "Xeno" then
        CreateNotification({
            Title = 'Xeno',
            Content = 'Xeno has limited functions and has fake unc, expect some bugs.',
            Length = 5,
            Buttons = {
                [1] = {
                    Title = 'Dismiss',
                    ClosesUI = true,
                    Callback = function() end
                }
            }
        })
    else
    if identifyExecutor() == "FluxTeam" then
        CreateNotification({
            Title = 'FluxTeam',
            Content = 'FluxTeam has limited functions and has fake unc, expect some bugs.',
            Length = 5,
            Buttons = {
                [1] = {
                    Title = 'Dismiss',
                    ClosesUI = true,
                    Callback = function() end
                }
            }
        })    
    else
        if identifyExecutor() == "Solara" then
            CreateNotification({
                Title = 'Solara',
                Content = 'Solara has limited functions, expect some bugs.',
                Length = 5,
                Buttons = {
                    [1] = {
                        Title = 'Dismiss',
                        ClosesUI = true,
                        Callback = function() end
                    }
                }
            })    
            else
                if identifyExecutor() == "JJSploit" then
                    CreateNotification({
                        Title = 'JJSploit',
                        Content = 'JJSploit has limited functions and uses Xenos technology, expect some bugs.',
                        Length = 5,
                        Buttons = {
                            [1] = {
                                Title = 'Dismiss',
                                ClosesUI = true,
                                Callback = function() end
                            }
                        }
                    })    
                    else
                        if identifyExecutor() == "Zorara" then
                            CreateNotification({
                                Title = 'Zorara',
                                Content = 'Zorara has limited functions and fake unc, expect some bugs.',
                                Length = 5,
                                Buttons = {
                                    [1] = {
                                        Title = 'Dismiss',
                                        ClosesUI = true,
                                        Callback = function() end
                                    }
                                }
                            })    
                    else
                end
            end
        end
    end
end