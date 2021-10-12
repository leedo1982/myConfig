local obj = {}

function obj:init(key)

    local app_mode = hs.hotkey.modal.new()

    app_mode:bind({}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():previous()) end)
    app_mode:bind({'shift'}, 'tab', function () focusScreen(hs.window.focusedWindow():screen():next()) end)

    app_mode:bind({}, ';', function() hs.window.focusedWindow():focusWindowWest() end)
    app_mode:bind({}, '/', function() hs.window.focusedWindow():focusWindowSouth() end)
    app_mode:bind({}, '[', function() hs.window.focusedWindow():focusWindowNorth() end)
    app_mode:bind({}, '\'', function() hs.window.focusedWindow():focusWindowEast() end)

    function app_focus(name)
        return function()
            hs.application.launchOrFocus(name)
            local screen = hs.window.focusedWindow():frame()
            local pt = hs.geometry.rectMidPoint(screen)
            hs.mouse.setAbsolutePosition(pt)
            app_mode.triggered = true
        end
    end

    app_mode:bind({}, 'c', app_focus('Google Chrome'))
    app_mode:bind({}, 'f', app_focus('Safari'))
    app_mode:bind({}, 'i', app_focus('IntelliJ IDEA'))
    app_mode:bind({}, 'l', app_focus('Line'))
    app_mode:bind({}, 'q', app_focus('Sequel Pro'))
    app_mode:bind({}, 'v', app_focus('MacVim'))
    app_mode:bind({}, 'm', app_focus('Notes'))
    app_mode:bind({}, 'r', app_focus('Reminders'))
    app_mode:bind({}, 'e', app_focus('Emacs'))
    app_mode:bind({}, 't', app_focus('iTerm'))
    app_mode:bind({'shift'}, 's', app_focus('Slack'))
    app_mode:bind({}, 's', function()
        app_focus('Slack')()
        hs.timer.usleep(100)
        hs.eventtap.keyStroke({'cmd'}, 'k')
        app_mode.triggered = true
    end)

    local on_app_mode = function() app_mode:enter() end
    local on_app_mode = function()
        app_mode.triggered = false
        app_mode:enter()
    end

    local off_app_mode = function()
        app_mode:exit()
        -- if not app_mode.triggered then
        --     hs.eventtap.keyStroke({'shift'}, 'F14')
        -- end
    end

    hs.hotkey.bind({}, key, on_app_mode, off_app_mode)
end

function focusScreen(screen)
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()

  -- Move mouse to center of screen
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end

return obj
